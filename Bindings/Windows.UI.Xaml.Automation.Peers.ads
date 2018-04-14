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
limited with Windows.UI.Xaml.Controls.Primitives;
limited with Windows.UI.Xaml.Controls;
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.UI.Xaml.Automation.Provider;
--------------------------------------------------------------------------------
package Windows.UI.Xaml.Automation.Peers is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AccessibilityView is (
      Raw,
      Control,
      Content
   );
   for AccessibilityView use (
      Raw => 0,
      Control => 1,
      Content => 2
   );
   for AccessibilityView'Size use 32;
   
   type AccessibilityView_Ptr is access AccessibilityView;
   
   type AutomationControlType is (
      Button,
      Calendar,
      CheckBox,
      ComboBox,
      Edit,
      Hyperlink,
      Image,
      ListItem,
      List,
      Menu,
      MenuBar,
      MenuItem,
      ProgressBar,
      RadioButton,
      ScrollBar,
      Slider,
      Spinner,
      StatusBar,
      Tab,
      TabItem,
      Text,
      ToolBar,
      ToolTip,
      Tree,
      TreeItem,
      Custom,
      Group,
      Thumb,
      DataGrid,
      DataItem,
      Document,
      SplitButton,
      Window,
      Pane,
      Header,
      HeaderItem,
      Table,
      TitleBar,
      Separator,
      SemanticZoom,
      AppBar
   );
   for AutomationControlType use (
      Button => 0,
      Calendar => 1,
      CheckBox => 2,
      ComboBox => 3,
      Edit => 4,
      Hyperlink => 5,
      Image => 6,
      ListItem => 7,
      List => 8,
      Menu => 9,
      MenuBar => 10,
      MenuItem => 11,
      ProgressBar => 12,
      RadioButton => 13,
      ScrollBar => 14,
      Slider => 15,
      Spinner => 16,
      StatusBar => 17,
      Tab => 18,
      TabItem => 19,
      Text => 20,
      ToolBar => 21,
      ToolTip => 22,
      Tree => 23,
      TreeItem => 24,
      Custom => 25,
      Group => 26,
      Thumb => 27,
      DataGrid => 28,
      DataItem => 29,
      Document => 30,
      SplitButton => 31,
      Window => 32,
      Pane => 33,
      Header => 34,
      HeaderItem => 35,
      Table => 36,
      TitleBar => 37,
      Separator => 38,
      SemanticZoom => 39,
      AppBar => 40
   );
   for AutomationControlType'Size use 32;
   
   type AutomationControlType_Ptr is access AutomationControlType;
   
   type AutomationEvents is (
      ToolTipOpened,
      ToolTipClosed,
      MenuOpened,
      MenuClosed,
      AutomationFocusChanged,
      InvokePatternOnInvoked,
      SelectionItemPatternOnElementAddedToSelection,
      SelectionItemPatternOnElementRemovedFromSelection,
      SelectionItemPatternOnElementSelected,
      SelectionPatternOnInvalidated,
      TextPatternOnTextSelectionChanged,
      TextPatternOnTextChanged,
      AsyncContentLoaded,
      PropertyChanged,
      StructureChanged,
      DragStart,
      DragCancel,
      DragComplete,
      DragEnter,
      DragLeave,
      Dropped,
      LiveRegionChanged,
      InputReachedTarget,
      InputReachedOtherElement,
      InputDiscarded,
      WindowClosed,
      WindowOpened,
      ConversionTargetChanged,
      TextEditTextChanged,
      LayoutInvalidated
   );
   for AutomationEvents use (
      ToolTipOpened => 0,
      ToolTipClosed => 1,
      MenuOpened => 2,
      MenuClosed => 3,
      AutomationFocusChanged => 4,
      InvokePatternOnInvoked => 5,
      SelectionItemPatternOnElementAddedToSelection => 6,
      SelectionItemPatternOnElementRemovedFromSelection => 7,
      SelectionItemPatternOnElementSelected => 8,
      SelectionPatternOnInvalidated => 9,
      TextPatternOnTextSelectionChanged => 10,
      TextPatternOnTextChanged => 11,
      AsyncContentLoaded => 12,
      PropertyChanged => 13,
      StructureChanged => 14,
      DragStart => 15,
      DragCancel => 16,
      DragComplete => 17,
      DragEnter => 18,
      DragLeave => 19,
      Dropped => 20,
      LiveRegionChanged => 21,
      InputReachedTarget => 22,
      InputReachedOtherElement => 23,
      InputDiscarded => 24,
      WindowClosed => 25,
      WindowOpened => 26,
      ConversionTargetChanged => 27,
      TextEditTextChanged => 28,
      LayoutInvalidated => 29
   );
   for AutomationEvents'Size use 32;
   
   type AutomationEvents_Ptr is access AutomationEvents;
   
   type AutomationLandmarkType is (
      None,
      Custom,
      Form,
      Main,
      Navigation,
      Search
   );
   for AutomationLandmarkType use (
      None => 0,
      Custom => 1,
      Form => 2,
      Main => 3,
      Navigation => 4,
      Search => 5
   );
   for AutomationLandmarkType'Size use 32;
   
   type AutomationLandmarkType_Ptr is access AutomationLandmarkType;
   
   type AutomationLiveSetting is (
      Off,
      Polite,
      Assertive
   );
   for AutomationLiveSetting use (
      Off => 0,
      Polite => 1,
      Assertive => 2
   );
   for AutomationLiveSetting'Size use 32;
   
   type AutomationLiveSetting_Ptr is access AutomationLiveSetting;
   
   type AutomationNavigationDirection is (
      Parent,
      NextSibling,
      PreviousSibling,
      FirstChild,
      LastChild
   );
   for AutomationNavigationDirection use (
      Parent => 0,
      NextSibling => 1,
      PreviousSibling => 2,
      FirstChild => 3,
      LastChild => 4
   );
   for AutomationNavigationDirection'Size use 32;
   
   type AutomationNavigationDirection_Ptr is access AutomationNavigationDirection;
   
   type AutomationNotificationKind is (
      ItemAdded,
      ItemRemoved,
      ActionCompleted,
      ActionAborted,
      Other
   );
   for AutomationNotificationKind use (
      ItemAdded => 0,
      ItemRemoved => 1,
      ActionCompleted => 2,
      ActionAborted => 3,
      Other => 4
   );
   for AutomationNotificationKind'Size use 32;
   
   type AutomationNotificationKind_Ptr is access AutomationNotificationKind;
   
   type AutomationNotificationProcessing is (
      ImportantAll,
      ImportantMostRecent,
      All_x,
      MostRecent,
      CurrentThenMostRecent
   );
   for AutomationNotificationProcessing use (
      ImportantAll => 0,
      ImportantMostRecent => 1,
      All_x => 2,
      MostRecent => 3,
      CurrentThenMostRecent => 4
   );
   for AutomationNotificationProcessing'Size use 32;
   
   type AutomationNotificationProcessing_Ptr is access AutomationNotificationProcessing;
   
   type AutomationOrientation is (
      None,
      Horizontal,
      Vertical
   );
   for AutomationOrientation use (
      None => 0,
      Horizontal => 1,
      Vertical => 2
   );
   for AutomationOrientation'Size use 32;
   
   type AutomationOrientation_Ptr is access AutomationOrientation;
   
   type AutomationStructureChangeType is (
      ChildAdded,
      ChildRemoved,
      ChildrenInvalidated,
      ChildrenBulkAdded,
      ChildrenBulkRemoved,
      ChildrenReordered
   );
   for AutomationStructureChangeType use (
      ChildAdded => 0,
      ChildRemoved => 1,
      ChildrenInvalidated => 2,
      ChildrenBulkAdded => 3,
      ChildrenBulkRemoved => 4,
      ChildrenReordered => 5
   );
   for AutomationStructureChangeType'Size use 32;
   
   type AutomationStructureChangeType_Ptr is access AutomationStructureChangeType;
   
   type PatternInterface is (
      Invoke,
      Selection,
      Value,
      RangeValue,
      Scroll,
      ScrollItem,
      ExpandCollapse,
      Grid,
      GridItem,
      MultipleView,
      Window,
      SelectionItem,
      Dock,
      Table,
      TableItem,
      Toggle,
      Transform,
      Text,
      ItemContainer,
      VirtualizedItem,
      Text2,
      TextChild,
      TextRange,
      Annotation,
      Drag,
      DropTarget,
      ObjectModel,
      Spreadsheet,
      SpreadsheetItem,
      Styles,
      Transform2,
      SynchronizedInput,
      TextEdit,
      CustomNavigation
   );
   for PatternInterface use (
      Invoke => 0,
      Selection => 1,
      Value => 2,
      RangeValue => 3,
      Scroll => 4,
      ScrollItem => 5,
      ExpandCollapse => 6,
      Grid => 7,
      GridItem => 8,
      MultipleView => 9,
      Window => 10,
      SelectionItem => 11,
      Dock => 12,
      Table => 13,
      TableItem => 14,
      Toggle => 15,
      Transform => 16,
      Text => 17,
      ItemContainer => 18,
      VirtualizedItem => 19,
      Text2 => 20,
      TextChild => 21,
      TextRange => 22,
      Annotation => 23,
      Drag => 24,
      DropTarget => 25,
      ObjectModel => 26,
      Spreadsheet => 27,
      SpreadsheetItem => 28,
      Styles => 29,
      Transform2 => 30,
      SynchronizedInput => 31,
      TextEdit => 32,
      CustomNavigation => 33
   );
   for PatternInterface'Size use 32;
   
   type PatternInterface_Ptr is access PatternInterface;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type RawElementProviderRuntimeId is record
      Part1 : Windows.UInt32;
      Part2 : Windows.UInt32;
   end record;
   pragma Convention (C_Pass_By_Copy , RawElementProviderRuntimeId);
   
   type RawElementProviderRuntimeId_Ptr is access RawElementProviderRuntimeId;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IColorSpectrumAutomationPeer_Interface;
   type IColorSpectrumAutomationPeer is access all IColorSpectrumAutomationPeer_Interface'Class;
   type IColorSpectrumAutomationPeer_Ptr is access all IColorSpectrumAutomationPeer;
   type IColorSpectrumAutomationPeerFactory_Interface;
   type IColorSpectrumAutomationPeerFactory is access all IColorSpectrumAutomationPeerFactory_Interface'Class;
   type IColorSpectrumAutomationPeerFactory_Ptr is access all IColorSpectrumAutomationPeerFactory;
   type IColorPickerSliderAutomationPeer_Interface;
   type IColorPickerSliderAutomationPeer is access all IColorPickerSliderAutomationPeer_Interface'Class;
   type IColorPickerSliderAutomationPeer_Ptr is access all IColorPickerSliderAutomationPeer;
   type IColorPickerSliderAutomationPeerFactory_Interface;
   type IColorPickerSliderAutomationPeerFactory is access all IColorPickerSliderAutomationPeerFactory_Interface'Class;
   type IColorPickerSliderAutomationPeerFactory_Ptr is access all IColorPickerSliderAutomationPeerFactory;
   type INavigationViewItemAutomationPeer_Interface;
   type INavigationViewItemAutomationPeer is access all INavigationViewItemAutomationPeer_Interface'Class;
   type INavigationViewItemAutomationPeer_Ptr is access all INavigationViewItemAutomationPeer;
   type INavigationViewItemAutomationPeerFactory_Interface;
   type INavigationViewItemAutomationPeerFactory is access all INavigationViewItemAutomationPeerFactory_Interface'Class;
   type INavigationViewItemAutomationPeerFactory_Ptr is access all INavigationViewItemAutomationPeerFactory;
   type IPersonPictureAutomationPeer_Interface;
   type IPersonPictureAutomationPeer is access all IPersonPictureAutomationPeer_Interface'Class;
   type IPersonPictureAutomationPeer_Ptr is access all IPersonPictureAutomationPeer;
   type IPersonPictureAutomationPeerFactory_Interface;
   type IPersonPictureAutomationPeerFactory is access all IPersonPictureAutomationPeerFactory_Interface'Class;
   type IPersonPictureAutomationPeerFactory_Ptr is access all IPersonPictureAutomationPeerFactory;
   type IRatingControlAutomationPeer_Interface;
   type IRatingControlAutomationPeer is access all IRatingControlAutomationPeer_Interface'Class;
   type IRatingControlAutomationPeer_Ptr is access all IRatingControlAutomationPeer;
   type IRatingControlAutomationPeerFactory_Interface;
   type IRatingControlAutomationPeerFactory is access all IRatingControlAutomationPeerFactory_Interface'Class;
   type IRatingControlAutomationPeerFactory_Ptr is access all IRatingControlAutomationPeerFactory;
   type IItemAutomationPeer_Interface;
   type IItemAutomationPeer is access all IItemAutomationPeer_Interface'Class;
   type IItemAutomationPeer_Ptr is access all IItemAutomationPeer;
   type IItemAutomationPeerFactory_Interface;
   type IItemAutomationPeerFactory is access all IItemAutomationPeerFactory_Interface'Class;
   type IItemAutomationPeerFactory_Ptr is access all IItemAutomationPeerFactory;
   type IButtonBaseAutomationPeer_Interface;
   type IButtonBaseAutomationPeer is access all IButtonBaseAutomationPeer_Interface'Class;
   type IButtonBaseAutomationPeer_Ptr is access all IButtonBaseAutomationPeer;
   type IButtonBaseAutomationPeerFactory_Interface;
   type IButtonBaseAutomationPeerFactory is access all IButtonBaseAutomationPeerFactory_Interface'Class;
   type IButtonBaseAutomationPeerFactory_Ptr is access all IButtonBaseAutomationPeerFactory;
   type ICaptureElementAutomationPeer_Interface;
   type ICaptureElementAutomationPeer is access all ICaptureElementAutomationPeer_Interface'Class;
   type ICaptureElementAutomationPeer_Ptr is access all ICaptureElementAutomationPeer;
   type ICaptureElementAutomationPeerFactory_Interface;
   type ICaptureElementAutomationPeerFactory is access all ICaptureElementAutomationPeerFactory_Interface'Class;
   type ICaptureElementAutomationPeerFactory_Ptr is access all ICaptureElementAutomationPeerFactory;
   type IComboBoxItemAutomationPeer_Interface;
   type IComboBoxItemAutomationPeer is access all IComboBoxItemAutomationPeer_Interface'Class;
   type IComboBoxItemAutomationPeer_Ptr is access all IComboBoxItemAutomationPeer;
   type IComboBoxItemAutomationPeerFactory_Interface;
   type IComboBoxItemAutomationPeerFactory is access all IComboBoxItemAutomationPeerFactory_Interface'Class;
   type IComboBoxItemAutomationPeerFactory_Ptr is access all IComboBoxItemAutomationPeerFactory;
   type IFlipViewItemAutomationPeer_Interface;
   type IFlipViewItemAutomationPeer is access all IFlipViewItemAutomationPeer_Interface'Class;
   type IFlipViewItemAutomationPeer_Ptr is access all IFlipViewItemAutomationPeer;
   type IFlipViewItemAutomationPeerFactory_Interface;
   type IFlipViewItemAutomationPeerFactory is access all IFlipViewItemAutomationPeerFactory_Interface'Class;
   type IFlipViewItemAutomationPeerFactory_Ptr is access all IFlipViewItemAutomationPeerFactory;
   type IGroupItemAutomationPeer_Interface;
   type IGroupItemAutomationPeer is access all IGroupItemAutomationPeer_Interface'Class;
   type IGroupItemAutomationPeer_Ptr is access all IGroupItemAutomationPeer;
   type IGroupItemAutomationPeerFactory_Interface;
   type IGroupItemAutomationPeerFactory is access all IGroupItemAutomationPeerFactory_Interface'Class;
   type IGroupItemAutomationPeerFactory_Ptr is access all IGroupItemAutomationPeerFactory;
   type IImageAutomationPeer_Interface;
   type IImageAutomationPeer is access all IImageAutomationPeer_Interface'Class;
   type IImageAutomationPeer_Ptr is access all IImageAutomationPeer;
   type IImageAutomationPeerFactory_Interface;
   type IImageAutomationPeerFactory is access all IImageAutomationPeerFactory_Interface'Class;
   type IImageAutomationPeerFactory_Ptr is access all IImageAutomationPeerFactory;
   type IItemsControlAutomationPeer_Interface;
   type IItemsControlAutomationPeer is access all IItemsControlAutomationPeer_Interface'Class;
   type IItemsControlAutomationPeer_Ptr is access all IItemsControlAutomationPeer;
   type IItemsControlAutomationPeerFactory_Interface;
   type IItemsControlAutomationPeerFactory is access all IItemsControlAutomationPeerFactory_Interface'Class;
   type IItemsControlAutomationPeerFactory_Ptr is access all IItemsControlAutomationPeerFactory;
   type IItemsControlAutomationPeer2_Interface;
   type IItemsControlAutomationPeer2 is access all IItemsControlAutomationPeer2_Interface'Class;
   type IItemsControlAutomationPeer2_Ptr is access all IItemsControlAutomationPeer2;
   type IItemsControlAutomationPeerOverrides2_Interface;
   type IItemsControlAutomationPeerOverrides2 is access all IItemsControlAutomationPeerOverrides2_Interface'Class;
   type IItemsControlAutomationPeerOverrides2_Ptr is access all IItemsControlAutomationPeerOverrides2;
   type IListBoxItemAutomationPeer_Interface;
   type IListBoxItemAutomationPeer is access all IListBoxItemAutomationPeer_Interface'Class;
   type IListBoxItemAutomationPeer_Ptr is access all IListBoxItemAutomationPeer;
   type IListBoxItemAutomationPeerFactory_Interface;
   type IListBoxItemAutomationPeerFactory is access all IListBoxItemAutomationPeerFactory_Interface'Class;
   type IListBoxItemAutomationPeerFactory_Ptr is access all IListBoxItemAutomationPeerFactory;
   type IMediaTransportControlsAutomationPeer_Interface;
   type IMediaTransportControlsAutomationPeer is access all IMediaTransportControlsAutomationPeer_Interface'Class;
   type IMediaTransportControlsAutomationPeer_Ptr is access all IMediaTransportControlsAutomationPeer;
   type IMediaTransportControlsAutomationPeerFactory_Interface;
   type IMediaTransportControlsAutomationPeerFactory is access all IMediaTransportControlsAutomationPeerFactory_Interface'Class;
   type IMediaTransportControlsAutomationPeerFactory_Ptr is access all IMediaTransportControlsAutomationPeerFactory;
   type IPasswordBoxAutomationPeer_Interface;
   type IPasswordBoxAutomationPeer is access all IPasswordBoxAutomationPeer_Interface'Class;
   type IPasswordBoxAutomationPeer_Ptr is access all IPasswordBoxAutomationPeer;
   type IPasswordBoxAutomationPeerFactory_Interface;
   type IPasswordBoxAutomationPeerFactory is access all IPasswordBoxAutomationPeerFactory_Interface'Class;
   type IPasswordBoxAutomationPeerFactory_Ptr is access all IPasswordBoxAutomationPeerFactory;
   type IProgressRingAutomationPeer_Interface;
   type IProgressRingAutomationPeer is access all IProgressRingAutomationPeer_Interface'Class;
   type IProgressRingAutomationPeer_Ptr is access all IProgressRingAutomationPeer;
   type IProgressRingAutomationPeerFactory_Interface;
   type IProgressRingAutomationPeerFactory is access all IProgressRingAutomationPeerFactory_Interface'Class;
   type IProgressRingAutomationPeerFactory_Ptr is access all IProgressRingAutomationPeerFactory;
   type IRangeBaseAutomationPeer_Interface;
   type IRangeBaseAutomationPeer is access all IRangeBaseAutomationPeer_Interface'Class;
   type IRangeBaseAutomationPeer_Ptr is access all IRangeBaseAutomationPeer;
   type IRangeBaseAutomationPeerFactory_Interface;
   type IRangeBaseAutomationPeerFactory is access all IRangeBaseAutomationPeerFactory_Interface'Class;
   type IRangeBaseAutomationPeerFactory_Ptr is access all IRangeBaseAutomationPeerFactory;
   type IRichTextBlockAutomationPeer_Interface;
   type IRichTextBlockAutomationPeer is access all IRichTextBlockAutomationPeer_Interface'Class;
   type IRichTextBlockAutomationPeer_Ptr is access all IRichTextBlockAutomationPeer;
   type IRichTextBlockAutomationPeerFactory_Interface;
   type IRichTextBlockAutomationPeerFactory is access all IRichTextBlockAutomationPeerFactory_Interface'Class;
   type IRichTextBlockAutomationPeerFactory_Ptr is access all IRichTextBlockAutomationPeerFactory;
   type IRichTextBlockOverflowAutomationPeer_Interface;
   type IRichTextBlockOverflowAutomationPeer is access all IRichTextBlockOverflowAutomationPeer_Interface'Class;
   type IRichTextBlockOverflowAutomationPeer_Ptr is access all IRichTextBlockOverflowAutomationPeer;
   type IRichTextBlockOverflowAutomationPeerFactory_Interface;
   type IRichTextBlockOverflowAutomationPeerFactory is access all IRichTextBlockOverflowAutomationPeerFactory_Interface'Class;
   type IRichTextBlockOverflowAutomationPeerFactory_Ptr is access all IRichTextBlockOverflowAutomationPeerFactory;
   type ISelectorItemAutomationPeer_Interface;
   type ISelectorItemAutomationPeer is access all ISelectorItemAutomationPeer_Interface'Class;
   type ISelectorItemAutomationPeer_Ptr is access all ISelectorItemAutomationPeer;
   type ISelectorItemAutomationPeerFactory_Interface;
   type ISelectorItemAutomationPeerFactory is access all ISelectorItemAutomationPeerFactory_Interface'Class;
   type ISelectorItemAutomationPeerFactory_Ptr is access all ISelectorItemAutomationPeerFactory;
   type ISemanticZoomAutomationPeer_Interface;
   type ISemanticZoomAutomationPeer is access all ISemanticZoomAutomationPeer_Interface'Class;
   type ISemanticZoomAutomationPeer_Ptr is access all ISemanticZoomAutomationPeer;
   type ISemanticZoomAutomationPeerFactory_Interface;
   type ISemanticZoomAutomationPeerFactory is access all ISemanticZoomAutomationPeerFactory_Interface'Class;
   type ISemanticZoomAutomationPeerFactory_Ptr is access all ISemanticZoomAutomationPeerFactory;
   type ISettingsFlyoutAutomationPeer_Interface;
   type ISettingsFlyoutAutomationPeer is access all ISettingsFlyoutAutomationPeer_Interface'Class;
   type ISettingsFlyoutAutomationPeer_Ptr is access all ISettingsFlyoutAutomationPeer;
   type ISettingsFlyoutAutomationPeerFactory_Interface;
   type ISettingsFlyoutAutomationPeerFactory is access all ISettingsFlyoutAutomationPeerFactory_Interface'Class;
   type ISettingsFlyoutAutomationPeerFactory_Ptr is access all ISettingsFlyoutAutomationPeerFactory;
   type ITextBlockAutomationPeer_Interface;
   type ITextBlockAutomationPeer is access all ITextBlockAutomationPeer_Interface'Class;
   type ITextBlockAutomationPeer_Ptr is access all ITextBlockAutomationPeer;
   type ITextBlockAutomationPeerFactory_Interface;
   type ITextBlockAutomationPeerFactory is access all ITextBlockAutomationPeerFactory_Interface'Class;
   type ITextBlockAutomationPeerFactory_Ptr is access all ITextBlockAutomationPeerFactory;
   type ITextBoxAutomationPeer_Interface;
   type ITextBoxAutomationPeer is access all ITextBoxAutomationPeer_Interface'Class;
   type ITextBoxAutomationPeer_Ptr is access all ITextBoxAutomationPeer;
   type ITextBoxAutomationPeerFactory_Interface;
   type ITextBoxAutomationPeerFactory is access all ITextBoxAutomationPeerFactory_Interface'Class;
   type ITextBoxAutomationPeerFactory_Ptr is access all ITextBoxAutomationPeerFactory;
   type IThumbAutomationPeer_Interface;
   type IThumbAutomationPeer is access all IThumbAutomationPeer_Interface'Class;
   type IThumbAutomationPeer_Ptr is access all IThumbAutomationPeer;
   type IThumbAutomationPeerFactory_Interface;
   type IThumbAutomationPeerFactory is access all IThumbAutomationPeerFactory_Interface'Class;
   type IThumbAutomationPeerFactory_Ptr is access all IThumbAutomationPeerFactory;
   type IToggleSwitchAutomationPeer_Interface;
   type IToggleSwitchAutomationPeer is access all IToggleSwitchAutomationPeer_Interface'Class;
   type IToggleSwitchAutomationPeer_Ptr is access all IToggleSwitchAutomationPeer;
   type IToggleSwitchAutomationPeerFactory_Interface;
   type IToggleSwitchAutomationPeerFactory is access all IToggleSwitchAutomationPeerFactory_Interface'Class;
   type IToggleSwitchAutomationPeerFactory_Ptr is access all IToggleSwitchAutomationPeerFactory;
   type IButtonAutomationPeer_Interface;
   type IButtonAutomationPeer is access all IButtonAutomationPeer_Interface'Class;
   type IButtonAutomationPeer_Ptr is access all IButtonAutomationPeer;
   type IButtonAutomationPeerFactory_Interface;
   type IButtonAutomationPeerFactory is access all IButtonAutomationPeerFactory_Interface'Class;
   type IButtonAutomationPeerFactory_Ptr is access all IButtonAutomationPeerFactory;
   type IComboBoxItemDataAutomationPeer_Interface;
   type IComboBoxItemDataAutomationPeer is access all IComboBoxItemDataAutomationPeer_Interface'Class;
   type IComboBoxItemDataAutomationPeer_Ptr is access all IComboBoxItemDataAutomationPeer;
   type IComboBoxItemDataAutomationPeerFactory_Interface;
   type IComboBoxItemDataAutomationPeerFactory is access all IComboBoxItemDataAutomationPeerFactory_Interface'Class;
   type IComboBoxItemDataAutomationPeerFactory_Ptr is access all IComboBoxItemDataAutomationPeerFactory;
   type IFlipViewItemDataAutomationPeer_Interface;
   type IFlipViewItemDataAutomationPeer is access all IFlipViewItemDataAutomationPeer_Interface'Class;
   type IFlipViewItemDataAutomationPeer_Ptr is access all IFlipViewItemDataAutomationPeer;
   type IFlipViewItemDataAutomationPeerFactory_Interface;
   type IFlipViewItemDataAutomationPeerFactory is access all IFlipViewItemDataAutomationPeerFactory_Interface'Class;
   type IFlipViewItemDataAutomationPeerFactory_Ptr is access all IFlipViewItemDataAutomationPeerFactory;
   type IHyperlinkButtonAutomationPeer_Interface;
   type IHyperlinkButtonAutomationPeer is access all IHyperlinkButtonAutomationPeer_Interface'Class;
   type IHyperlinkButtonAutomationPeer_Ptr is access all IHyperlinkButtonAutomationPeer;
   type IHyperlinkButtonAutomationPeerFactory_Interface;
   type IHyperlinkButtonAutomationPeerFactory is access all IHyperlinkButtonAutomationPeerFactory_Interface'Class;
   type IHyperlinkButtonAutomationPeerFactory_Ptr is access all IHyperlinkButtonAutomationPeerFactory;
   type IListBoxItemDataAutomationPeer_Interface;
   type IListBoxItemDataAutomationPeer is access all IListBoxItemDataAutomationPeer_Interface'Class;
   type IListBoxItemDataAutomationPeer_Ptr is access all IListBoxItemDataAutomationPeer;
   type IListBoxItemDataAutomationPeerFactory_Interface;
   type IListBoxItemDataAutomationPeerFactory is access all IListBoxItemDataAutomationPeerFactory_Interface'Class;
   type IListBoxItemDataAutomationPeerFactory_Ptr is access all IListBoxItemDataAutomationPeerFactory;
   type IProgressBarAutomationPeer_Interface;
   type IProgressBarAutomationPeer is access all IProgressBarAutomationPeer_Interface'Class;
   type IProgressBarAutomationPeer_Ptr is access all IProgressBarAutomationPeer;
   type IProgressBarAutomationPeerFactory_Interface;
   type IProgressBarAutomationPeerFactory is access all IProgressBarAutomationPeerFactory_Interface'Class;
   type IProgressBarAutomationPeerFactory_Ptr is access all IProgressBarAutomationPeerFactory;
   type IRepeatButtonAutomationPeer_Interface;
   type IRepeatButtonAutomationPeer is access all IRepeatButtonAutomationPeer_Interface'Class;
   type IRepeatButtonAutomationPeer_Ptr is access all IRepeatButtonAutomationPeer;
   type IRepeatButtonAutomationPeerFactory_Interface;
   type IRepeatButtonAutomationPeerFactory is access all IRepeatButtonAutomationPeerFactory_Interface'Class;
   type IRepeatButtonAutomationPeerFactory_Ptr is access all IRepeatButtonAutomationPeerFactory;
   type IScrollBarAutomationPeer_Interface;
   type IScrollBarAutomationPeer is access all IScrollBarAutomationPeer_Interface'Class;
   type IScrollBarAutomationPeer_Ptr is access all IScrollBarAutomationPeer;
   type IScrollBarAutomationPeerFactory_Interface;
   type IScrollBarAutomationPeerFactory is access all IScrollBarAutomationPeerFactory_Interface'Class;
   type IScrollBarAutomationPeerFactory_Ptr is access all IScrollBarAutomationPeerFactory;
   type ISelectorAutomationPeer_Interface;
   type ISelectorAutomationPeer is access all ISelectorAutomationPeer_Interface'Class;
   type ISelectorAutomationPeer_Ptr is access all ISelectorAutomationPeer;
   type ISelectorAutomationPeerFactory_Interface;
   type ISelectorAutomationPeerFactory is access all ISelectorAutomationPeerFactory_Interface'Class;
   type ISelectorAutomationPeerFactory_Ptr is access all ISelectorAutomationPeerFactory;
   type ISliderAutomationPeer_Interface;
   type ISliderAutomationPeer is access all ISliderAutomationPeer_Interface'Class;
   type ISliderAutomationPeer_Ptr is access all ISliderAutomationPeer;
   type ISliderAutomationPeerFactory_Interface;
   type ISliderAutomationPeerFactory is access all ISliderAutomationPeerFactory_Interface'Class;
   type ISliderAutomationPeerFactory_Ptr is access all ISliderAutomationPeerFactory;
   type IToggleButtonAutomationPeer_Interface;
   type IToggleButtonAutomationPeer is access all IToggleButtonAutomationPeer_Interface'Class;
   type IToggleButtonAutomationPeer_Ptr is access all IToggleButtonAutomationPeer;
   type IToggleButtonAutomationPeerFactory_Interface;
   type IToggleButtonAutomationPeerFactory is access all IToggleButtonAutomationPeerFactory_Interface'Class;
   type IToggleButtonAutomationPeerFactory_Ptr is access all IToggleButtonAutomationPeerFactory;
   type ICheckBoxAutomationPeer_Interface;
   type ICheckBoxAutomationPeer is access all ICheckBoxAutomationPeer_Interface'Class;
   type ICheckBoxAutomationPeer_Ptr is access all ICheckBoxAutomationPeer;
   type ICheckBoxAutomationPeerFactory_Interface;
   type ICheckBoxAutomationPeerFactory is access all ICheckBoxAutomationPeerFactory_Interface'Class;
   type ICheckBoxAutomationPeerFactory_Ptr is access all ICheckBoxAutomationPeerFactory;
   type IComboBoxAutomationPeer_Interface;
   type IComboBoxAutomationPeer is access all IComboBoxAutomationPeer_Interface'Class;
   type IComboBoxAutomationPeer_Ptr is access all IComboBoxAutomationPeer;
   type IComboBoxAutomationPeerFactory_Interface;
   type IComboBoxAutomationPeerFactory is access all IComboBoxAutomationPeerFactory_Interface'Class;
   type IComboBoxAutomationPeerFactory_Ptr is access all IComboBoxAutomationPeerFactory;
   type IFlipViewAutomationPeer_Interface;
   type IFlipViewAutomationPeer is access all IFlipViewAutomationPeer_Interface'Class;
   type IFlipViewAutomationPeer_Ptr is access all IFlipViewAutomationPeer;
   type IFlipViewAutomationPeerFactory_Interface;
   type IFlipViewAutomationPeerFactory is access all IFlipViewAutomationPeerFactory_Interface'Class;
   type IFlipViewAutomationPeerFactory_Ptr is access all IFlipViewAutomationPeerFactory;
   type IListBoxAutomationPeer_Interface;
   type IListBoxAutomationPeer is access all IListBoxAutomationPeer_Interface'Class;
   type IListBoxAutomationPeer_Ptr is access all IListBoxAutomationPeer;
   type IListBoxAutomationPeerFactory_Interface;
   type IListBoxAutomationPeerFactory is access all IListBoxAutomationPeerFactory_Interface'Class;
   type IListBoxAutomationPeerFactory_Ptr is access all IListBoxAutomationPeerFactory;
   type IRadioButtonAutomationPeer_Interface;
   type IRadioButtonAutomationPeer is access all IRadioButtonAutomationPeer_Interface'Class;
   type IRadioButtonAutomationPeer_Ptr is access all IRadioButtonAutomationPeer;
   type IRadioButtonAutomationPeerFactory_Interface;
   type IRadioButtonAutomationPeerFactory is access all IRadioButtonAutomationPeerFactory_Interface'Class;
   type IRadioButtonAutomationPeerFactory_Ptr is access all IRadioButtonAutomationPeerFactory;
   type IAppBarAutomationPeer_Interface;
   type IAppBarAutomationPeer is access all IAppBarAutomationPeer_Interface'Class;
   type IAppBarAutomationPeer_Ptr is access all IAppBarAutomationPeer;
   type IAppBarAutomationPeerFactory_Interface;
   type IAppBarAutomationPeerFactory is access all IAppBarAutomationPeerFactory_Interface'Class;
   type IAppBarAutomationPeerFactory_Ptr is access all IAppBarAutomationPeerFactory;
   type IAutoSuggestBoxAutomationPeer_Interface;
   type IAutoSuggestBoxAutomationPeer is access all IAutoSuggestBoxAutomationPeer_Interface'Class;
   type IAutoSuggestBoxAutomationPeer_Ptr is access all IAutoSuggestBoxAutomationPeer;
   type IAutoSuggestBoxAutomationPeerFactory_Interface;
   type IAutoSuggestBoxAutomationPeerFactory is access all IAutoSuggestBoxAutomationPeerFactory_Interface'Class;
   type IAutoSuggestBoxAutomationPeerFactory_Ptr is access all IAutoSuggestBoxAutomationPeerFactory;
   type IDatePickerAutomationPeer_Interface;
   type IDatePickerAutomationPeer is access all IDatePickerAutomationPeer_Interface'Class;
   type IDatePickerAutomationPeer_Ptr is access all IDatePickerAutomationPeer;
   type IDatePickerAutomationPeerFactory_Interface;
   type IDatePickerAutomationPeerFactory is access all IDatePickerAutomationPeerFactory_Interface'Class;
   type IDatePickerAutomationPeerFactory_Ptr is access all IDatePickerAutomationPeerFactory;
   type IFlyoutPresenterAutomationPeer_Interface;
   type IFlyoutPresenterAutomationPeer is access all IFlyoutPresenterAutomationPeer_Interface'Class;
   type IFlyoutPresenterAutomationPeer_Ptr is access all IFlyoutPresenterAutomationPeer;
   type IFlyoutPresenterAutomationPeerFactory_Interface;
   type IFlyoutPresenterAutomationPeerFactory is access all IFlyoutPresenterAutomationPeerFactory_Interface'Class;
   type IFlyoutPresenterAutomationPeerFactory_Ptr is access all IFlyoutPresenterAutomationPeerFactory;
   type IGridViewItemAutomationPeer_Interface;
   type IGridViewItemAutomationPeer is access all IGridViewItemAutomationPeer_Interface'Class;
   type IGridViewItemAutomationPeer_Ptr is access all IGridViewItemAutomationPeer;
   type IGridViewItemAutomationPeerFactory_Interface;
   type IGridViewItemAutomationPeerFactory is access all IGridViewItemAutomationPeerFactory_Interface'Class;
   type IGridViewItemAutomationPeerFactory_Ptr is access all IGridViewItemAutomationPeerFactory;
   type IHubAutomationPeer_Interface;
   type IHubAutomationPeer is access all IHubAutomationPeer_Interface'Class;
   type IHubAutomationPeer_Ptr is access all IHubAutomationPeer;
   type IHubAutomationPeerFactory_Interface;
   type IHubAutomationPeerFactory is access all IHubAutomationPeerFactory_Interface'Class;
   type IHubAutomationPeerFactory_Ptr is access all IHubAutomationPeerFactory;
   type IHubSectionAutomationPeer_Interface;
   type IHubSectionAutomationPeer is access all IHubSectionAutomationPeer_Interface'Class;
   type IHubSectionAutomationPeer_Ptr is access all IHubSectionAutomationPeer;
   type IHubSectionAutomationPeerFactory_Interface;
   type IHubSectionAutomationPeerFactory is access all IHubSectionAutomationPeerFactory_Interface'Class;
   type IHubSectionAutomationPeerFactory_Ptr is access all IHubSectionAutomationPeerFactory;
   type IListViewBaseHeaderItemAutomationPeer_Interface;
   type IListViewBaseHeaderItemAutomationPeer is access all IListViewBaseHeaderItemAutomationPeer_Interface'Class;
   type IListViewBaseHeaderItemAutomationPeer_Ptr is access all IListViewBaseHeaderItemAutomationPeer;
   type IListViewBaseHeaderItemAutomationPeerFactory_Interface;
   type IListViewBaseHeaderItemAutomationPeerFactory is access all IListViewBaseHeaderItemAutomationPeerFactory_Interface'Class;
   type IListViewBaseHeaderItemAutomationPeerFactory_Ptr is access all IListViewBaseHeaderItemAutomationPeerFactory;
   type IListViewItemAutomationPeer_Interface;
   type IListViewItemAutomationPeer is access all IListViewItemAutomationPeer_Interface'Class;
   type IListViewItemAutomationPeer_Ptr is access all IListViewItemAutomationPeer;
   type IListViewItemAutomationPeerFactory_Interface;
   type IListViewItemAutomationPeerFactory is access all IListViewItemAutomationPeerFactory_Interface'Class;
   type IListViewItemAutomationPeerFactory_Ptr is access all IListViewItemAutomationPeerFactory;
   type IMediaElementAutomationPeer_Interface;
   type IMediaElementAutomationPeer is access all IMediaElementAutomationPeer_Interface'Class;
   type IMediaElementAutomationPeer_Ptr is access all IMediaElementAutomationPeer;
   type IMediaElementAutomationPeerFactory_Interface;
   type IMediaElementAutomationPeerFactory is access all IMediaElementAutomationPeerFactory_Interface'Class;
   type IMediaElementAutomationPeerFactory_Ptr is access all IMediaElementAutomationPeerFactory;
   type IMediaPlayerElementAutomationPeer_Interface;
   type IMediaPlayerElementAutomationPeer is access all IMediaPlayerElementAutomationPeer_Interface'Class;
   type IMediaPlayerElementAutomationPeer_Ptr is access all IMediaPlayerElementAutomationPeer;
   type IMediaPlayerElementAutomationPeerFactory_Interface;
   type IMediaPlayerElementAutomationPeerFactory is access all IMediaPlayerElementAutomationPeerFactory_Interface'Class;
   type IMediaPlayerElementAutomationPeerFactory_Ptr is access all IMediaPlayerElementAutomationPeerFactory;
   type IMenuFlyoutItemAutomationPeer_Interface;
   type IMenuFlyoutItemAutomationPeer is access all IMenuFlyoutItemAutomationPeer_Interface'Class;
   type IMenuFlyoutItemAutomationPeer_Ptr is access all IMenuFlyoutItemAutomationPeer;
   type IMenuFlyoutItemAutomationPeerFactory_Interface;
   type IMenuFlyoutItemAutomationPeerFactory is access all IMenuFlyoutItemAutomationPeerFactory_Interface'Class;
   type IMenuFlyoutItemAutomationPeerFactory_Ptr is access all IMenuFlyoutItemAutomationPeerFactory;
   type IRichEditBoxAutomationPeer_Interface;
   type IRichEditBoxAutomationPeer is access all IRichEditBoxAutomationPeer_Interface'Class;
   type IRichEditBoxAutomationPeer_Ptr is access all IRichEditBoxAutomationPeer;
   type IRichEditBoxAutomationPeerFactory_Interface;
   type IRichEditBoxAutomationPeerFactory is access all IRichEditBoxAutomationPeerFactory_Interface'Class;
   type IRichEditBoxAutomationPeerFactory_Ptr is access all IRichEditBoxAutomationPeerFactory;
   type IScrollViewerAutomationPeer_Interface;
   type IScrollViewerAutomationPeer is access all IScrollViewerAutomationPeer_Interface'Class;
   type IScrollViewerAutomationPeer_Ptr is access all IScrollViewerAutomationPeer;
   type IScrollViewerAutomationPeerFactory_Interface;
   type IScrollViewerAutomationPeerFactory is access all IScrollViewerAutomationPeerFactory_Interface'Class;
   type IScrollViewerAutomationPeerFactory_Ptr is access all IScrollViewerAutomationPeerFactory;
   type ISearchBoxAutomationPeer_Interface;
   type ISearchBoxAutomationPeer is access all ISearchBoxAutomationPeer_Interface'Class;
   type ISearchBoxAutomationPeer_Ptr is access all ISearchBoxAutomationPeer;
   type ISearchBoxAutomationPeerFactory_Interface;
   type ISearchBoxAutomationPeerFactory is access all ISearchBoxAutomationPeerFactory_Interface'Class;
   type ISearchBoxAutomationPeerFactory_Ptr is access all ISearchBoxAutomationPeerFactory;
   type ITimePickerAutomationPeer_Interface;
   type ITimePickerAutomationPeer is access all ITimePickerAutomationPeer_Interface'Class;
   type ITimePickerAutomationPeer_Ptr is access all ITimePickerAutomationPeer;
   type ITimePickerAutomationPeerFactory_Interface;
   type ITimePickerAutomationPeerFactory is access all ITimePickerAutomationPeerFactory_Interface'Class;
   type ITimePickerAutomationPeerFactory_Ptr is access all ITimePickerAutomationPeerFactory;
   type IToggleMenuFlyoutItemAutomationPeer_Interface;
   type IToggleMenuFlyoutItemAutomationPeer is access all IToggleMenuFlyoutItemAutomationPeer_Interface'Class;
   type IToggleMenuFlyoutItemAutomationPeer_Ptr is access all IToggleMenuFlyoutItemAutomationPeer;
   type IToggleMenuFlyoutItemAutomationPeerFactory_Interface;
   type IToggleMenuFlyoutItemAutomationPeerFactory is access all IToggleMenuFlyoutItemAutomationPeerFactory_Interface'Class;
   type IToggleMenuFlyoutItemAutomationPeerFactory_Ptr is access all IToggleMenuFlyoutItemAutomationPeerFactory;
   type IGridViewHeaderItemAutomationPeer_Interface;
   type IGridViewHeaderItemAutomationPeer is access all IGridViewHeaderItemAutomationPeer_Interface'Class;
   type IGridViewHeaderItemAutomationPeer_Ptr is access all IGridViewHeaderItemAutomationPeer;
   type IGridViewHeaderItemAutomationPeerFactory_Interface;
   type IGridViewHeaderItemAutomationPeerFactory is access all IGridViewHeaderItemAutomationPeerFactory_Interface'Class;
   type IGridViewHeaderItemAutomationPeerFactory_Ptr is access all IGridViewHeaderItemAutomationPeerFactory;
   type IGridViewItemDataAutomationPeer_Interface;
   type IGridViewItemDataAutomationPeer is access all IGridViewItemDataAutomationPeer_Interface'Class;
   type IGridViewItemDataAutomationPeer_Ptr is access all IGridViewItemDataAutomationPeer;
   type IGridViewItemDataAutomationPeerFactory_Interface;
   type IGridViewItemDataAutomationPeerFactory is access all IGridViewItemDataAutomationPeerFactory_Interface'Class;
   type IGridViewItemDataAutomationPeerFactory_Ptr is access all IGridViewItemDataAutomationPeerFactory;
   type IListViewHeaderItemAutomationPeer_Interface;
   type IListViewHeaderItemAutomationPeer is access all IListViewHeaderItemAutomationPeer_Interface'Class;
   type IListViewHeaderItemAutomationPeer_Ptr is access all IListViewHeaderItemAutomationPeer;
   type IListViewHeaderItemAutomationPeerFactory_Interface;
   type IListViewHeaderItemAutomationPeerFactory is access all IListViewHeaderItemAutomationPeerFactory_Interface'Class;
   type IListViewHeaderItemAutomationPeerFactory_Ptr is access all IListViewHeaderItemAutomationPeerFactory;
   type IListViewItemDataAutomationPeer_Interface;
   type IListViewItemDataAutomationPeer is access all IListViewItemDataAutomationPeer_Interface'Class;
   type IListViewItemDataAutomationPeer_Ptr is access all IListViewItemDataAutomationPeer;
   type IListViewItemDataAutomationPeerFactory_Interface;
   type IListViewItemDataAutomationPeerFactory is access all IListViewItemDataAutomationPeerFactory_Interface'Class;
   type IListViewItemDataAutomationPeerFactory_Ptr is access all IListViewItemDataAutomationPeerFactory;
   type IMenuFlyoutPresenterAutomationPeer_Interface;
   type IMenuFlyoutPresenterAutomationPeer is access all IMenuFlyoutPresenterAutomationPeer_Interface'Class;
   type IMenuFlyoutPresenterAutomationPeer_Ptr is access all IMenuFlyoutPresenterAutomationPeer;
   type IMenuFlyoutPresenterAutomationPeerFactory_Interface;
   type IMenuFlyoutPresenterAutomationPeerFactory is access all IMenuFlyoutPresenterAutomationPeerFactory_Interface'Class;
   type IMenuFlyoutPresenterAutomationPeerFactory_Ptr is access all IMenuFlyoutPresenterAutomationPeerFactory;
   type IAppBarButtonAutomationPeer_Interface;
   type IAppBarButtonAutomationPeer is access all IAppBarButtonAutomationPeer_Interface'Class;
   type IAppBarButtonAutomationPeer_Ptr is access all IAppBarButtonAutomationPeer;
   type IAppBarButtonAutomationPeerFactory_Interface;
   type IAppBarButtonAutomationPeerFactory is access all IAppBarButtonAutomationPeerFactory_Interface'Class;
   type IAppBarButtonAutomationPeerFactory_Ptr is access all IAppBarButtonAutomationPeerFactory;
   type IAppBarToggleButtonAutomationPeer_Interface;
   type IAppBarToggleButtonAutomationPeer is access all IAppBarToggleButtonAutomationPeer_Interface'Class;
   type IAppBarToggleButtonAutomationPeer_Ptr is access all IAppBarToggleButtonAutomationPeer;
   type IAppBarToggleButtonAutomationPeerFactory_Interface;
   type IAppBarToggleButtonAutomationPeerFactory is access all IAppBarToggleButtonAutomationPeerFactory_Interface'Class;
   type IAppBarToggleButtonAutomationPeerFactory_Ptr is access all IAppBarToggleButtonAutomationPeerFactory;
   type IListViewBaseAutomationPeer_Interface;
   type IListViewBaseAutomationPeer is access all IListViewBaseAutomationPeer_Interface'Class;
   type IListViewBaseAutomationPeer_Ptr is access all IListViewBaseAutomationPeer;
   type IListViewBaseAutomationPeerFactory_Interface;
   type IListViewBaseAutomationPeerFactory is access all IListViewBaseAutomationPeerFactory_Interface'Class;
   type IListViewBaseAutomationPeerFactory_Ptr is access all IListViewBaseAutomationPeerFactory;
   type IGridViewAutomationPeer_Interface;
   type IGridViewAutomationPeer is access all IGridViewAutomationPeer_Interface'Class;
   type IGridViewAutomationPeer_Ptr is access all IGridViewAutomationPeer;
   type IGridViewAutomationPeerFactory_Interface;
   type IGridViewAutomationPeerFactory is access all IGridViewAutomationPeerFactory_Interface'Class;
   type IGridViewAutomationPeerFactory_Ptr is access all IGridViewAutomationPeerFactory;
   type IListViewAutomationPeer_Interface;
   type IListViewAutomationPeer is access all IListViewAutomationPeer_Interface'Class;
   type IListViewAutomationPeer_Ptr is access all IListViewAutomationPeer;
   type IListViewAutomationPeerFactory_Interface;
   type IListViewAutomationPeerFactory is access all IListViewAutomationPeerFactory_Interface'Class;
   type IListViewAutomationPeerFactory_Ptr is access all IListViewAutomationPeerFactory;
   type IAutomationPeer_Interface;
   type IAutomationPeer is access all IAutomationPeer_Interface'Class;
   type IAutomationPeer_Ptr is access all IAutomationPeer;
   type IAutomationPeerOverrides_Interface;
   type IAutomationPeerOverrides is access all IAutomationPeerOverrides_Interface'Class;
   type IAutomationPeerOverrides_Ptr is access all IAutomationPeerOverrides;
   type IAutomationPeerProtected_Interface;
   type IAutomationPeerProtected is access all IAutomationPeerProtected_Interface'Class;
   type IAutomationPeerProtected_Ptr is access all IAutomationPeerProtected;
   type IAutomationPeerStatics_Interface;
   type IAutomationPeerStatics is access all IAutomationPeerStatics_Interface'Class;
   type IAutomationPeerStatics_Ptr is access all IAutomationPeerStatics;
   type IAutomationPeerFactory_Interface;
   type IAutomationPeerFactory is access all IAutomationPeerFactory_Interface'Class;
   type IAutomationPeerFactory_Ptr is access all IAutomationPeerFactory;
   type IAutomationPeer2_Interface;
   type IAutomationPeer2 is access all IAutomationPeer2_Interface'Class;
   type IAutomationPeer2_Ptr is access all IAutomationPeer2;
   type IAutomationPeerOverrides2_Interface;
   type IAutomationPeerOverrides2 is access all IAutomationPeerOverrides2_Interface'Class;
   type IAutomationPeerOverrides2_Ptr is access all IAutomationPeerOverrides2;
   type IAutomationPeer3_Interface;
   type IAutomationPeer3 is access all IAutomationPeer3_Interface'Class;
   type IAutomationPeer3_Ptr is access all IAutomationPeer3;
   type IAutomationPeerOverrides3_Interface;
   type IAutomationPeerOverrides3 is access all IAutomationPeerOverrides3_Interface'Class;
   type IAutomationPeerOverrides3_Ptr is access all IAutomationPeerOverrides3;
   type IAutomationPeerStatics3_Interface;
   type IAutomationPeerStatics3 is access all IAutomationPeerStatics3_Interface'Class;
   type IAutomationPeerStatics3_Ptr is access all IAutomationPeerStatics3;
   type IAutomationPeer4_Interface;
   type IAutomationPeer4 is access all IAutomationPeer4_Interface'Class;
   type IAutomationPeer4_Ptr is access all IAutomationPeer4;
   type IAutomationPeerOverrides4_Interface;
   type IAutomationPeerOverrides4 is access all IAutomationPeerOverrides4_Interface'Class;
   type IAutomationPeerOverrides4_Ptr is access all IAutomationPeerOverrides4;
   type IAutomationPeer5_Interface;
   type IAutomationPeer5 is access all IAutomationPeer5_Interface'Class;
   type IAutomationPeer5_Ptr is access all IAutomationPeer5;
   type IAutomationPeerOverrides5_Interface;
   type IAutomationPeerOverrides5 is access all IAutomationPeerOverrides5_Interface'Class;
   type IAutomationPeerOverrides5_Ptr is access all IAutomationPeerOverrides5;
   type IAutomationPeer6_Interface;
   type IAutomationPeer6 is access all IAutomationPeer6_Interface'Class;
   type IAutomationPeer6_Ptr is access all IAutomationPeer6;
   type IAutomationPeerOverrides6_Interface;
   type IAutomationPeerOverrides6 is access all IAutomationPeerOverrides6_Interface'Class;
   type IAutomationPeerOverrides6_Ptr is access all IAutomationPeerOverrides6;
   type IAutomationPeer7_Interface;
   type IAutomationPeer7 is access all IAutomationPeer7_Interface'Class;
   type IAutomationPeer7_Ptr is access all IAutomationPeer7;
   type IAutomationPeerAnnotation_Interface;
   type IAutomationPeerAnnotation is access all IAutomationPeerAnnotation_Interface'Class;
   type IAutomationPeerAnnotation_Ptr is access all IAutomationPeerAnnotation;
   type IAutomationPeerAnnotationStatics_Interface;
   type IAutomationPeerAnnotationStatics is access all IAutomationPeerAnnotationStatics_Interface'Class;
   type IAutomationPeerAnnotationStatics_Ptr is access all IAutomationPeerAnnotationStatics;
   type IAutomationPeerAnnotationFactory_Interface;
   type IAutomationPeerAnnotationFactory is access all IAutomationPeerAnnotationFactory_Interface'Class;
   type IAutomationPeerAnnotationFactory_Ptr is access all IAutomationPeerAnnotationFactory;
   type IFrameworkElementAutomationPeer_Interface;
   type IFrameworkElementAutomationPeer is access all IFrameworkElementAutomationPeer_Interface'Class;
   type IFrameworkElementAutomationPeer_Ptr is access all IFrameworkElementAutomationPeer;
   type IFrameworkElementAutomationPeerStatics_Interface;
   type IFrameworkElementAutomationPeerStatics is access all IFrameworkElementAutomationPeerStatics_Interface'Class;
   type IFrameworkElementAutomationPeerStatics_Ptr is access all IFrameworkElementAutomationPeerStatics;
   type IFrameworkElementAutomationPeerFactory_Interface;
   type IFrameworkElementAutomationPeerFactory is access all IFrameworkElementAutomationPeerFactory_Interface'Class;
   type IFrameworkElementAutomationPeerFactory_Ptr is access all IFrameworkElementAutomationPeerFactory;
   type IInkToolbarAutomationPeer_Interface;
   type IInkToolbarAutomationPeer is access all IInkToolbarAutomationPeer_Interface'Class;
   type IInkToolbarAutomationPeer_Ptr is access all IInkToolbarAutomationPeer;
   type IMapControlAutomationPeer_Interface;
   type IMapControlAutomationPeer is access all IMapControlAutomationPeer_Interface'Class;
   type IMapControlAutomationPeer_Ptr is access all IMapControlAutomationPeer;
   type ILoopingSelectorItemDataAutomationPeer_Interface;
   type ILoopingSelectorItemDataAutomationPeer is access all ILoopingSelectorItemDataAutomationPeer_Interface'Class;
   type ILoopingSelectorItemDataAutomationPeer_Ptr is access all ILoopingSelectorItemDataAutomationPeer;
   type IDatePickerFlyoutPresenterAutomationPeer_Interface;
   type IDatePickerFlyoutPresenterAutomationPeer is access all IDatePickerFlyoutPresenterAutomationPeer_Interface'Class;
   type IDatePickerFlyoutPresenterAutomationPeer_Ptr is access all IDatePickerFlyoutPresenterAutomationPeer;
   type IListPickerFlyoutPresenterAutomationPeer_Interface;
   type IListPickerFlyoutPresenterAutomationPeer is access all IListPickerFlyoutPresenterAutomationPeer_Interface'Class;
   type IListPickerFlyoutPresenterAutomationPeer_Ptr is access all IListPickerFlyoutPresenterAutomationPeer;
   type ILoopingSelectorAutomationPeer_Interface;
   type ILoopingSelectorAutomationPeer is access all ILoopingSelectorAutomationPeer_Interface'Class;
   type ILoopingSelectorAutomationPeer_Ptr is access all ILoopingSelectorAutomationPeer;
   type ILoopingSelectorItemAutomationPeer_Interface;
   type ILoopingSelectorItemAutomationPeer is access all ILoopingSelectorItemAutomationPeer_Interface'Class;
   type ILoopingSelectorItemAutomationPeer_Ptr is access all ILoopingSelectorItemAutomationPeer;
   type IPickerFlyoutPresenterAutomationPeer_Interface;
   type IPickerFlyoutPresenterAutomationPeer is access all IPickerFlyoutPresenterAutomationPeer_Interface'Class;
   type IPickerFlyoutPresenterAutomationPeer_Ptr is access all IPickerFlyoutPresenterAutomationPeer;
   type IPivotItemAutomationPeer_Interface;
   type IPivotItemAutomationPeer is access all IPivotItemAutomationPeer_Interface'Class;
   type IPivotItemAutomationPeer_Ptr is access all IPivotItemAutomationPeer;
   type IPivotItemAutomationPeerFactory_Interface;
   type IPivotItemAutomationPeerFactory is access all IPivotItemAutomationPeerFactory_Interface'Class;
   type IPivotItemAutomationPeerFactory_Ptr is access all IPivotItemAutomationPeerFactory;
   type IPivotItemDataAutomationPeer_Interface;
   type IPivotItemDataAutomationPeer is access all IPivotItemDataAutomationPeer_Interface'Class;
   type IPivotItemDataAutomationPeer_Ptr is access all IPivotItemDataAutomationPeer;
   type IPivotItemDataAutomationPeerFactory_Interface;
   type IPivotItemDataAutomationPeerFactory is access all IPivotItemDataAutomationPeerFactory_Interface'Class;
   type IPivotItemDataAutomationPeerFactory_Ptr is access all IPivotItemDataAutomationPeerFactory;
   type ITimePickerFlyoutPresenterAutomationPeer_Interface;
   type ITimePickerFlyoutPresenterAutomationPeer is access all ITimePickerFlyoutPresenterAutomationPeer_Interface'Class;
   type ITimePickerFlyoutPresenterAutomationPeer_Ptr is access all ITimePickerFlyoutPresenterAutomationPeer;
   type IPivotAutomationPeer_Interface;
   type IPivotAutomationPeer is access all IPivotAutomationPeer_Interface'Class;
   type IPivotAutomationPeer_Ptr is access all IPivotAutomationPeer;
   type IPivotAutomationPeerFactory_Interface;
   type IPivotAutomationPeerFactory is access all IPivotAutomationPeerFactory_Interface'Class;
   type IPivotAutomationPeerFactory_Ptr is access all IPivotAutomationPeerFactory;
   type IInvokeProvider_Imported_Interface;
   type IInvokeProvider_Imported is access all IInvokeProvider_Imported_Interface'Class;
   type IInvokeProvider_Imported_Ptr is access all IInvokeProvider_Imported;
   type IItemContainerProvider_Imported_Interface;
   type IItemContainerProvider_Imported is access all IItemContainerProvider_Imported_Interface'Class;
   type IItemContainerProvider_Imported_Ptr is access all IItemContainerProvider_Imported;
   type IRangeValueProvider_Imported_Interface;
   type IRangeValueProvider_Imported is access all IRangeValueProvider_Imported_Interface'Class;
   type IRangeValueProvider_Imported_Ptr is access all IRangeValueProvider_Imported;
   type IScrollItemProvider_Imported_Interface;
   type IScrollItemProvider_Imported is access all IScrollItemProvider_Imported_Interface'Class;
   type IScrollItemProvider_Imported_Ptr is access all IScrollItemProvider_Imported;
   type IScrollProvider_Imported_Interface;
   type IScrollProvider_Imported is access all IScrollProvider_Imported_Interface'Class;
   type IScrollProvider_Imported_Ptr is access all IScrollProvider_Imported;
   type ISelectionProvider_Imported_Interface;
   type ISelectionProvider_Imported is access all ISelectionProvider_Imported_Interface'Class;
   type ISelectionProvider_Imported_Ptr is access all ISelectionProvider_Imported;
   type IDropTargetProvider_Imported_Interface;
   type IDropTargetProvider_Imported is access all IDropTargetProvider_Imported_Interface'Class;
   type IDropTargetProvider_Imported_Ptr is access all IDropTargetProvider_Imported;
   type IToggleProvider_Imported_Interface;
   type IToggleProvider_Imported is access all IToggleProvider_Imported_Interface'Class;
   type IToggleProvider_Imported_Ptr is access all IToggleProvider_Imported;
   type ISelectionItemProvider_Imported_Interface;
   type ISelectionItemProvider_Imported is access all ISelectionItemProvider_Imported_Interface'Class;
   type ISelectionItemProvider_Imported_Ptr is access all ISelectionItemProvider_Imported;
   type IVirtualizedItemProvider_Imported_Interface;
   type IVirtualizedItemProvider_Imported is access all IVirtualizedItemProvider_Imported_Interface'Class;
   type IVirtualizedItemProvider_Imported_Ptr is access all IVirtualizedItemProvider_Imported;
   type IExpandCollapseProvider_Imported_Interface;
   type IExpandCollapseProvider_Imported is access all IExpandCollapseProvider_Imported_Interface'Class;
   type IExpandCollapseProvider_Imported_Ptr is access all IExpandCollapseProvider_Imported;
   type IValueProvider_Imported_Interface;
   type IValueProvider_Imported is access all IValueProvider_Imported_Interface'Class;
   type IValueProvider_Imported_Ptr is access all IValueProvider_Imported;
   type IWindowProvider_Imported_Interface;
   type IWindowProvider_Imported is access all IWindowProvider_Imported_Interface'Class;
   type IWindowProvider_Imported_Ptr is access all IWindowProvider_Imported;
   type ITransformProvider2_Imported_Interface;
   type ITransformProvider2_Imported is access all ITransformProvider2_Imported_Interface'Class;
   type ITransformProvider2_Imported_Ptr is access all ITransformProvider2_Imported;
   type ITransformProvider_Imported_Interface;
   type ITransformProvider_Imported is access all ITransformProvider_Imported_Interface'Class;
   type ITransformProvider_Imported_Ptr is access all ITransformProvider_Imported;
   type IIterator_IAutomationPeer_Interface;
   type IIterator_IAutomationPeer is access all IIterator_IAutomationPeer_Interface'Class;
   type IIterator_IAutomationPeer_Ptr is access all IIterator_IAutomationPeer;
   type IIterable_IAutomationPeer_Interface;
   type IIterable_IAutomationPeer is access all IIterable_IAutomationPeer_Interface'Class;
   type IIterable_IAutomationPeer_Ptr is access all IIterable_IAutomationPeer;
   type IVectorView_IAutomationPeer_Interface;
   type IVectorView_IAutomationPeer is access all IVectorView_IAutomationPeer_Interface'Class;
   type IVectorView_IAutomationPeer_Ptr is access all IVectorView_IAutomationPeer;
   type IVector_IAutomationPeer_Interface;
   type IVector_IAutomationPeer is access all IVector_IAutomationPeer_Interface'Class;
   type IVector_IAutomationPeer_Ptr is access all IVector_IAutomationPeer;
   type IIterator_IAutomationPeerAnnotation_Interface;
   type IIterator_IAutomationPeerAnnotation is access all IIterator_IAutomationPeerAnnotation_Interface'Class;
   type IIterator_IAutomationPeerAnnotation_Ptr is access all IIterator_IAutomationPeerAnnotation;
   type IIterable_IAutomationPeerAnnotation_Interface;
   type IIterable_IAutomationPeerAnnotation is access all IIterable_IAutomationPeerAnnotation_Interface'Class;
   type IIterable_IAutomationPeerAnnotation_Ptr is access all IIterable_IAutomationPeerAnnotation;
   type IVectorView_IAutomationPeerAnnotation_Interface;
   type IVectorView_IAutomationPeerAnnotation is access all IVectorView_IAutomationPeerAnnotation_Interface'Class;
   type IVectorView_IAutomationPeerAnnotation_Ptr is access all IVectorView_IAutomationPeerAnnotation;
   type IVector_IAutomationPeerAnnotation_Interface;
   type IVector_IAutomationPeerAnnotation is access all IVector_IAutomationPeerAnnotation_Interface'Class;
   type IVector_IAutomationPeerAnnotation_Ptr is access all IVector_IAutomationPeerAnnotation;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IColorSpectrumAutomationPeer : aliased constant Windows.IID := (366328323, 269, 20471, (144, 135, 244, 221, 9, 248, 49, 183 ));
   
   type IColorSpectrumAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IColorSpectrumAutomationPeerFactory : aliased constant Windows.IID := (180617441, 46915, 17558, (131, 122, 136, 137, 230, 172, 100, 151 ));
   
   type IColorSpectrumAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IColorSpectrumAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.Primitives.IColorSpectrum
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IColorSpectrumAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IColorPickerSliderAutomationPeer : aliased constant Windows.IID := (2769559898, 29331, 17783, (146, 76, 71, 212, 224, 191, 155, 144 ));
   
   type IColorPickerSliderAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IColorPickerSliderAutomationPeerFactory : aliased constant Windows.IID := (441829246, 40406, 17827, (144, 66, 180, 2, 0, 254, 161, 169 ));
   
   type IColorPickerSliderAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IColorPickerSliderAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.Primitives.IColorPickerSlider
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IColorPickerSliderAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INavigationViewItemAutomationPeer : aliased constant Windows.IID := (815286181, 39281, 19853, (168, 28, 8, 92, 112, 134, 161, 185 ));
   
   type INavigationViewItemAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_INavigationViewItemAutomationPeerFactory : aliased constant Windows.IID := (197296989, 43576, 20375, (150, 100, 230, 252, 130, 29, 129, 237 ));
   
   type INavigationViewItemAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access INavigationViewItemAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.INavigationViewItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.INavigationViewItemAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPersonPictureAutomationPeer : aliased constant Windows.IID := (655715660, 42607, 19119, (130, 134, 79, 121, 109, 48, 98, 140 ));
   
   type IPersonPictureAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IPersonPictureAutomationPeerFactory : aliased constant Windows.IID := (2841583469, 9508, 17572, (151, 253, 17, 129, 19, 1, 0, 173 ));
   
   type IPersonPictureAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IPersonPictureAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IPersonPicture
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IPersonPictureAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRatingControlAutomationPeer : aliased constant Windows.IID := (1024734362, 39267, 19015, (130, 60, 244, 87, 203, 50, 9, 213 ));
   
   type IRatingControlAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IRatingControlAutomationPeerFactory : aliased constant Windows.IID := (4051300978, 38982, 17970, (139, 156, 190, 111, 168, 211, 201, 187 ));
   
   type IRatingControlAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IRatingControlAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IRatingControl
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IRatingControlAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IItemAutomationPeer : aliased constant Windows.IID := (2503750902, 15153, 18343, (179, 191, 37, 211, 174, 153, 195, 23 ));
   
   type IItemAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Item
   (
      This       : access IItemAutomationPeer_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemsControlAutomationPeer
   (
      This       : access IItemAutomationPeer_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IItemsControlAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IItemAutomationPeerFactory : aliased constant Windows.IID := (688279667, 56893, 19775, (151, 180, 77, 111, 157, 83, 68, 77 ));
   
   type IItemAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithParentAndItem
   (
      This       : access IItemAutomationPeerFactory_Interface
      ; item : Windows.Object
      ; parent : Windows.UI.Xaml.Automation.Peers.IItemsControlAutomationPeer
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IItemAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IButtonBaseAutomationPeer : aliased constant Windows.IID := (2767435190, 30085, 19979, (150, 210, 8, 207, 111, 40, 190, 250 ));
   
   type IButtonBaseAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IButtonBaseAutomationPeerFactory : aliased constant Windows.IID := (2315520286, 59058, 19552, (167, 89, 193, 60, 164, 81, 101, 237 ));
   
   type IButtonBaseAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IButtonBaseAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.Primitives.IButtonBase
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IButtonBaseAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICaptureElementAutomationPeer : aliased constant Windows.IID := (3703852768, 64069, 17862, (139, 183, 50, 13, 128, 143, 89, 88 ));
   
   type ICaptureElementAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ICaptureElementAutomationPeerFactory : aliased constant Windows.IID := (2610097992, 34281, 18537, (177, 117, 143, 124, 244, 90, 109, 159 ));
   
   type ICaptureElementAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access ICaptureElementAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.ICaptureElement
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.ICaptureElementAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IComboBoxItemAutomationPeer : aliased constant Windows.IID := (316524398, 38226, 17514, (130, 238, 147, 140, 195, 113, 128, 15 ));
   
   type IComboBoxItemAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IComboBoxItemAutomationPeerFactory : aliased constant Windows.IID := (323667964, 14714, 16447, (166, 236, 28, 232, 190, 218, 21, 229 ));
   
   type IComboBoxItemAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IComboBoxItemAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IComboBoxItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IComboBoxItemAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFlipViewItemAutomationPeer : aliased constant Windows.IID := (3358602462, 64008, 19411, (174, 178, 210, 229, 191, 160, 77, 249 ));
   
   type IFlipViewItemAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IFlipViewItemAutomationPeerFactory : aliased constant Windows.IID := (1762693974, 53477, 19472, (160, 156, 173, 11, 241, 176, 203, 1 ));
   
   type IFlipViewItemAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IFlipViewItemAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IFlipViewItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IFlipViewItemAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGroupItemAutomationPeer : aliased constant Windows.IID := (420806253, 1856, 16950, (158, 225, 56, 207, 25, 193, 195, 136 ));
   
   type IGroupItemAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IGroupItemAutomationPeerFactory : aliased constant Windows.IID := (1453737319, 61980, 19600, (179, 121, 21, 162, 124, 127, 132, 9 ));
   
   type IGroupItemAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IGroupItemAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IGroupItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IGroupItemAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IImageAutomationPeer : aliased constant Windows.IID := (2601238412, 24738, 18623, (171, 44, 26, 82, 164, 81, 210, 212 ));
   
   type IImageAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IImageAutomationPeerFactory : aliased constant Windows.IID := (2419081219, 26749, 18367, (179, 162, 75, 171, 202, 216, 239, 80 ));
   
   type IImageAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IImageAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IImage
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IImageAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IItemsControlAutomationPeer : aliased constant Windows.IID := (2531748849, 14327, 16520, (146, 93, 101, 38, 142, 131, 227, 77 ));
   
   type IItemsControlAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IItemsControlAutomationPeerFactory : aliased constant Windows.IID := (1077453401, 11802, 18890, (165, 51, 198, 79, 24, 21, 119, 230 ));
   
   type IItemsControlAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IItemsControlAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IItemsControl
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IItemsControlAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IItemsControlAutomationPeer2 : aliased constant Windows.IID := (3297610007, 38312, 18360, (165, 23, 191, 137, 26, 108, 3, 155 ));
   
   type IItemsControlAutomationPeer2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateItemAutomationPeer
   (
      This       : access IItemsControlAutomationPeer2_Interface
      ; item : Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IItemAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IItemsControlAutomationPeerOverrides2 : aliased constant Windows.IID := (907919592, 46447, 17897, (128, 254, 16, 160, 251, 15, 225, 119 ));
   
   type IItemsControlAutomationPeerOverrides2_Interface is interface and Windows.IInspectable_Interface;
   
   function OnCreateItemAutomationPeer
   (
      This       : access IItemsControlAutomationPeerOverrides2_Interface
      ; item : Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IItemAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IListBoxItemAutomationPeer : aliased constant Windows.IID := (466018758, 10647, 17119, (153, 235, 146, 188, 29, 209, 73, 251 ));
   
   type IListBoxItemAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IListBoxItemAutomationPeerFactory : aliased constant Windows.IID := (1352637912, 45226, 17471, (161, 16, 65, 32, 154, 244, 79, 28 ));
   
   type IListBoxItemAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IListBoxItemAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IListBoxItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IListBoxItemAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMediaTransportControlsAutomationPeer : aliased constant Windows.IID := (2746060179, 31224, 18776, (163, 200, 152, 13, 239, 184, 61, 21 ));
   
   type IMediaTransportControlsAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IMediaTransportControlsAutomationPeerFactory : aliased constant Windows.IID := (4095520771, 57603, 19120, (129, 42, 160, 143, 189, 181, 112, 206 ));
   
   type IMediaTransportControlsAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IMediaTransportControlsAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IMediaTransportControls
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IMediaTransportControlsAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPasswordBoxAutomationPeer : aliased constant Windows.IID := (1750009438, 15859, 19359, (130, 173, 136, 25, 219, 59, 33, 138 ));
   
   type IPasswordBoxAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IPasswordBoxAutomationPeerFactory : aliased constant Windows.IID := (2889711326, 56484, 18460, (181, 32, 74, 155, 63, 59, 23, 156 ));
   
   type IPasswordBoxAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IPasswordBoxAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IPasswordBox
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IPasswordBoxAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProgressRingAutomationPeer : aliased constant Windows.IID := (3157286638, 14803, 20203, (172, 51, 35, 148, 222, 18, 62, 46 ));
   
   type IProgressRingAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IProgressRingAutomationPeerFactory : aliased constant Windows.IID := (4091224139, 5502, 16572, (149, 147, 85, 188, 92, 113, 164, 246 ));
   
   type IProgressRingAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IProgressRingAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IProgressRing
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IProgressRingAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRangeBaseAutomationPeer : aliased constant Windows.IID := (3830756681, 19244, 17069, (176, 75, 211, 89, 71, 209, 238, 80 ));
   
   type IRangeBaseAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IRangeBaseAutomationPeerFactory : aliased constant Windows.IID := (2189194753, 12408, 17529, (149, 234, 145, 55, 76, 160, 98, 7 ));
   
   type IRangeBaseAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IRangeBaseAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.Primitives.IRangeBase
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IRangeBaseAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRichTextBlockAutomationPeer : aliased constant Windows.IID := (2476743324, 38409, 16890, (130, 243, 144, 156, 9, 244, 154, 114 ));
   
   type IRichTextBlockAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IRichTextBlockAutomationPeerFactory : aliased constant Windows.IID := (540585569, 5001, 18042, (174, 214, 55, 51, 77, 169, 98, 43 ));
   
   type IRichTextBlockAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IRichTextBlockAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IRichTextBlock
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IRichTextBlockAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRichTextBlockOverflowAutomationPeer : aliased constant Windows.IID := (2358919322, 10038, 17275, (171, 54, 161, 106, 32, 47, 16, 93 ));
   
   type IRichTextBlockOverflowAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IRichTextBlockOverflowAutomationPeerFactory : aliased constant Windows.IID := (3177100899, 11284, 18021, (173, 239, 242, 176, 51, 148, 123, 235 ));
   
   type IRichTextBlockOverflowAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IRichTextBlockOverflowAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IRichTextBlockOverflow
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IRichTextBlockOverflowAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISelectorItemAutomationPeer : aliased constant Windows.IID := (2928358519, 34314, 17851, (191, 124, 225, 178, 116, 25, 209, 221 ));
   
   type ISelectorItemAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ISelectorItemAutomationPeerFactory : aliased constant Windows.IID := (1725427195, 30829, 17250, (169, 100, 235, 251, 33, 119, 108, 48 ));
   
   type ISelectorItemAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithParentAndItem
   (
      This       : access ISelectorItemAutomationPeerFactory_Interface
      ; item : Windows.Object
      ; parent : Windows.UI.Xaml.Automation.Peers.ISelectorAutomationPeer
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.ISelectorItemAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISemanticZoomAutomationPeer : aliased constant Windows.IID := (1009757292, 43383, 18428, (180, 78, 39, 84, 192, 178, 190, 169 ));
   
   type ISemanticZoomAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ISemanticZoomAutomationPeerFactory : aliased constant Windows.IID := (4112045133, 42131, 17558, (176, 119, 150, 116, 199, 244, 197, 250 ));
   
   type ISemanticZoomAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access ISemanticZoomAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.ISemanticZoom
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.ISemanticZoomAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISettingsFlyoutAutomationPeer : aliased constant Windows.IID := (3504213211, 12495, 18342, (165, 235, 156, 119, 240, 176, 214, 221 ));
   
   type ISettingsFlyoutAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ISettingsFlyoutAutomationPeerFactory : aliased constant Windows.IID := (4182205117, 35348, 16612, (148, 167, 63, 51, 201, 34, 233, 69 ));
   
   type ISettingsFlyoutAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access ISettingsFlyoutAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.ISettingsFlyout
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.ISettingsFlyoutAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITextBlockAutomationPeer : aliased constant Windows.IID := (3189790709, 26389, 20073, (160, 80, 146, 189, 12, 226, 50, 169 ));
   
   type ITextBlockAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ITextBlockAutomationPeerFactory : aliased constant Windows.IID := (1992266315, 31904, 19201, (188, 92, 168, 207, 77, 54, 145, 222 ));
   
   type ITextBlockAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access ITextBlockAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.ITextBlock
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.ITextBlockAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITextBoxAutomationPeer : aliased constant Windows.IID := (978263200, 24157, 19750, (144, 103, 231, 64, 191, 101, 122, 159 ));
   
   type ITextBoxAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ITextBoxAutomationPeerFactory : aliased constant Windows.IID := (32555111, 38507, 16688, (184, 114, 70, 158, 66, 189, 74, 127 ));
   
   type ITextBoxAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access ITextBoxAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.ITextBox
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.ITextBoxAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IThumbAutomationPeer : aliased constant Windows.IID := (3693693365, 46174, 19821, (137, 47, 217, 66, 44, 149, 14, 251 ));
   
   type IThumbAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IThumbAutomationPeerFactory : aliased constant Windows.IID := (2533835775, 44865, 17920, (181, 93, 38, 212, 61, 248, 96, 225 ));
   
   type IThumbAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IThumbAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.Primitives.IThumb
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IThumbAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToggleSwitchAutomationPeer : aliased constant Windows.IID := (3222401396, 59550, 18320, (191, 154, 120, 235, 181, 245, 158, 159 ));
   
   type IToggleSwitchAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IToggleSwitchAutomationPeerFactory : aliased constant Windows.IID := (838415331, 65272, 17433, (157, 245, 217, 239, 113, 150, 234, 52 ));
   
   type IToggleSwitchAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IToggleSwitchAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IToggleSwitch
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IToggleSwitchAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IButtonAutomationPeer : aliased constant Windows.IID := (4218941374, 14828, 17672, (138, 195, 81, 161, 66, 64, 39, 215 ));
   
   type IButtonAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IButtonAutomationPeerFactory : aliased constant Windows.IID := (1071357769, 62635, 18304, (134, 68, 3, 55, 98, 153, 161, 117 ));
   
   type IButtonAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IButtonAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IButton
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IButtonAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IComboBoxItemDataAutomationPeer : aliased constant Windows.IID := (1341091314, 10396, 19460, (131, 27, 90, 102, 140, 109, 113, 4 ));
   
   type IComboBoxItemDataAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IComboBoxItemDataAutomationPeerFactory : aliased constant Windows.IID := (346608886, 18074, 16826, (157, 147, 68, 161, 165, 93, 168, 114 ));
   
   type IComboBoxItemDataAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithParentAndItem
   (
      This       : access IComboBoxItemDataAutomationPeerFactory_Interface
      ; item : Windows.Object
      ; parent : Windows.UI.Xaml.Automation.Peers.IComboBoxAutomationPeer
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IComboBoxItemDataAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFlipViewItemDataAutomationPeer : aliased constant Windows.IID := (2962776437, 188, 16664, (138, 111, 22, 238, 156, 21, 217, 104 ));
   
   type IFlipViewItemDataAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IFlipViewItemDataAutomationPeerFactory : aliased constant Windows.IID := (1015432083, 2794, 20088, (188, 17, 183, 117, 202, 196, 17, 76 ));
   
   type IFlipViewItemDataAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithParentAndItem
   (
      This       : access IFlipViewItemDataAutomationPeerFactory_Interface
      ; item : Windows.Object
      ; parent : Windows.UI.Xaml.Automation.Peers.IFlipViewAutomationPeer
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IFlipViewItemDataAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHyperlinkButtonAutomationPeer : aliased constant Windows.IID := (2860186801, 3807, 18137, (170, 158, 14, 178, 29, 20, 0, 151 ));
   
   type IHyperlinkButtonAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IHyperlinkButtonAutomationPeerFactory : aliased constant Windows.IID := (1505498721, 49538, 18863, (149, 38, 68, 184, 142, 98, 132, 85 ));
   
   type IHyperlinkButtonAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IHyperlinkButtonAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IHyperlinkButton
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IHyperlinkButtonAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IListBoxItemDataAutomationPeer : aliased constant Windows.IID := (4252852206, 64992, 18474, (128, 132, 220, 235, 186, 91, 152, 6 ));
   
   type IListBoxItemDataAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IListBoxItemDataAutomationPeerFactory : aliased constant Windows.IID := (3616689686, 48525, 18018, (169, 149, 32, 255, 154, 5, 96, 147 ));
   
   type IListBoxItemDataAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithParentAndItem
   (
      This       : access IListBoxItemDataAutomationPeerFactory_Interface
      ; item : Windows.Object
      ; parent : Windows.UI.Xaml.Automation.Peers.IListBoxAutomationPeer
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IListBoxItemDataAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProgressBarAutomationPeer : aliased constant Windows.IID := (2482278278, 55360, 20406, (172, 47, 95, 119, 155, 133, 75, 13 ));
   
   type IProgressBarAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IProgressBarAutomationPeerFactory : aliased constant Windows.IID := (910588331, 47119, 16820, (142, 234, 47, 82, 81, 188, 115, 156 ));
   
   type IProgressBarAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IProgressBarAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IProgressBar
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IProgressBarAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRepeatButtonAutomationPeer : aliased constant Windows.IID := (702814933, 43180, 20106, (131, 216, 9, 227, 126, 5, 66, 87 ));
   
   type IRepeatButtonAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IRepeatButtonAutomationPeerFactory : aliased constant Windows.IID := (1785723348, 22366, 20064, (189, 214, 236, 20, 65, 155, 79, 246 ));
   
   type IRepeatButtonAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IRepeatButtonAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.Primitives.IRepeatButton
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IRepeatButtonAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IScrollBarAutomationPeer : aliased constant Windows.IID := (1776337769, 48103, 16882, (135, 202, 170, 216, 19, 254, 85, 14 ));
   
   type IScrollBarAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IScrollBarAutomationPeerFactory : aliased constant Windows.IID := (3778027792, 45035, 17813, (142, 61, 237, 192, 132, 74, 43, 33 ));
   
   type IScrollBarAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IScrollBarAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.Primitives.IScrollBar
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IScrollBarAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISelectorAutomationPeer : aliased constant Windows.IID := (371902505, 28949, 17388, (179, 131, 167, 183, 22, 68, 6, 157 ));
   
   type ISelectorAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ISelectorAutomationPeerFactory : aliased constant Windows.IID := (2068993606, 33435, 19916, (189, 82, 90, 141, 3, 153, 56, 122 ));
   
   type ISelectorAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access ISelectorAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.Primitives.ISelector
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.ISelectorAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISliderAutomationPeer : aliased constant Windows.IID := (3962569050, 54801, 18128, (174, 79, 110, 207, 39, 223, 186, 165 ));
   
   type ISliderAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ISliderAutomationPeerFactory : aliased constant Windows.IID := (2535161942, 39546, 19961, (149, 250, 111, 92, 4, 201, 28, 172 ));
   
   type ISliderAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access ISliderAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.ISlider
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.ISliderAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToggleButtonAutomationPeer : aliased constant Windows.IID := (1658578629, 48138, 17851, (191, 119, 234, 15, 21, 2, 137, 31 ));
   
   type IToggleButtonAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IToggleButtonAutomationPeerFactory : aliased constant Windows.IID := (3374419140, 44363, 19715, (166, 164, 125, 89, 230, 54, 0, 4 ));
   
   type IToggleButtonAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IToggleButtonAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.Primitives.IToggleButton
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IToggleButtonAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICheckBoxAutomationPeer : aliased constant Windows.IID := (3944070210, 49321, 18118, (172, 36, 184, 61, 228, 41, 199, 51 ));
   
   type ICheckBoxAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ICheckBoxAutomationPeerFactory : aliased constant Windows.IID := (3076290397, 60303, 17647, (162, 124, 226, 106, 199, 222, 131, 51 ));
   
   type ICheckBoxAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access ICheckBoxAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.ICheckBox
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.ICheckBoxAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IComboBoxAutomationPeer : aliased constant Windows.IID := (2125729035, 30149, 16995, (186, 106, 212, 165, 79, 176, 242, 57 ));
   
   type IComboBoxAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IComboBoxAutomationPeerFactory : aliased constant Windows.IID := (160324365, 7056, 16569, (155, 227, 178, 50, 103, 235, 19, 207 ));
   
   type IComboBoxAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IComboBoxAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IComboBox
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IComboBoxAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFlipViewAutomationPeer : aliased constant Windows.IID := (2394961210, 17028, 19200, (174, 248, 162, 104, 142, 165, 227, 196 ));
   
   type IFlipViewAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IFlipViewAutomationPeerFactory : aliased constant Windows.IID := (1133882125, 36227, 18492, (136, 235, 226, 97, 123, 13, 41, 63 ));
   
   type IFlipViewAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IFlipViewAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IFlipView
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IFlipViewAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IListBoxAutomationPeer : aliased constant Windows.IID := (2362496520, 46082, 19054, (189, 154, 52, 63, 136, 69, 235, 50 ));
   
   type IListBoxAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IListBoxAutomationPeerFactory : aliased constant Windows.IID := (3795198341, 32246, 18935, (138, 188, 76, 51, 241, 163, 212, 110 ));
   
   type IListBoxAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IListBoxAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IListBox
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IListBoxAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRadioButtonAutomationPeer : aliased constant Windows.IID := (2120900312, 2864, 18243, (177, 2, 220, 223, 84, 142, 49, 49 ));
   
   type IRadioButtonAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IRadioButtonAutomationPeerFactory : aliased constant Windows.IID := (1228981501, 15752, 18890, (143, 49, 146, 65, 135, 175, 11, 254 ));
   
   type IRadioButtonAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IRadioButtonAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IRadioButton
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IRadioButtonAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppBarAutomationPeer : aliased constant Windows.IID := (2336935915, 35322, 20243, (132, 190, 53, 202, 91, 124, 149, 144 ));
   
   type IAppBarAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IAppBarAutomationPeerFactory : aliased constant Windows.IID := (2204169442, 58262, 17687, (175, 93, 244, 207, 52, 197, 78, 223 ));
   
   type IAppBarAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IAppBarAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IAppBar
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAppBarAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutoSuggestBoxAutomationPeer : aliased constant Windows.IID := (791855874, 63899, 18717, (151, 38, 165, 225, 129, 100, 62, 250 ));
   
   type IAutoSuggestBoxAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IAutoSuggestBoxAutomationPeerFactory : aliased constant Windows.IID := (2147772489, 6375, 17525, (179, 98, 75, 189, 83, 210, 69, 98 ));
   
   type IAutoSuggestBoxAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IAutoSuggestBoxAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IAutoSuggestBox
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutoSuggestBoxAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDatePickerAutomationPeer : aliased constant Windows.IID := (3497866623, 41145, 17884, (153, 26, 118, 197, 5, 231, 208, 245 ));
   
   type IDatePickerAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IDatePickerAutomationPeerFactory : aliased constant Windows.IID := (3848699161, 37207, 17462, (159, 77, 127, 185, 145, 116, 180, 142 ));
   
   type IDatePickerAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IDatePickerAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IDatePicker
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IDatePickerAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFlyoutPresenterAutomationPeer : aliased constant Windows.IID := (2685943988, 24522, 17775, (152, 234, 48, 14, 180, 11, 88, 94 ));
   
   type IFlyoutPresenterAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IFlyoutPresenterAutomationPeerFactory : aliased constant Windows.IID := (4082111839, 35108, 17600, (186, 68, 101, 63, 231, 159, 30, 251 ));
   
   type IFlyoutPresenterAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IFlyoutPresenterAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IFlyoutPresenter
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IFlyoutPresenterAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGridViewItemAutomationPeer : aliased constant Windows.IID := (2481925383, 13420, 16742, (164, 186, 188, 106, 24, 30, 127, 51 ));
   
   type IGridViewItemAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IGridViewItemAutomationPeerFactory : aliased constant Windows.IID := (4211000182, 61998, 18029, (145, 60, 174, 36, 204, 219, 22, 15 ));
   
   type IGridViewItemAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IGridViewItemAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IGridViewItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IGridViewItemAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHubAutomationPeer : aliased constant Windows.IID := (1306452054, 20156, 17952, (160, 93, 144, 62, 60, 154, 78, 173 ));
   
   type IHubAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IHubAutomationPeerFactory : aliased constant Windows.IID := (3345142847, 31197, 17390, (135, 119, 141, 8, 179, 154, 160, 101 ));
   
   type IHubAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IHubAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IHub
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IHubAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHubSectionAutomationPeer : aliased constant Windows.IID := (383328247, 29745, 19842, (131, 206, 207, 163, 25, 43, 15, 24 ));
   
   type IHubSectionAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IHubSectionAutomationPeerFactory : aliased constant Windows.IID := (3331205096, 6124, 17193, (145, 174, 45, 11, 35, 57, 212, 152 ));
   
   type IHubSectionAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IHubSectionAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IHubSection
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IHubSectionAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IListViewBaseHeaderItemAutomationPeer : aliased constant Windows.IID := (2092480306, 49648, 19004, (188, 20, 133, 221, 72, 222, 219, 133 ));
   
   type IListViewBaseHeaderItemAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IListViewBaseHeaderItemAutomationPeerFactory : aliased constant Windows.IID := (1089247583, 54833, 16388, (131, 46, 109, 134, 67, 229, 21, 97 ));
   
   type IListViewBaseHeaderItemAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IListViewBaseHeaderItemAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IListViewBaseHeaderItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IListViewBaseHeaderItemAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IListViewItemAutomationPeer : aliased constant Windows.IID := (3390131824, 41325, 19721, (161, 207, 24, 86, 239, 152, 169, 236 ));
   
   type IListViewItemAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IListViewItemAutomationPeerFactory : aliased constant Windows.IID := (3296590784, 64204, 16420, (167, 59, 23, 236, 78, 102, 38, 84 ));
   
   type IListViewItemAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IListViewItemAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IListViewItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IListViewItemAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMediaElementAutomationPeer : aliased constant Windows.IID := (3121323970, 42722, 16805, (177, 122, 209, 89, 70, 19, 239, 186 ));
   
   type IMediaElementAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IMediaElementAutomationPeerFactory : aliased constant Windows.IID := (2997697320, 30069, 16755, (155, 199, 128, 54, 122, 22, 78, 210 ));
   
   type IMediaElementAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IMediaElementAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IMediaElement
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IMediaElementAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMediaPlayerElementAutomationPeer : aliased constant Windows.IID := (46060041, 16229, 20445, (181, 202, 196, 117, 13, 78, 110, 164 ));
   
   type IMediaPlayerElementAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IMediaPlayerElementAutomationPeerFactory : aliased constant Windows.IID := (142901367, 33455, 19737, (177, 112, 40, 42, 158, 14, 127, 55 ));
   
   type IMediaPlayerElementAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IMediaPlayerElementAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IMediaPlayerElement
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IMediaPlayerElementAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMenuFlyoutItemAutomationPeer : aliased constant Windows.IID := (532780130, 8671, 17774, (170, 17, 143, 172, 107, 75, 42, 246 ));
   
   type IMenuFlyoutItemAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IMenuFlyoutItemAutomationPeerFactory : aliased constant Windows.IID := (3498835128, 8401, 17880, (162, 194, 47, 19, 13, 247, 20, 224 ));
   
   type IMenuFlyoutItemAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IMenuFlyoutItemAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IMenuFlyoutItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IMenuFlyoutItemAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRichEditBoxAutomationPeer : aliased constant Windows.IID := (3332332548, 5870, 18042, (168, 51, 195, 218, 132, 88, 173, 100 ));
   
   type IRichEditBoxAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IRichEditBoxAutomationPeerFactory : aliased constant Windows.IID := (1965851545, 53910, 19847, (144, 32, 164, 117, 14, 136, 91, 60 ));
   
   type IRichEditBoxAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IRichEditBoxAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IRichEditBox
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IRichEditBoxAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IScrollViewerAutomationPeer : aliased constant Windows.IID := (3649434201, 6921, 20104, (136, 253, 66, 23, 80, 220, 107, 69 ));
   
   type IScrollViewerAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IScrollViewerAutomationPeerFactory : aliased constant Windows.IID := (655228797, 55661, 18681, (163, 106, 194, 82, 170, 156, 70, 112 ));
   
   type IScrollViewerAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IScrollViewerAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IScrollViewer
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IScrollViewerAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISearchBoxAutomationPeer : aliased constant Windows.IID := (2235568548, 6310, 20272, (147, 155, 136, 113, 175, 163, 245, 233 ));
   
   type ISearchBoxAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ISearchBoxAutomationPeerFactory : aliased constant Windows.IID := (3015709744, 32682, 16827, (142, 145, 124, 118, 28, 82, 103, 241 ));
   
   type ISearchBoxAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access ISearchBoxAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.ISearchBox
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.ISearchBoxAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITimePickerAutomationPeer : aliased constant Windows.IID := (2755478767, 12933, 19959, (180, 164, 228, 205, 243, 106, 58, 23 ));
   
   type ITimePickerAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ITimePickerAutomationPeerFactory : aliased constant Windows.IID := (2542757489, 18424, 16551, (158, 33, 104, 18, 139, 22, 180, 253 ));
   
   type ITimePickerAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access ITimePickerAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.ITimePicker
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.ITimePickerAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToggleMenuFlyoutItemAutomationPeer : aliased constant Windows.IID := (1800923902, 27377, 18691, (131, 115, 52, 55, 191, 53, 35, 69 ));
   
   type IToggleMenuFlyoutItemAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IToggleMenuFlyoutItemAutomationPeerFactory : aliased constant Windows.IID := (2486586231, 36716, 18487, (170, 227, 148, 208, 16, 216, 209, 98 ));
   
   type IToggleMenuFlyoutItemAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IToggleMenuFlyoutItemAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IToggleMenuFlyoutItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IToggleMenuFlyoutItemAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGridViewHeaderItemAutomationPeer : aliased constant Windows.IID := (3822907194, 57482, 18663, (178, 58, 43, 229, 182, 110, 71, 78 ));
   
   type IGridViewHeaderItemAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IGridViewHeaderItemAutomationPeerFactory : aliased constant Windows.IID := (746632402, 65474, 16727, (136, 221, 89, 205, 146, 227, 151, 21 ));
   
   type IGridViewHeaderItemAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IGridViewHeaderItemAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IGridViewHeaderItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IGridViewHeaderItemAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGridViewItemDataAutomationPeer : aliased constant Windows.IID := (4092888719, 10708, 16532, (140, 84, 234, 97, 168, 130, 148, 164 ));
   
   type IGridViewItemDataAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IGridViewItemDataAutomationPeerFactory : aliased constant Windows.IID := (2791209608, 30477, 16428, (153, 111, 103, 80, 106, 242, 164, 175 ));
   
   type IGridViewItemDataAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithParentAndItem
   (
      This       : access IGridViewItemDataAutomationPeerFactory_Interface
      ; item : Windows.Object
      ; parent : Windows.UI.Xaml.Automation.Peers.IGridViewAutomationPeer
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IGridViewItemDataAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IListViewHeaderItemAutomationPeer : aliased constant Windows.IID := (1739267659, 44385, 19592, (186, 69, 15, 58, 141, 6, 31, 143 ));
   
   type IListViewHeaderItemAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IListViewHeaderItemAutomationPeerFactory : aliased constant Windows.IID := (124159636, 11429, 19428, (168, 185, 89, 45, 72, 247, 96, 135 ));
   
   type IListViewHeaderItemAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IListViewHeaderItemAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IListViewHeaderItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IListViewHeaderItemAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IListViewItemDataAutomationPeer : aliased constant Windows.IID := (363386877, 55205, 19052, (150, 60, 111, 124, 228, 100, 103, 26 ));
   
   type IListViewItemDataAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IListViewItemDataAutomationPeerFactory : aliased constant Windows.IID := (3504018107, 55061, 17699, (172, 192, 30, 16, 114, 216, 227, 43 ));
   
   type IListViewItemDataAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithParentAndItem
   (
      This       : access IListViewItemDataAutomationPeerFactory_Interface
      ; item : Windows.Object
      ; parent : Windows.UI.Xaml.Automation.Peers.IListViewBaseAutomationPeer
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IListViewItemDataAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMenuFlyoutPresenterAutomationPeer : aliased constant Windows.IID := (3796150385, 64699, 18684, (138, 147, 65, 234, 19, 75, 83, 206 ));
   
   type IMenuFlyoutPresenterAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IMenuFlyoutPresenterAutomationPeerFactory : aliased constant Windows.IID := (129308461, 30237, 17707, (158, 109, 250, 42, 139, 224, 173, 38 ));
   
   type IMenuFlyoutPresenterAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IMenuFlyoutPresenterAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IMenuFlyoutPresenter
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IMenuFlyoutPresenterAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppBarButtonAutomationPeer : aliased constant Windows.IID := (1144152754, 20333, 19318, (157, 46, 62, 255, 119, 126, 136, 100 ));
   
   type IAppBarButtonAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IAppBarButtonAutomationPeerFactory : aliased constant Windows.IID := (2934977578, 44215, 17116, (151, 227, 132, 112, 113, 134, 95, 214 ));
   
   type IAppBarButtonAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IAppBarButtonAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IAppBarButton
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAppBarButtonAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppBarToggleButtonAutomationPeer : aliased constant Windows.IID := (2221207469, 38485, 19199, (149, 80, 99, 174, 158, 200, 254, 156 ));
   
   type IAppBarToggleButtonAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IAppBarToggleButtonAutomationPeerFactory : aliased constant Windows.IID := (3606647709, 705, 16929, (149, 145, 125, 78, 254, 183, 71, 1 ));
   
   type IAppBarToggleButtonAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IAppBarToggleButtonAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IAppBarToggleButton
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAppBarToggleButtonAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IListViewBaseAutomationPeer : aliased constant Windows.IID := (2280420937, 47165, 20053, (154, 253, 189, 131, 94, 116, 143, 92 ));
   
   type IListViewBaseAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IListViewBaseAutomationPeerFactory : aliased constant Windows.IID := (1892926142, 35152, 17991, (147, 98, 253, 0, 47, 143, 248, 46 ));
   
   type IListViewBaseAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IListViewBaseAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IListViewBase
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IListViewBaseAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGridViewAutomationPeer : aliased constant Windows.IID := (474218916, 55633, 18890, (143, 130, 199, 243, 198, 6, 129, 176 ));
   
   type IGridViewAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IGridViewAutomationPeerFactory : aliased constant Windows.IID := (2328517085, 8871, 18432, (137, 75, 193, 244, 133, 243, 137, 83 ));
   
   type IGridViewAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IGridViewAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IGridView
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IGridViewAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IListViewAutomationPeer : aliased constant Windows.IID := (1942932615, 49372, 16992, (145, 72, 117, 233, 134, 74, 114, 48 ));
   
   type IListViewAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IListViewAutomationPeerFactory : aliased constant Windows.IID := (1710461300, 60066, 20036, (139, 230, 76, 202, 40, 205, 2, 136 ));
   
   type IListViewAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IListViewAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IListView
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IListViewAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPeer : aliased constant Windows.IID := (900384890, 25326, 19774, (162, 76, 43, 200, 67, 45, 104, 183 ));
   
   type IAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EventsSource
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   function put_EventsSource
   (
      This       : access IAutomationPeer_Interface
      ; value : Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   function GetPattern
   (
      This       : access IAutomationPeer_Interface
      ; patternInterface : Windows.UI.Xaml.Automation.Peers.PatternInterface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function RaiseAutomationEvent
   (
      This       : access IAutomationPeer_Interface
      ; eventId : Windows.UI.Xaml.Automation.Peers.AutomationEvents
   )
   return Windows.HRESULT is abstract;
   
   function RaisePropertyChangedEvent
   (
      This       : access IAutomationPeer_Interface
      ; automationProperty : Windows.UI.Xaml.Automation.IAutomationProperty
      ; oldValue : Windows.Object
      ; newValue : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function GetAcceleratorKey
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetAccessKey
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetAutomationControlType
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.AutomationControlType
   )
   return Windows.HRESULT is abstract;
   
   function GetAutomationId
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetBoundingRectangle
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function GetChildren
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IVector_IAutomationPeer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetClassName
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetClickablePoint
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function GetHelpText
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetItemStatus
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetItemType
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetLabeledBy
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   function GetLocalizedControlType
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetName
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetOrientation
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.AutomationOrientation
   )
   return Windows.HRESULT is abstract;
   
   function HasKeyboardFocus
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsContentElement
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsControlElement
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsEnabled
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsKeyboardFocusable
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsOffscreen
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsPassword
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsRequiredForForm
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetFocus
   (
      This       : access IAutomationPeer_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetParent
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   function InvalidatePeer
   (
      This       : access IAutomationPeer_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetPeerFromPoint
   (
      This       : access IAutomationPeer_Interface
      ; point : Windows.Foundation.Point
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   function GetLiveSetting
   (
      This       : access IAutomationPeer_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.AutomationLiveSetting
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPeerOverrides : aliased constant Windows.IID := (3198762599, 56302, 20347, (175, 13, 167, 154, 174, 83, 51, 191 ));
   
   type IAutomationPeerOverrides_Interface is interface and Windows.IInspectable_Interface;
   
   function GetPatternCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; patternInterface : Windows.UI.Xaml.Automation.Peers.PatternInterface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function GetAcceleratorKeyCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetAccessKeyCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetAutomationControlTypeCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.AutomationControlType
   )
   return Windows.HRESULT is abstract;
   
   function GetAutomationIdCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetBoundingRectangleCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function GetChildrenCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IVector_IAutomationPeer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetClassNameCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetClickablePointCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function GetHelpTextCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetItemStatusCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetItemTypeCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetLabeledByCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   function GetLocalizedControlTypeCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetNameCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetOrientationCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.AutomationOrientation
   )
   return Windows.HRESULT is abstract;
   
   function HasKeyboardFocusCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsContentElementCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsControlElementCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsEnabledCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsKeyboardFocusableCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsOffscreenCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsPasswordCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsRequiredForFormCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetFocusCore
   (
      This       : access IAutomationPeerOverrides_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetPeerFromPointCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; point : Windows.Foundation.Point
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   function GetLiveSettingCore
   (
      This       : access IAutomationPeerOverrides_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.AutomationLiveSetting
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPeerProtected : aliased constant Windows.IID := (4105440850, 25647, 17961, (165, 74, 234, 93, 35, 73, 196, 72 ));
   
   type IAutomationPeerProtected_Interface is interface and Windows.IInspectable_Interface;
   
   function PeerFromProvider
   (
      This       : access IAutomationPeerProtected_Interface
      ; provider : Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   function ProviderFromPeer
   (
      This       : access IAutomationPeerProtected_Interface
      ; peer : Windows.UI.Xaml.Automation.Peers.IAutomationPeer
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPeerStatics : aliased constant Windows.IID := (1445953456, 41777, 19100, (157, 236, 191, 183, 88, 111, 255, 255 ));
   
   type IAutomationPeerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function ListenerExists
   (
      This       : access IAutomationPeerStatics_Interface
      ; eventId : Windows.UI.Xaml.Automation.Peers.AutomationEvents
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPeerFactory : aliased constant Windows.IID := (549614917, 43147, 17352, (188, 36, 206, 169, 218, 253, 4, 163 ));
   
   type IAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IAutomationPeerFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPeer2 : aliased constant Windows.IID := (3927935431, 60405, 19128, (136, 247, 104, 13, 130, 29, 172, 97 ));
   
   type IAutomationPeer2_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPeerOverrides2 : aliased constant Windows.IID := (637757482, 40358, 16419, (180, 150, 73, 110, 94, 242, 40, 210 ));
   
   type IAutomationPeerOverrides2_Interface is interface and Windows.IInspectable_Interface;
   
   function ShowContextMenuCore
   (
      This       : access IAutomationPeerOverrides2_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetControlledPeersCore
   (
      This       : access IAutomationPeerOverrides2_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IVectorView_IAutomationPeer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPeer3 : aliased constant Windows.IID := (3553606007, 132, 16855, (162, 33, 40, 21, 141, 59, 195, 44 ));
   
   type IAutomationPeer3_Interface is interface and Windows.IInspectable_Interface;
   
   function Navigate
   (
      This       : access IAutomationPeer3_Interface
      ; direction : Windows.UI.Xaml.Automation.Peers.AutomationNavigationDirection
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function GetElementFromPoint
   (
      This       : access IAutomationPeer3_Interface
      ; pointInWindowCoordinates : Windows.Foundation.Point
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function GetFocusedElement
   (
      This       : access IAutomationPeer3_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function ShowContextMenu
   (
      This       : access IAutomationPeer3_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetControlledPeers
   (
      This       : access IAutomationPeer3_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IVectorView_IAutomationPeer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAnnotations
   (
      This       : access IAutomationPeer3_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IVector_IAutomationPeerAnnotation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetParent
   (
      This       : access IAutomationPeer3_Interface
      ; peer : Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   function RaiseTextEditTextChangedEvent
   (
      This       : access IAutomationPeer3_Interface
      ; automationTextEditChangeType : Windows.UI.Xaml.Automation.AutomationTextEditChangeType
      ; changedData : Windows.Foundation.Collections.IVectorView_String
   )
   return Windows.HRESULT is abstract;
   
   function GetPositionInSet
   (
      This       : access IAutomationPeer3_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function GetSizeOfSet
   (
      This       : access IAutomationPeer3_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function GetLevel
   (
      This       : access IAutomationPeer3_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function RaiseStructureChangedEvent
   (
      This       : access IAutomationPeer3_Interface
      ; structureChangeType : Windows.UI.Xaml.Automation.Peers.AutomationStructureChangeType
      ; child : Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPeerOverrides3 : aliased constant Windows.IID := (3069232301, 19769, 18918, (187, 145, 217, 36, 238, 253, 133, 56 ));
   
   type IAutomationPeerOverrides3_Interface is interface and Windows.IInspectable_Interface;
   
   function NavigateCore
   (
      This       : access IAutomationPeerOverrides3_Interface
      ; direction : Windows.UI.Xaml.Automation.Peers.AutomationNavigationDirection
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function GetElementFromPointCore
   (
      This       : access IAutomationPeerOverrides3_Interface
      ; pointInWindowCoordinates : Windows.Foundation.Point
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function GetFocusedElementCore
   (
      This       : access IAutomationPeerOverrides3_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function GetAnnotationsCore
   (
      This       : access IAutomationPeerOverrides3_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IVector_IAutomationPeerAnnotation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetPositionInSetCore
   (
      This       : access IAutomationPeerOverrides3_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function GetSizeOfSetCore
   (
      This       : access IAutomationPeerOverrides3_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function GetLevelCore
   (
      This       : access IAutomationPeerOverrides3_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPeerStatics3 : aliased constant Windows.IID := (1462523668, 32647, 17009, (129, 159, 108, 244, 196, 208, 34, 208 ));
   
   type IAutomationPeerStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function GenerateRawElementProviderRuntimeId
   (
      This       : access IAutomationPeerStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.RawElementProviderRuntimeId
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPeer4 : aliased constant Windows.IID := (1981605714, 29633, 20292, (190, 117, 67, 196, 158, 192, 212, 213 ));
   
   type IAutomationPeer4_Interface is interface and Windows.IInspectable_Interface;
   
   function GetLandmarkType
   (
      This       : access IAutomationPeer4_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.AutomationLandmarkType
   )
   return Windows.HRESULT is abstract;
   
   function GetLocalizedLandmarkType
   (
      This       : access IAutomationPeer4_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPeerOverrides4 : aliased constant Windows.IID := (2978401698, 23878, 19405, (168, 17, 38, 154, 209, 91, 58, 238 ));
   
   type IAutomationPeerOverrides4_Interface is interface and Windows.IInspectable_Interface;
   
   function GetLandmarkTypeCore
   (
      This       : access IAutomationPeerOverrides4_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.AutomationLandmarkType
   )
   return Windows.HRESULT is abstract;
   
   function GetLocalizedLandmarkTypeCore
   (
      This       : access IAutomationPeerOverrides4_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPeer5 : aliased constant Windows.IID := (4130529734, 2623, 17780, (159, 239, 205, 193, 81, 118, 86, 116 ));
   
   type IAutomationPeer5_Interface is interface and Windows.IInspectable_Interface;
   
   function IsPeripheral
   (
      This       : access IAutomationPeer5_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsDataValidForForm
   (
      This       : access IAutomationPeer5_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetFullDescription
   (
      This       : access IAutomationPeer5_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPeerOverrides5 : aliased constant Windows.IID := (746880133, 30750, 18935, (159, 239, 185, 225, 77, 1, 71, 7 ));
   
   type IAutomationPeerOverrides5_Interface is interface and Windows.IInspectable_Interface;
   
   function IsPeripheralCore
   (
      This       : access IAutomationPeerOverrides5_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsDataValidForFormCore
   (
      This       : access IAutomationPeerOverrides5_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetFullDescriptionCore
   (
      This       : access IAutomationPeerOverrides5_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDescribedByCore
   (
      This       : access IAutomationPeerOverrides5_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IIterable_IAutomationPeer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFlowsToCore
   (
      This       : access IAutomationPeerOverrides5_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IIterable_IAutomationPeer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFlowsFromCore
   (
      This       : access IAutomationPeerOverrides5_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IIterable_IAutomationPeer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPeer6 : aliased constant Windows.IID := (3405275279, 5119, 17147, (134, 109, 34, 32, 100, 52, 204, 107 ));
   
   type IAutomationPeer6_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCulture
   (
      This       : access IAutomationPeer6_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPeerOverrides6 : aliased constant Windows.IID := (3918244839, 63231, 17484, (156, 13, 39, 126, 175, 10, 217, 192 ));
   
   type IAutomationPeerOverrides6_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCultureCore
   (
      This       : access IAutomationPeerOverrides6_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPeer7 : aliased constant Windows.IID := (2037068423, 58946, 18603, (178, 35, 82, 8, 180, 29, 169, 214 ));
   
   type IAutomationPeer7_Interface is interface and Windows.IInspectable_Interface;
   
   function RaiseNotificationEvent
   (
      This       : access IAutomationPeer7_Interface
      ; notificationKind : Windows.UI.Xaml.Automation.Peers.AutomationNotificationKind
      ; notificationProcessing : Windows.UI.Xaml.Automation.Peers.AutomationNotificationProcessing
      ; displayString : Windows.String
      ; activityId : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPeerAnnotation : aliased constant Windows.IID := (205873249, 21199, 17402, (130, 248, 7, 241, 55, 53, 30, 90 ));
   
   type IAutomationPeerAnnotation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Type
   (
      This       : access IAutomationPeerAnnotation_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.AnnotationType
   )
   return Windows.HRESULT is abstract;
   
   function put_Type
   (
      This       : access IAutomationPeerAnnotation_Interface
      ; value : Windows.UI.Xaml.Automation.AnnotationType
   )
   return Windows.HRESULT is abstract;
   
   function get_Peer
   (
      This       : access IAutomationPeerAnnotation_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   function put_Peer
   (
      This       : access IAutomationPeerAnnotation_Interface
      ; value : Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPeerAnnotationStatics : aliased constant Windows.IID := (2282334333, 2482, 19781, (183, 139, 29, 59, 59, 9, 246, 97 ));
   
   type IAutomationPeerAnnotationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TypeProperty
   (
      This       : access IAutomationPeerAnnotationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_PeerProperty
   (
      This       : access IAutomationPeerAnnotationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPeerAnnotationFactory : aliased constant Windows.IID := (4120658846, 50779, 17357, (144, 9, 3, 252, 2, 51, 99, 167 ));
   
   type IAutomationPeerAnnotationFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IAutomationPeerAnnotationFactory_Interface
      ; type_x : Windows.UI.Xaml.Automation.AnnotationType
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeerAnnotation
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithPeerParameter
   (
      This       : access IAutomationPeerAnnotationFactory_Interface
      ; type_x : Windows.UI.Xaml.Automation.AnnotationType
      ; peer : Windows.UI.Xaml.Automation.Peers.IAutomationPeer
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeerAnnotation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameworkElementAutomationPeer : aliased constant Windows.IID := (3104495489, 49131, 17489, (189, 71, 159, 58, 99, 235, 210, 74 ));
   
   type IFrameworkElementAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Owner
   (
      This       : access IFrameworkElementAutomationPeer_Interface
      ; RetVal : access Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameworkElementAutomationPeerStatics : aliased constant Windows.IID := (3116415383, 10272, 17569, (165, 168, 155, 128, 30, 220, 38, 158 ));
   
   type IFrameworkElementAutomationPeerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromElement
   (
      This       : access IFrameworkElementAutomationPeerStatics_Interface
      ; element : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   function CreatePeerForElement
   (
      This       : access IFrameworkElementAutomationPeerStatics_Interface
      ; element : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameworkElementAutomationPeerFactory : aliased constant Windows.IID := (230275260, 47122, 18659, (175, 31, 219, 197, 118, 0, 195, 37 ));
   
   type IFrameworkElementAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IFrameworkElementAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.IFrameworkElement
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IFrameworkElementAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInkToolbarAutomationPeer : aliased constant Windows.IID := (305900196, 62184, 19403, (147, 130, 93, 253, 209, 31, 228, 95 ));
   
   type IInkToolbarAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IMapControlAutomationPeer : aliased constant Windows.IID := (1113321188, 62184, 19403, (147, 130, 93, 253, 209, 31, 228, 95 ));
   
   type IMapControlAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ILoopingSelectorItemDataAutomationPeer : aliased constant Windows.IID := (4015423026, 31954, 19762, (149, 144, 31, 88, 141, 94, 243, 141 ));
   
   type ILoopingSelectorItemDataAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IDatePickerFlyoutPresenterAutomationPeer : aliased constant Windows.IID := (1965747512, 49855, 18560, (130, 178, 166, 192, 94, 144, 193, 53 ));
   
   type IDatePickerFlyoutPresenterAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IListPickerFlyoutPresenterAutomationPeer : aliased constant Windows.IID := (1457511512, 9109, 16480, (128, 71, 142, 164, 99, 105, 138, 36 ));
   
   type IListPickerFlyoutPresenterAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ILoopingSelectorAutomationPeer : aliased constant Windows.IID := (1353975498, 47849, 18454, (138, 58, 12, 180, 249, 100, 120, 162 ));
   
   type ILoopingSelectorAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ILoopingSelectorItemAutomationPeer : aliased constant Windows.IID := (3556403391, 1231, 20300, (141, 62, 71, 128, 161, 157, 71, 136 ));
   
   type ILoopingSelectorItemAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IPickerFlyoutPresenterAutomationPeer : aliased constant Windows.IID := (675367927, 33666, 20142, (147, 193, 214, 240, 53, 170, 129, 85 ));
   
   type IPickerFlyoutPresenterAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IPivotItemAutomationPeer : aliased constant Windows.IID := (440549805, 23893, 19751, (180, 15, 45, 55, 80, 111, 190, 120 ));
   
   type IPivotItemAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IPivotItemAutomationPeerFactory : aliased constant Windows.IID := (4068541553, 6207, 16747, (180, 26, 30, 90, 149, 138, 145, 244 ));
   
   type IPivotItemAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IPivotItemAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IPivotItem
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IPivotItemAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPivotItemDataAutomationPeer : aliased constant Windows.IID := (2728638344, 59933, 18615, (136, 238, 240, 139, 106, 160, 127, 238 ));
   
   type IPivotItemDataAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IPivotItemDataAutomationPeerFactory : aliased constant Windows.IID := (1366959232, 54198, 16686, (130, 182, 148, 160, 168, 76, 19, 176 ));
   
   type IPivotItemDataAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithParentAndItem
   (
      This       : access IPivotItemDataAutomationPeerFactory_Interface
      ; item : Windows.Object
      ; parent : Windows.UI.Xaml.Automation.Peers.IPivotAutomationPeer
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IPivotItemDataAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITimePickerFlyoutPresenterAutomationPeer : aliased constant Windows.IID := (3667127847, 33521, 18177, (135, 6, 190, 41, 123, 240, 96, 67 ));
   
   type ITimePickerFlyoutPresenterAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IPivotAutomationPeer : aliased constant Windows.IID := (3876956408, 15261, 16428, (129, 226, 110, 145, 46, 245, 137, 129 ));
   
   type IPivotAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IPivotAutomationPeerFactory : aliased constant Windows.IID := (1056837524, 3217, 17217, (185, 172, 27, 86, 180, 230, 184, 79 ));
   
   type IPivotAutomationPeerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithOwner
   (
      This       : access IPivotAutomationPeerFactory_Interface
      ; owner : Windows.UI.Xaml.Controls.IPivot
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IPivotAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IInvokeProvider_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function Invoke
   (
      This       : access IInvokeProvider_Imported_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IItemContainerProvider_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function FindItemByProperty
   (
      This       : access IItemContainerProvider_Imported_Interface
      ; startAfter : Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
      ; automationProperty : Windows.UI.Xaml.Automation.IAutomationProperty
      ; value : Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IRangeValueProvider_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsReadOnly
   (
      This       : access IRangeValueProvider_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_LargeChange
   (
      This       : access IRangeValueProvider_Imported_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Maximum
   (
      This       : access IRangeValueProvider_Imported_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Minimum
   (
      This       : access IRangeValueProvider_Imported_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_SmallChange
   (
      This       : access IRangeValueProvider_Imported_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IRangeValueProvider_Imported_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function SetValue
   (
      This       : access IRangeValueProvider_Imported_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IScrollItemProvider_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function ScrollIntoView
   (
      This       : access IScrollItemProvider_Imported_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IScrollProvider_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HorizontallyScrollable
   (
      This       : access IScrollProvider_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HorizontalScrollPercent
   (
      This       : access IScrollProvider_Imported_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_HorizontalViewSize
   (
      This       : access IScrollProvider_Imported_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_VerticallyScrollable
   (
      This       : access IScrollProvider_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_VerticalScrollPercent
   (
      This       : access IScrollProvider_Imported_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_VerticalViewSize
   (
      This       : access IScrollProvider_Imported_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function Scroll
   (
      This       : access IScrollProvider_Imported_Interface
      ; horizontalAmount : Windows.UI.Xaml.Automation.ScrollAmount
      ; verticalAmount : Windows.UI.Xaml.Automation.ScrollAmount
   )
   return Windows.HRESULT is abstract;
   
   function SetScrollPercent
   (
      This       : access IScrollProvider_Imported_Interface
      ; horizontalPercent : Windows.Double
      ; verticalPercent : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type ISelectionProvider_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanSelectMultiple
   (
      This       : access ISelectionProvider_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSelectionRequired
   (
      This       : access ISelectionProvider_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetSelection
   (
      This       : access ISelectionProvider_Imported_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IDropTargetProvider_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DropEffect
   (
      This       : access IDropTargetProvider_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DropEffects
   (
      This       : access IDropTargetProvider_Imported_Interface
      ; RetVal : access String_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IToggleProvider_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ToggleState
   (
      This       : access IToggleProvider_Imported_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.ToggleState
   )
   return Windows.HRESULT is abstract;
   
   function Toggle
   (
      This       : access IToggleProvider_Imported_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type ISelectionItemProvider_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsSelected
   (
      This       : access ISelectionItemProvider_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectionContainer
   (
      This       : access ISelectionItemProvider_Imported_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
   )
   return Windows.HRESULT is abstract;
   
   function AddToSelection
   (
      This       : access ISelectionItemProvider_Imported_Interface
   )
   return Windows.HRESULT is abstract;
   
   function RemoveFromSelection
   (
      This       : access ISelectionItemProvider_Imported_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Select_x
   (
      This       : access ISelectionItemProvider_Imported_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IVirtualizedItemProvider_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function Realize
   (
      This       : access IVirtualizedItemProvider_Imported_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IExpandCollapseProvider_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExpandCollapseState
   (
      This       : access IExpandCollapseProvider_Imported_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.ExpandCollapseState
   )
   return Windows.HRESULT is abstract;
   
   function Collapse
   (
      This       : access IExpandCollapseProvider_Imported_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Expand
   (
      This       : access IExpandCollapseProvider_Imported_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IValueProvider_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsReadOnly
   (
      This       : access IValueProvider_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IValueProvider_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetValue
   (
      This       : access IValueProvider_Imported_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IWindowProvider_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsModal
   (
      This       : access IWindowProvider_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsTopmost
   (
      This       : access IWindowProvider_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Maximizable
   (
      This       : access IWindowProvider_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Minimizable
   (
      This       : access IWindowProvider_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_InteractionState
   (
      This       : access IWindowProvider_Imported_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.WindowInteractionState
   )
   return Windows.HRESULT is abstract;
   
   function get_VisualState
   (
      This       : access IWindowProvider_Imported_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.WindowVisualState
   )
   return Windows.HRESULT is abstract;
   
   function Close
   (
      This       : access IWindowProvider_Imported_Interface
   )
   return Windows.HRESULT is abstract;
   
   function SetVisualState
   (
      This       : access IWindowProvider_Imported_Interface
      ; state : Windows.UI.Xaml.Automation.WindowVisualState
   )
   return Windows.HRESULT is abstract;
   
   function WaitForInputIdle
   (
      This       : access IWindowProvider_Imported_Interface
      ; milliseconds : Windows.Int32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type ITransformProvider2_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanZoom
   (
      This       : access ITransformProvider2_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ZoomLevel
   (
      This       : access ITransformProvider2_Imported_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxZoom
   (
      This       : access ITransformProvider2_Imported_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_MinZoom
   (
      This       : access ITransformProvider2_Imported_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function Zoom
   (
      This       : access ITransformProvider2_Imported_Interface
      ; zoom : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function ZoomByUnit
   (
      This       : access ITransformProvider2_Imported_Interface
      ; zoomUnit : Windows.UI.Xaml.Automation.ZoomUnit
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type ITransformProvider_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanMove
   (
      This       : access ITransformProvider_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanResize
   (
      This       : access ITransformProvider_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanRotate
   (
      This       : access ITransformProvider_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Move
   (
      This       : access ITransformProvider_Imported_Interface
      ; x : Windows.Double
      ; y : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function Resize
   (
      This       : access ITransformProvider_Imported_Interface
      ; width : Windows.Double
      ; height : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function Rotate
   (
      This       : access ITransformProvider_Imported_Interface
      ; degrees : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IAutomationPeer : aliased constant Windows.IID := (529780090, 32885, 23465, (188, 62, 176, 74, 148, 225, 75, 192 ));
   
   type IIterator_IAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IAutomationPeer_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IAutomationPeer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IAutomationPeer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IAutomationPeer_Interface
      ; items : Windows.UI.Xaml.Automation.Peers.IAutomationPeer_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IAutomationPeer : aliased constant Windows.IID := (2137498850, 38624, 21035, (135, 16, 20, 196, 45, 131, 79, 30 ));
   
   type IIterable_IAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IAutomationPeer_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IIterator_IAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IAutomationPeer : aliased constant Windows.IID := (3043647606, 6626, 20673, (147, 15, 130, 91, 252, 57, 99, 92 ));
   
   type IVectorView_IAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IAutomationPeer_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IAutomationPeer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IAutomationPeer_Interface
      ; value : Windows.UI.Xaml.Automation.Peers.IAutomationPeer
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IAutomationPeer_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Automation.Peers.IAutomationPeer_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IAutomationPeer : aliased constant Windows.IID := (2832770057, 37168, 24084, (132, 38, 7, 130, 170, 240, 22, 8 ));
   
   type IVector_IAutomationPeer_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IAutomationPeer_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IAutomationPeer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IAutomationPeer_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IVectorView_IAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IAutomationPeer_Interface
      ; value : Windows.UI.Xaml.Automation.Peers.IAutomationPeer
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IAutomationPeer_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IAutomationPeer_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IAutomationPeer_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IAutomationPeer_Interface
      ; value : Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IAutomationPeer_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IAutomationPeer_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IAutomationPeer_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Automation.Peers.IAutomationPeer_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IAutomationPeer_Interface
      ; items : Windows.UI.Xaml.Automation.Peers.IAutomationPeer_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IAutomationPeerAnnotation : aliased constant Windows.IID := (994137907, 18674, 22704, (152, 132, 111, 13, 14, 53, 220, 26 ));
   
   type IIterator_IAutomationPeerAnnotation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IAutomationPeerAnnotation_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeerAnnotation
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IAutomationPeerAnnotation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IAutomationPeerAnnotation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IAutomationPeerAnnotation_Interface
      ; items : Windows.UI.Xaml.Automation.Peers.IAutomationPeerAnnotation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IAutomationPeerAnnotation : aliased constant Windows.IID := (3710451604, 53534, 23271, (184, 25, 97, 119, 193, 89, 147, 19 ));
   
   type IIterable_IAutomationPeerAnnotation_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IAutomationPeerAnnotation_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IIterator_IAutomationPeerAnnotation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IAutomationPeerAnnotation : aliased constant Windows.IID := (7822457, 22683, 23606, (174, 114, 46, 122, 171, 2, 112, 198 ));
   
   type IVectorView_IAutomationPeerAnnotation_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IAutomationPeerAnnotation_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeerAnnotation
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IAutomationPeerAnnotation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IAutomationPeerAnnotation_Interface
      ; value : Windows.UI.Xaml.Automation.Peers.IAutomationPeerAnnotation
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IAutomationPeerAnnotation_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Automation.Peers.IAutomationPeerAnnotation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IAutomationPeerAnnotation : aliased constant Windows.IID := (3545495685, 19440, 24002, (135, 142, 236, 122, 57, 78, 232, 128 ));
   
   type IVector_IAutomationPeerAnnotation_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IAutomationPeerAnnotation_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeerAnnotation
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IAutomationPeerAnnotation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IAutomationPeerAnnotation_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IVectorView_IAutomationPeerAnnotation
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IAutomationPeerAnnotation_Interface
      ; value : Windows.UI.Xaml.Automation.Peers.IAutomationPeerAnnotation
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IAutomationPeerAnnotation_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Automation.Peers.IAutomationPeerAnnotation
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IAutomationPeerAnnotation_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Automation.Peers.IAutomationPeerAnnotation
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IAutomationPeerAnnotation_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IAutomationPeerAnnotation_Interface
      ; value : Windows.UI.Xaml.Automation.Peers.IAutomationPeerAnnotation
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IAutomationPeerAnnotation_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IAutomationPeerAnnotation_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IAutomationPeerAnnotation_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Automation.Peers.IAutomationPeerAnnotation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IAutomationPeerAnnotation_Interface
      ; items : Windows.UI.Xaml.Automation.Peers.IAutomationPeerAnnotation_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype AutomationPeer is Windows.UI.Xaml.Automation.Peers.IAutomationPeer;
   
   type IAutomationPeerOverrides_Interface_Impl is new IAutomationPeerOverrides_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IAutomationPeerOverrides := null;
      m_IAutomationPeer : IAutomationPeer := null;
   end record;
   type IAutomationPeerOverrides_Impl is access all IAutomationPeerOverrides_Interface_Impl'Class;
   type IAutomationPeerOverrides_Impl_Ptr is access all IAutomationPeerOverrides_Impl;
   
   function QueryInterface
   (
      This       : access IAutomationPeerOverrides_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IAutomationPeerOverrides_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IAutomationPeerOverrides_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IAutomationPeerOverrides_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function GetPatternCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; patternInterface : Windows.UI.Xaml.Automation.Peers.PatternInterface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT;
   
   function GetAcceleratorKeyCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetAccessKeyCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetAutomationControlTypeCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.AutomationControlType
   )
   return Windows.HRESULT;
   
   function GetAutomationIdCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetBoundingRectangleCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT;
   
   function GetChildrenCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IVector_IAutomationPeer -- Generic Parameter Type
   )
   return Windows.HRESULT;
   
   function GetClassNameCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetClickablePointCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT;
   
   function GetHelpTextCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetItemStatusCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetItemTypeCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetLabeledByCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT;
   
   function GetLocalizedControlTypeCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetNameCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetOrientationCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.AutomationOrientation
   )
   return Windows.HRESULT;
   
   function HasKeyboardFocusCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function IsContentElementCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function IsControlElementCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function IsEnabledCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function IsKeyboardFocusableCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function IsOffscreenCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function IsPasswordCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function IsRequiredForFormCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function SetFocusCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
   )
   return Windows.HRESULT;
   
   function GetPeerFromPointCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; point : Windows.Foundation.Point
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT;
   
   function GetLiveSettingCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.AutomationLiveSetting
   )
   return Windows.HRESULT;
   
   
   type IAutomationPeerOverrides2_Interface_Impl is new IAutomationPeerOverrides2_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IAutomationPeerOverrides2 := null;
      m_IAutomationPeer : IAutomationPeer := null;
   end record;
   type IAutomationPeerOverrides2_Impl is access all IAutomationPeerOverrides2_Interface_Impl'Class;
   type IAutomationPeerOverrides2_Impl_Ptr is access all IAutomationPeerOverrides2_Impl;
   
   function QueryInterface
   (
      This       : access IAutomationPeerOverrides2_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IAutomationPeerOverrides2_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IAutomationPeerOverrides2_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IAutomationPeerOverrides2_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IAutomationPeerOverrides2_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IAutomationPeerOverrides2_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function ShowContextMenuCore
   (
      This       : access IAutomationPeerOverrides2_Interface_Impl
   )
   return Windows.HRESULT;
   
   function GetControlledPeersCore
   (
      This       : access IAutomationPeerOverrides2_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IVectorView_IAutomationPeer -- Generic Parameter Type
   )
   return Windows.HRESULT;
   
   
   type IAutomationPeerOverrides3_Interface_Impl is new IAutomationPeerOverrides3_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IAutomationPeerOverrides3 := null;
      m_IAutomationPeer : IAutomationPeer := null;
   end record;
   type IAutomationPeerOverrides3_Impl is access all IAutomationPeerOverrides3_Interface_Impl'Class;
   type IAutomationPeerOverrides3_Impl_Ptr is access all IAutomationPeerOverrides3_Impl;
   
   function QueryInterface
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function NavigateCore
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl
      ; direction : Windows.UI.Xaml.Automation.Peers.AutomationNavigationDirection
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT;
   
   function GetElementFromPointCore
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl
      ; pointInWindowCoordinates : Windows.Foundation.Point
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT;
   
   function GetFocusedElementCore
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT;
   
   function GetAnnotationsCore
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IVector_IAutomationPeerAnnotation -- Generic Parameter Type
   )
   return Windows.HRESULT;
   
   function GetPositionInSetCore
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT;
   
   function GetSizeOfSetCore
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT;
   
   function GetLevelCore
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT;
   
   
   type IAutomationPeer_Interface_Impl is new IAutomationPeer_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IAutomationPeer := null;
      m_IAutomationPeer : IAutomationPeer := null;
   end record;
   type IAutomationPeer_Impl is access all IAutomationPeer_Interface_Impl'Class;
   type IAutomationPeer_Impl_Ptr is access all IAutomationPeer_Impl;
   
   function QueryInterface
   (
      This       : access IAutomationPeer_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IAutomationPeer_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IAutomationPeer_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IAutomationPeer_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IAutomationPeer_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IAutomationPeer_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function get_EventsSource
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT;
   
   function put_EventsSource
   (
      This       : access IAutomationPeer_Interface_Impl
      ; value : Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT;
   
   function GetPattern
   (
      This       : access IAutomationPeer_Interface_Impl
      ; patternInterface : Windows.UI.Xaml.Automation.Peers.PatternInterface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT;
   
   function RaiseAutomationEvent
   (
      This       : access IAutomationPeer_Interface_Impl
      ; eventId : Windows.UI.Xaml.Automation.Peers.AutomationEvents
   )
   return Windows.HRESULT;
   
   function RaisePropertyChangedEvent
   (
      This       : access IAutomationPeer_Interface_Impl
      ; automationProperty : Windows.UI.Xaml.Automation.IAutomationProperty
      ; oldValue : Windows.Object
      ; newValue : Windows.Object
   )
   return Windows.HRESULT;
   
   function GetAcceleratorKey
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetAccessKey
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetAutomationControlType
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.AutomationControlType
   )
   return Windows.HRESULT;
   
   function GetAutomationId
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetBoundingRectangle
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT;
   
   function GetChildren
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IVector_IAutomationPeer -- Generic Parameter Type
   )
   return Windows.HRESULT;
   
   function GetClassName
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetClickablePoint
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT;
   
   function GetHelpText
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetItemStatus
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetItemType
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetLabeledBy
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT;
   
   function GetLocalizedControlType
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetName
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetOrientation
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.AutomationOrientation
   )
   return Windows.HRESULT;
   
   function HasKeyboardFocus
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function IsContentElement
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function IsControlElement
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function IsEnabled
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function IsKeyboardFocusable
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function IsOffscreen
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function IsPassword
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function IsRequiredForForm
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function SetFocus
   (
      This       : access IAutomationPeer_Interface_Impl
   )
   return Windows.HRESULT;
   
   function GetParent
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT;
   
   function InvalidatePeer
   (
      This       : access IAutomationPeer_Interface_Impl
   )
   return Windows.HRESULT;
   
   function GetPeerFromPoint
   (
      This       : access IAutomationPeer_Interface_Impl
      ; point : Windows.Foundation.Point
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT;
   
   function GetLiveSetting
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.AutomationLiveSetting
   )
   return Windows.HRESULT;
   
   subtype AutomationPeerAnnotation is Windows.UI.Xaml.Automation.Peers.IAutomationPeerAnnotation;
   function CreateInstance
   (
      type_x : Windows.UI.Xaml.Automation.AnnotationType
   )
   return Windows.UI.Xaml.Automation.Peers.IAutomationPeerAnnotation;
   
   function CreateWithPeerParameter
   (
      type_x : Windows.UI.Xaml.Automation.AnnotationType
      ; peer : Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.UI.Xaml.Automation.Peers.IAutomationPeerAnnotation;
   
   subtype FrameworkElementAutomationPeer is Windows.UI.Xaml.Automation.Peers.IFrameworkElementAutomationPeer;
   subtype ColorSpectrumAutomationPeer is Windows.UI.Xaml.Automation.Peers.IColorSpectrumAutomationPeer;
   subtype PersonPictureAutomationPeer is Windows.UI.Xaml.Automation.Peers.IPersonPictureAutomationPeer;
   subtype RatingControlAutomationPeer is Windows.UI.Xaml.Automation.Peers.IRatingControlAutomationPeer;
   subtype ButtonBaseAutomationPeer is Windows.UI.Xaml.Automation.Peers.IButtonBaseAutomationPeer;
   subtype CaptureElementAutomationPeer is Windows.UI.Xaml.Automation.Peers.ICaptureElementAutomationPeer;
   subtype ComboBoxItemAutomationPeer is Windows.UI.Xaml.Automation.Peers.IComboBoxItemAutomationPeer;
   subtype FlipViewItemAutomationPeer is Windows.UI.Xaml.Automation.Peers.IFlipViewItemAutomationPeer;
   subtype GroupItemAutomationPeer is Windows.UI.Xaml.Automation.Peers.IGroupItemAutomationPeer;
   subtype ImageAutomationPeer is Windows.UI.Xaml.Automation.Peers.IImageAutomationPeer;
   subtype ListBoxItemAutomationPeer is Windows.UI.Xaml.Automation.Peers.IListBoxItemAutomationPeer;
   subtype MediaTransportControlsAutomationPeer is Windows.UI.Xaml.Automation.Peers.IMediaTransportControlsAutomationPeer;
   subtype PasswordBoxAutomationPeer is Windows.UI.Xaml.Automation.Peers.IPasswordBoxAutomationPeer;
   subtype ProgressRingAutomationPeer is Windows.UI.Xaml.Automation.Peers.IProgressRingAutomationPeer;
   subtype RichTextBlockAutomationPeer is Windows.UI.Xaml.Automation.Peers.IRichTextBlockAutomationPeer;
   subtype RichTextBlockOverflowAutomationPeer is Windows.UI.Xaml.Automation.Peers.IRichTextBlockOverflowAutomationPeer;
   subtype SettingsFlyoutAutomationPeer is Windows.UI.Xaml.Automation.Peers.ISettingsFlyoutAutomationPeer;
   subtype TextBlockAutomationPeer is Windows.UI.Xaml.Automation.Peers.ITextBlockAutomationPeer;
   subtype TextBoxAutomationPeer is Windows.UI.Xaml.Automation.Peers.ITextBoxAutomationPeer;
   subtype ThumbAutomationPeer is Windows.UI.Xaml.Automation.Peers.IThumbAutomationPeer;
   subtype AutoSuggestBoxAutomationPeer is Windows.UI.Xaml.Automation.Peers.IAutoSuggestBoxAutomationPeer;
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IAutoSuggestBox
   )
   return Windows.UI.Xaml.Automation.Peers.IAutoSuggestBoxAutomationPeer;
   
   subtype DatePickerAutomationPeer is Windows.UI.Xaml.Automation.Peers.IDatePickerAutomationPeer;
   subtype FlyoutPresenterAutomationPeer is Windows.UI.Xaml.Automation.Peers.IFlyoutPresenterAutomationPeer;
   subtype GridViewItemAutomationPeer is Windows.UI.Xaml.Automation.Peers.IGridViewItemAutomationPeer;
   subtype HubAutomationPeer is Windows.UI.Xaml.Automation.Peers.IHubAutomationPeer;
   subtype ListViewBaseHeaderItemAutomationPeer is Windows.UI.Xaml.Automation.Peers.IListViewBaseHeaderItemAutomationPeer;
   subtype ListViewItemAutomationPeer is Windows.UI.Xaml.Automation.Peers.IListViewItemAutomationPeer;
   subtype NavigationViewItemAutomationPeer is Windows.UI.Xaml.Automation.Peers.INavigationViewItemAutomationPeer;
   subtype MediaElementAutomationPeer is Windows.UI.Xaml.Automation.Peers.IMediaElementAutomationPeer;
   subtype MediaPlayerElementAutomationPeer is Windows.UI.Xaml.Automation.Peers.IMediaPlayerElementAutomationPeer;
   subtype RichEditBoxAutomationPeer is Windows.UI.Xaml.Automation.Peers.IRichEditBoxAutomationPeer;
   subtype SearchBoxAutomationPeer is Windows.UI.Xaml.Automation.Peers.ISearchBoxAutomationPeer;
   subtype TimePickerAutomationPeer is Windows.UI.Xaml.Automation.Peers.ITimePickerAutomationPeer;
   subtype GridViewHeaderItemAutomationPeer is Windows.UI.Xaml.Automation.Peers.IGridViewHeaderItemAutomationPeer;
   subtype ListViewHeaderItemAutomationPeer is Windows.UI.Xaml.Automation.Peers.IListViewHeaderItemAutomationPeer;
   subtype ButtonAutomationPeer is Windows.UI.Xaml.Automation.Peers.IButtonAutomationPeer;
   subtype HyperlinkButtonAutomationPeer is Windows.UI.Xaml.Automation.Peers.IHyperlinkButtonAutomationPeer;
   subtype RepeatButtonAutomationPeer is Windows.UI.Xaml.Automation.Peers.IRepeatButtonAutomationPeer;
   subtype MenuFlyoutItemAutomationPeer is Windows.UI.Xaml.Automation.Peers.IMenuFlyoutItemAutomationPeer;
   subtype AppBarButtonAutomationPeer is Windows.UI.Xaml.Automation.Peers.IAppBarButtonAutomationPeer;
   subtype ItemsControlAutomationPeer is Windows.UI.Xaml.Automation.Peers.IItemsControlAutomationPeer;
   subtype MenuFlyoutPresenterAutomationPeer is Windows.UI.Xaml.Automation.Peers.IMenuFlyoutPresenterAutomationPeer;
   subtype RangeBaseAutomationPeer is Windows.UI.Xaml.Automation.Peers.IRangeBaseAutomationPeer;
   subtype ProgressBarAutomationPeer is Windows.UI.Xaml.Automation.Peers.IProgressBarAutomationPeer;
   subtype ScrollBarAutomationPeer is Windows.UI.Xaml.Automation.Peers.IScrollBarAutomationPeer;
   subtype SliderAutomationPeer is Windows.UI.Xaml.Automation.Peers.ISliderAutomationPeer;
   subtype ColorPickerSliderAutomationPeer is Windows.UI.Xaml.Automation.Peers.IColorPickerSliderAutomationPeer;
   subtype HubSectionAutomationPeer is Windows.UI.Xaml.Automation.Peers.IHubSectionAutomationPeer;
   subtype ScrollViewerAutomationPeer is Windows.UI.Xaml.Automation.Peers.IScrollViewerAutomationPeer;
   subtype SelectorAutomationPeer is Windows.UI.Xaml.Automation.Peers.ISelectorAutomationPeer;
   subtype FlipViewAutomationPeer is Windows.UI.Xaml.Automation.Peers.IFlipViewAutomationPeer;
   subtype ListBoxAutomationPeer is Windows.UI.Xaml.Automation.Peers.IListBoxAutomationPeer;
   subtype ListViewBaseAutomationPeer is Windows.UI.Xaml.Automation.Peers.IListViewBaseAutomationPeer;
   subtype GridViewAutomationPeer is Windows.UI.Xaml.Automation.Peers.IGridViewAutomationPeer;
   subtype ListViewAutomationPeer is Windows.UI.Xaml.Automation.Peers.IListViewAutomationPeer;
   subtype SemanticZoomAutomationPeer is Windows.UI.Xaml.Automation.Peers.ISemanticZoomAutomationPeer;
   subtype ToggleSwitchAutomationPeer is Windows.UI.Xaml.Automation.Peers.IToggleSwitchAutomationPeer;
   subtype ToggleButtonAutomationPeer is Windows.UI.Xaml.Automation.Peers.IToggleButtonAutomationPeer;
   subtype CheckBoxAutomationPeer is Windows.UI.Xaml.Automation.Peers.ICheckBoxAutomationPeer;
   subtype RadioButtonAutomationPeer is Windows.UI.Xaml.Automation.Peers.IRadioButtonAutomationPeer;
   subtype ToggleMenuFlyoutItemAutomationPeer is Windows.UI.Xaml.Automation.Peers.IToggleMenuFlyoutItemAutomationPeer;
   subtype AppBarToggleButtonAutomationPeer is Windows.UI.Xaml.Automation.Peers.IAppBarToggleButtonAutomationPeer;
   subtype ItemAutomationPeer is Windows.UI.Xaml.Automation.Peers.IItemAutomationPeer;
   subtype SelectorItemAutomationPeer is Windows.UI.Xaml.Automation.Peers.ISelectorItemAutomationPeer;
   subtype ComboBoxItemDataAutomationPeer is Windows.UI.Xaml.Automation.Peers.IComboBoxItemDataAutomationPeer;
   subtype FlipViewItemDataAutomationPeer is Windows.UI.Xaml.Automation.Peers.IFlipViewItemDataAutomationPeer;
   subtype ListBoxItemDataAutomationPeer is Windows.UI.Xaml.Automation.Peers.IListBoxItemDataAutomationPeer;
   subtype GridViewItemDataAutomationPeer is Windows.UI.Xaml.Automation.Peers.IGridViewItemDataAutomationPeer;
   subtype ListViewItemDataAutomationPeer is Windows.UI.Xaml.Automation.Peers.IListViewItemDataAutomationPeer;
   subtype ComboBoxAutomationPeer is Windows.UI.Xaml.Automation.Peers.IComboBoxAutomationPeer;
   subtype AppBarAutomationPeer is Windows.UI.Xaml.Automation.Peers.IAppBarAutomationPeer;
   subtype InkToolbarAutomationPeer is Windows.UI.Xaml.Automation.Peers.IInkToolbarAutomationPeer;
   subtype MapControlAutomationPeer is Windows.UI.Xaml.Automation.Peers.IMapControlAutomationPeer;
   subtype LoopingSelectorItemDataAutomationPeer is Windows.UI.Xaml.Automation.Peers.ILoopingSelectorItemDataAutomationPeer;
   subtype DatePickerFlyoutPresenterAutomationPeer is Windows.UI.Xaml.Automation.Peers.IDatePickerFlyoutPresenterAutomationPeer;
   subtype ListPickerFlyoutPresenterAutomationPeer is Windows.UI.Xaml.Automation.Peers.IListPickerFlyoutPresenterAutomationPeer;
   subtype LoopingSelectorAutomationPeer is Windows.UI.Xaml.Automation.Peers.ILoopingSelectorAutomationPeer;
   subtype LoopingSelectorItemAutomationPeer is Windows.UI.Xaml.Automation.Peers.ILoopingSelectorItemAutomationPeer;
   subtype PickerFlyoutPresenterAutomationPeer is Windows.UI.Xaml.Automation.Peers.IPickerFlyoutPresenterAutomationPeer;
   subtype PivotItemAutomationPeer is Windows.UI.Xaml.Automation.Peers.IPivotItemAutomationPeer;
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IPivotItem
   )
   return Windows.UI.Xaml.Automation.Peers.IPivotItemAutomationPeer;
   
   subtype PivotItemDataAutomationPeer is Windows.UI.Xaml.Automation.Peers.IPivotItemDataAutomationPeer;
   function CreateInstanceWithParentAndItem
   (
      item : Windows.Object
      ; parent : Windows.UI.Xaml.Automation.Peers.IPivotAutomationPeer
   )
   return Windows.UI.Xaml.Automation.Peers.IPivotItemDataAutomationPeer;
   
   subtype TimePickerFlyoutPresenterAutomationPeer is Windows.UI.Xaml.Automation.Peers.ITimePickerFlyoutPresenterAutomationPeer;
   subtype PivotAutomationPeer is Windows.UI.Xaml.Automation.Peers.IPivotAutomationPeer;
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IPivot
   )
   return Windows.UI.Xaml.Automation.Peers.IPivotAutomationPeer;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function ListenerExists
   (
      eventId : Windows.UI.Xaml.Automation.Peers.AutomationEvents
   )
   return Windows.Boolean;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IAutomationPeer;
   
   function GenerateRawElementProviderRuntimeId
   return Windows.UI.Xaml.Automation.Peers.RawElementProviderRuntimeId;
   
   function get_TypeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PeerProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.IFrameworkElement
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IFrameworkElementAutomationPeer;
   
   function FromElement
   (
      element : Windows.UI.Xaml.IUIElement
   )
   return Windows.UI.Xaml.Automation.Peers.IAutomationPeer;
   
   function CreatePeerForElement
   (
      element : Windows.UI.Xaml.IUIElement
   )
   return Windows.UI.Xaml.Automation.Peers.IAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.Primitives.IColorSpectrum
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IColorSpectrumAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IPersonPicture
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IPersonPictureAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IRatingControl
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IRatingControlAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.Primitives.IButtonBase
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IButtonBaseAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.ICaptureElement
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.ICaptureElementAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IComboBoxItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IComboBoxItemAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IFlipViewItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IFlipViewItemAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IGroupItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IGroupItemAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IImage
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IImageAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IListBoxItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IListBoxItemAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IMediaTransportControls
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IMediaTransportControlsAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IPasswordBox
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IPasswordBoxAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IProgressRing
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IProgressRingAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IRichTextBlock
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IRichTextBlockAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IRichTextBlockOverflow
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IRichTextBlockOverflowAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.ISettingsFlyout
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.ISettingsFlyoutAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.ITextBlock
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.ITextBlockAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.ITextBox
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.ITextBoxAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.Primitives.IThumb
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IThumbAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IDatePicker
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IDatePickerAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IFlyoutPresenter
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IFlyoutPresenterAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IGridViewItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IGridViewItemAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IHub
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IHubAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IListViewBaseHeaderItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IListViewBaseHeaderItemAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IListViewItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IListViewItemAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.INavigationViewItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.INavigationViewItemAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IMediaElement
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IMediaElementAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IMediaPlayerElement
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IMediaPlayerElementAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IRichEditBox
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IRichEditBoxAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.ISearchBox
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.ISearchBoxAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.ITimePicker
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.ITimePickerAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IGridViewHeaderItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IGridViewHeaderItemAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IListViewHeaderItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IListViewHeaderItemAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IButton
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IButtonAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IHyperlinkButton
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IHyperlinkButtonAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.Primitives.IRepeatButton
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IRepeatButtonAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IMenuFlyoutItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IMenuFlyoutItemAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IAppBarButton
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IAppBarButtonAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IItemsControl
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IItemsControlAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IMenuFlyoutPresenter
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IMenuFlyoutPresenterAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.Primitives.IRangeBase
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IRangeBaseAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IProgressBar
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IProgressBarAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.Primitives.IScrollBar
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IScrollBarAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.ISlider
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.ISliderAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.Primitives.IColorPickerSlider
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IColorPickerSliderAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IHubSection
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IHubSectionAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IScrollViewer
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IScrollViewerAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.Primitives.ISelector
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.ISelectorAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IFlipView
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IFlipViewAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IListBox
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IListBoxAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IListViewBase
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IListViewBaseAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IGridView
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IGridViewAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IListView
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IListViewAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.ISemanticZoom
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.ISemanticZoomAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IToggleSwitch
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IToggleSwitchAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.Primitives.IToggleButton
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IToggleButtonAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.ICheckBox
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.ICheckBoxAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IRadioButton
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IRadioButtonAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IToggleMenuFlyoutItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IToggleMenuFlyoutItemAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IAppBarToggleButton
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IAppBarToggleButtonAutomationPeer;
   
   function CreateInstanceWithParentAndItem
   (
      item : Windows.Object
      ; parent : Windows.UI.Xaml.Automation.Peers.IItemsControlAutomationPeer
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IItemAutomationPeer;
   
   function CreateInstanceWithParentAndItem
   (
      item : Windows.Object
      ; parent : Windows.UI.Xaml.Automation.Peers.ISelectorAutomationPeer
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.ISelectorItemAutomationPeer;
   
   function CreateInstanceWithParentAndItem
   (
      item : Windows.Object
      ; parent : Windows.UI.Xaml.Automation.Peers.IComboBoxAutomationPeer
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IComboBoxItemDataAutomationPeer;
   
   function CreateInstanceWithParentAndItem
   (
      item : Windows.Object
      ; parent : Windows.UI.Xaml.Automation.Peers.IFlipViewAutomationPeer
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IFlipViewItemDataAutomationPeer;
   
   function CreateInstanceWithParentAndItem
   (
      item : Windows.Object
      ; parent : Windows.UI.Xaml.Automation.Peers.IListBoxAutomationPeer
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IListBoxItemDataAutomationPeer;
   
   function CreateInstanceWithParentAndItem
   (
      item : Windows.Object
      ; parent : Windows.UI.Xaml.Automation.Peers.IGridViewAutomationPeer
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IGridViewItemDataAutomationPeer;
   
   function CreateInstanceWithParentAndItem
   (
      item : Windows.Object
      ; parent : Windows.UI.Xaml.Automation.Peers.IListViewBaseAutomationPeer
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IListViewItemDataAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IComboBox
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IComboBoxAutomationPeer;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IAppBar
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IAppBarAutomationPeer;
   
end;
