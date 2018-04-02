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
with Windows.Foundation.Numerics;
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.UI.Xaml.Media;
limited with Windows.UI.Xaml.Media.Animation;
limited with Windows.UI.Xaml.Input;
limited with Windows.UI.Xaml.Interop;
limited with Windows.UI.Xaml.Data;
--------------------------------------------------------------------------------
package Windows.UI.Xaml.Controls.Primitives is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type GeneratorDirection is (
      Forward,
      Backward
   );
   for GeneratorDirection use (
      Forward => 0,
      Backward => 1
   );
   for GeneratorDirection'Size use 32;
   
   type GeneratorDirection_Ptr is access GeneratorDirection;
   
   type GroupHeaderPlacement is (
      Top,
      Left
   );
   for GroupHeaderPlacement use (
      Top => 0,
      Left => 1
   );
   for GroupHeaderPlacement'Size use 32;
   
   type GroupHeaderPlacement_Ptr is access GroupHeaderPlacement;
   
   type PlacementMode is (
      Bottom,
      Right,
      Mouse,
      Left,
      Top
   );
   for PlacementMode use (
      Bottom => 2,
      Right => 4,
      Mouse => 7,
      Left => 9,
      Top => 10
   );
   for PlacementMode'Size use 32;
   
   type PlacementMode_Ptr is access PlacementMode;
   
   type ScrollEventType is (
      SmallDecrement,
      SmallIncrement,
      LargeDecrement,
      LargeIncrement,
      ThumbPosition,
      ThumbTrack,
      First,
      Last,
      EndScroll
   );
   for ScrollEventType use (
      SmallDecrement => 0,
      SmallIncrement => 1,
      LargeDecrement => 2,
      LargeIncrement => 3,
      ThumbPosition => 4,
      ThumbTrack => 5,
      First => 6,
      Last => 7,
      EndScroll => 8
   );
   for ScrollEventType'Size use 32;
   
   type ScrollEventType_Ptr is access ScrollEventType;
   
   type ScrollingIndicatorMode is (
      None,
      TouchIndicator,
      MouseIndicator
   );
   for ScrollingIndicatorMode use (
      None => 0,
      TouchIndicator => 1,
      MouseIndicator => 2
   );
   for ScrollingIndicatorMode'Size use 32;
   
   type ScrollingIndicatorMode_Ptr is access ScrollingIndicatorMode;
   
   type SliderSnapsTo is (
      StepValues,
      Ticks
   );
   for SliderSnapsTo use (
      StepValues => 0,
      Ticks => 1
   );
   for SliderSnapsTo'Size use 32;
   
   type SliderSnapsTo_Ptr is access SliderSnapsTo;
   
   type SnapPointsAlignment is (
      Near,
      Center,
      Far
   );
   for SnapPointsAlignment use (
      Near => 0,
      Center => 1,
      Far => 2
   );
   for SnapPointsAlignment'Size use 32;
   
   type SnapPointsAlignment_Ptr is access SnapPointsAlignment;
   
   type TickPlacement is (
      None,
      TopLeft,
      BottomRight,
      Outside,
      Inline
   );
   for TickPlacement use (
      None => 0,
      TopLeft => 1,
      BottomRight => 2,
      Outside => 3,
      Inline => 4
   );
   for TickPlacement'Size use 32;
   
   type TickPlacement_Ptr is access TickPlacement;
   
   type ListViewItemPresenterCheckMode is (
      Inline,
      Overlay
   );
   for ListViewItemPresenterCheckMode use (
      Inline => 0,
      Overlay => 1
   );
   for ListViewItemPresenterCheckMode'Size use 32;
   
   type ListViewItemPresenterCheckMode_Ptr is access ListViewItemPresenterCheckMode;
   
   type AnimationDirection is (
      Left,
      Top,
      Right,
      Bottom
   );
   for AnimationDirection use (
      Left => 0,
      Top => 1,
      Right => 2,
      Bottom => 3
   );
   for AnimationDirection'Size use 32;
   
   type AnimationDirection_Ptr is access AnimationDirection;
   
   type ComponentResourceLocation is (
      Application,
      Nested
   );
   for ComponentResourceLocation use (
      Application => 0,
      Nested => 1
   );
   for ComponentResourceLocation'Size use 32;
   
   type ComponentResourceLocation_Ptr is access ComponentResourceLocation;
   
   type EdgeTransitionLocation is (
      Left,
      Top,
      Right,
      Bottom
   );
   for EdgeTransitionLocation use (
      Left => 0,
      Top => 1,
      Right => 2,
      Bottom => 3
   );
   for EdgeTransitionLocation'Size use 32;
   
   type EdgeTransitionLocation_Ptr is access EdgeTransitionLocation;
   
   type FlyoutPlacementMode is (
      Top,
      Bottom,
      Left,
      Right,
      Full
   );
   for FlyoutPlacementMode use (
      Top => 0,
      Bottom => 1,
      Left => 2,
      Right => 3,
      Full => 4
   );
   for FlyoutPlacementMode'Size use 32;
   
   type FlyoutPlacementMode_Ptr is access FlyoutPlacementMode;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type GeneratorPosition is record
      Index : Windows.Int32;
      Offset : Windows.Int32;
   end record;
   pragma Convention (C_Pass_By_Copy , GeneratorPosition);
   
   type GeneratorPosition_Ptr is access GeneratorPosition;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type DragCompletedEventHandler_Interface;
   type DragCompletedEventHandler is access all DragCompletedEventHandler_Interface'Class;
   type DragCompletedEventHandler_Ptr is access all DragCompletedEventHandler;
   type DragDeltaEventHandler_Interface;
   type DragDeltaEventHandler is access all DragDeltaEventHandler_Interface'Class;
   type DragDeltaEventHandler_Ptr is access all DragDeltaEventHandler;
   type DragStartedEventHandler_Interface;
   type DragStartedEventHandler is access all DragStartedEventHandler_Interface'Class;
   type DragStartedEventHandler_Ptr is access all DragStartedEventHandler;
   type ItemsChangedEventHandler_Interface;
   type ItemsChangedEventHandler is access all ItemsChangedEventHandler_Interface'Class;
   type ItemsChangedEventHandler_Ptr is access all ItemsChangedEventHandler;
   type RangeBaseValueChangedEventHandler_Interface;
   type RangeBaseValueChangedEventHandler is access all RangeBaseValueChangedEventHandler_Interface'Class;
   type RangeBaseValueChangedEventHandler_Ptr is access all RangeBaseValueChangedEventHandler;
   type ScrollEventHandler_Interface;
   type ScrollEventHandler is access all ScrollEventHandler_Interface'Class;
   type ScrollEventHandler_Ptr is access all ScrollEventHandler;
   type TypedEventHandler_IColorSpectrum_add_ColorChanged_Interface;
   type TypedEventHandler_IColorSpectrum_add_ColorChanged is access all TypedEventHandler_IColorSpectrum_add_ColorChanged_Interface'Class;
   type TypedEventHandler_IColorSpectrum_add_ColorChanged_Ptr is access all TypedEventHandler_IColorSpectrum_add_ColorChanged;
   type TypedEventHandler_IFlyoutBase2_add_Closing_Interface;
   type TypedEventHandler_IFlyoutBase2_add_Closing is access all TypedEventHandler_IFlyoutBase2_add_Closing_Interface'Class;
   type TypedEventHandler_IFlyoutBase2_add_Closing_Ptr is access all TypedEventHandler_IFlyoutBase2_add_Closing;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IColorSpectrum_Interface;
   type IColorSpectrum is access all IColorSpectrum_Interface'Class;
   type IColorSpectrum_Ptr is access all IColorSpectrum;
   type IColorSpectrumStatics_Interface;
   type IColorSpectrumStatics is access all IColorSpectrumStatics_Interface'Class;
   type IColorSpectrumStatics_Ptr is access all IColorSpectrumStatics;
   type IColorSpectrumFactory_Interface;
   type IColorSpectrumFactory is access all IColorSpectrumFactory_Interface'Class;
   type IColorSpectrumFactory_Ptr is access all IColorSpectrumFactory;
   type IColorPickerSlider_Interface;
   type IColorPickerSlider is access all IColorPickerSlider_Interface'Class;
   type IColorPickerSlider_Ptr is access all IColorPickerSlider;
   type IColorPickerSliderStatics_Interface;
   type IColorPickerSliderStatics is access all IColorPickerSliderStatics_Interface'Class;
   type IColorPickerSliderStatics_Ptr is access all IColorPickerSliderStatics;
   type IColorPickerSliderFactory_Interface;
   type IColorPickerSliderFactory is access all IColorPickerSliderFactory_Interface'Class;
   type IColorPickerSliderFactory_Ptr is access all IColorPickerSliderFactory;
   type IScrollSnapPointsInfo_Interface;
   type IScrollSnapPointsInfo is access all IScrollSnapPointsInfo_Interface'Class;
   type IScrollSnapPointsInfo_Ptr is access all IScrollSnapPointsInfo;
   type IItemsChangedEventArgs_Interface;
   type IItemsChangedEventArgs is access all IItemsChangedEventArgs_Interface'Class;
   type IItemsChangedEventArgs_Ptr is access all IItemsChangedEventArgs;
   type ILayoutInformation_Interface;
   type ILayoutInformation is access all ILayoutInformation_Interface'Class;
   type ILayoutInformation_Ptr is access all ILayoutInformation;
   type ILayoutInformationStatics_Interface;
   type ILayoutInformationStatics is access all ILayoutInformationStatics_Interface'Class;
   type ILayoutInformationStatics_Ptr is access all ILayoutInformationStatics;
   type ILayoutInformationStatics2_Interface;
   type ILayoutInformationStatics2 is access all ILayoutInformationStatics2_Interface'Class;
   type ILayoutInformationStatics2_Ptr is access all ILayoutInformationStatics2;
   type IComboBoxTemplateSettings_Interface;
   type IComboBoxTemplateSettings is access all IComboBoxTemplateSettings_Interface'Class;
   type IComboBoxTemplateSettings_Ptr is access all IComboBoxTemplateSettings;
   type IComboBoxTemplateSettings2_Interface;
   type IComboBoxTemplateSettings2 is access all IComboBoxTemplateSettings2_Interface'Class;
   type IComboBoxTemplateSettings2_Ptr is access all IComboBoxTemplateSettings2;
   type IDragCompletedEventArgs_Interface;
   type IDragCompletedEventArgs is access all IDragCompletedEventArgs_Interface'Class;
   type IDragCompletedEventArgs_Ptr is access all IDragCompletedEventArgs;
   type IDragCompletedEventArgsFactory_Interface;
   type IDragCompletedEventArgsFactory is access all IDragCompletedEventArgsFactory_Interface'Class;
   type IDragCompletedEventArgsFactory_Ptr is access all IDragCompletedEventArgsFactory;
   type IDragDeltaEventArgs_Interface;
   type IDragDeltaEventArgs is access all IDragDeltaEventArgs_Interface'Class;
   type IDragDeltaEventArgs_Ptr is access all IDragDeltaEventArgs;
   type IDragDeltaEventArgsFactory_Interface;
   type IDragDeltaEventArgsFactory is access all IDragDeltaEventArgsFactory_Interface'Class;
   type IDragDeltaEventArgsFactory_Ptr is access all IDragDeltaEventArgsFactory;
   type IDragStartedEventArgs_Interface;
   type IDragStartedEventArgs is access all IDragStartedEventArgs_Interface'Class;
   type IDragStartedEventArgs_Ptr is access all IDragStartedEventArgs;
   type IDragStartedEventArgsFactory_Interface;
   type IDragStartedEventArgsFactory is access all IDragStartedEventArgsFactory_Interface'Class;
   type IDragStartedEventArgsFactory_Ptr is access all IDragStartedEventArgsFactory;
   type IGridViewItemTemplateSettings_Interface;
   type IGridViewItemTemplateSettings is access all IGridViewItemTemplateSettings_Interface'Class;
   type IGridViewItemTemplateSettings_Ptr is access all IGridViewItemTemplateSettings;
   type IListViewItemTemplateSettings_Interface;
   type IListViewItemTemplateSettings is access all IListViewItemTemplateSettings_Interface'Class;
   type IListViewItemTemplateSettings_Ptr is access all IListViewItemTemplateSettings;
   type IMenuFlyoutPresenterTemplateSettings_Interface;
   type IMenuFlyoutPresenterTemplateSettings is access all IMenuFlyoutPresenterTemplateSettings_Interface'Class;
   type IMenuFlyoutPresenterTemplateSettings_Ptr is access all IMenuFlyoutPresenterTemplateSettings;
   type IProgressBarTemplateSettings_Interface;
   type IProgressBarTemplateSettings is access all IProgressBarTemplateSettings_Interface'Class;
   type IProgressBarTemplateSettings_Ptr is access all IProgressBarTemplateSettings;
   type IProgressRingTemplateSettings_Interface;
   type IProgressRingTemplateSettings is access all IProgressRingTemplateSettings_Interface'Class;
   type IProgressRingTemplateSettings_Ptr is access all IProgressRingTemplateSettings;
   type IRangeBaseValueChangedEventArgs_Interface;
   type IRangeBaseValueChangedEventArgs is access all IRangeBaseValueChangedEventArgs_Interface'Class;
   type IRangeBaseValueChangedEventArgs_Ptr is access all IRangeBaseValueChangedEventArgs;
   type IScrollEventArgs_Interface;
   type IScrollEventArgs is access all IScrollEventArgs_Interface'Class;
   type IScrollEventArgs_Ptr is access all IScrollEventArgs;
   type ISettingsFlyoutTemplateSettings_Interface;
   type ISettingsFlyoutTemplateSettings is access all ISettingsFlyoutTemplateSettings_Interface'Class;
   type ISettingsFlyoutTemplateSettings_Ptr is access all ISettingsFlyoutTemplateSettings;
   type IToggleSwitchTemplateSettings_Interface;
   type IToggleSwitchTemplateSettings is access all IToggleSwitchTemplateSettings_Interface'Class;
   type IToggleSwitchTemplateSettings_Ptr is access all IToggleSwitchTemplateSettings;
   type IToolTipTemplateSettings_Interface;
   type IToolTipTemplateSettings is access all IToolTipTemplateSettings_Interface'Class;
   type IToolTipTemplateSettings_Ptr is access all IToolTipTemplateSettings;
   type IPopup_Interface;
   type IPopup is access all IPopup_Interface'Class;
   type IPopup_Ptr is access all IPopup;
   type IPopupStatics_Interface;
   type IPopupStatics is access all IPopupStatics_Interface'Class;
   type IPopupStatics_Ptr is access all IPopupStatics;
   type IPopup2_Interface;
   type IPopup2 is access all IPopup2_Interface'Class;
   type IPopup2_Ptr is access all IPopup2;
   type IPopupStatics2_Interface;
   type IPopupStatics2 is access all IPopupStatics2_Interface'Class;
   type IPopupStatics2_Ptr is access all IPopupStatics2;
   type ITickBar_Interface;
   type ITickBar is access all ITickBar_Interface'Class;
   type ITickBar_Ptr is access all ITickBar;
   type ITickBarStatics_Interface;
   type ITickBarStatics is access all ITickBarStatics_Interface'Class;
   type ITickBarStatics_Ptr is access all ITickBarStatics;
   type IRangeBase_Interface;
   type IRangeBase is access all IRangeBase_Interface'Class;
   type IRangeBase_Ptr is access all IRangeBase;
   type IRangeBaseOverrides_Interface;
   type IRangeBaseOverrides is access all IRangeBaseOverrides_Interface'Class;
   type IRangeBaseOverrides_Ptr is access all IRangeBaseOverrides;
   type IRangeBaseStatics_Interface;
   type IRangeBaseStatics is access all IRangeBaseStatics_Interface'Class;
   type IRangeBaseStatics_Ptr is access all IRangeBaseStatics;
   type IRangeBaseFactory_Interface;
   type IRangeBaseFactory is access all IRangeBaseFactory_Interface'Class;
   type IRangeBaseFactory_Ptr is access all IRangeBaseFactory;
   type IThumb_Interface;
   type IThumb is access all IThumb_Interface'Class;
   type IThumb_Ptr is access all IThumb;
   type IThumbStatics_Interface;
   type IThumbStatics is access all IThumbStatics_Interface'Class;
   type IThumbStatics_Ptr is access all IThumbStatics;
   type IButtonBase_Interface;
   type IButtonBase is access all IButtonBase_Interface'Class;
   type IButtonBase_Ptr is access all IButtonBase;
   type IButtonBaseStatics_Interface;
   type IButtonBaseStatics is access all IButtonBaseStatics_Interface'Class;
   type IButtonBaseStatics_Ptr is access all IButtonBaseStatics;
   type IButtonBaseFactory_Interface;
   type IButtonBaseFactory is access all IButtonBaseFactory_Interface'Class;
   type IButtonBaseFactory_Ptr is access all IButtonBaseFactory;
   type ICarouselPanel_Interface;
   type ICarouselPanel is access all ICarouselPanel_Interface'Class;
   type ICarouselPanel_Ptr is access all ICarouselPanel;
   type ICarouselPanelFactory_Interface;
   type ICarouselPanelFactory is access all ICarouselPanelFactory_Interface'Class;
   type ICarouselPanelFactory_Ptr is access all ICarouselPanelFactory;
   type IOrientedVirtualizingPanel_Interface;
   type IOrientedVirtualizingPanel is access all IOrientedVirtualizingPanel_Interface'Class;
   type IOrientedVirtualizingPanel_Ptr is access all IOrientedVirtualizingPanel;
   type IOrientedVirtualizingPanelFactory_Interface;
   type IOrientedVirtualizingPanelFactory is access all IOrientedVirtualizingPanelFactory_Interface'Class;
   type IOrientedVirtualizingPanelFactory_Ptr is access all IOrientedVirtualizingPanelFactory;
   type IScrollBar_Interface;
   type IScrollBar is access all IScrollBar_Interface'Class;
   type IScrollBar_Ptr is access all IScrollBar;
   type IScrollBarStatics_Interface;
   type IScrollBarStatics is access all IScrollBarStatics_Interface'Class;
   type IScrollBarStatics_Ptr is access all IScrollBarStatics;
   type ISelector_Interface;
   type ISelector is access all ISelector_Interface'Class;
   type ISelector_Ptr is access all ISelector;
   type ISelectorStatics_Interface;
   type ISelectorStatics is access all ISelectorStatics_Interface'Class;
   type ISelectorStatics_Ptr is access all ISelectorStatics;
   type ISelectorFactory_Interface;
   type ISelectorFactory is access all ISelectorFactory_Interface'Class;
   type ISelectorFactory_Ptr is access all ISelectorFactory;
   type ISelectorItem_Interface;
   type ISelectorItem is access all ISelectorItem_Interface'Class;
   type ISelectorItem_Ptr is access all ISelectorItem;
   type ISelectorItemStatics_Interface;
   type ISelectorItemStatics is access all ISelectorItemStatics_Interface'Class;
   type ISelectorItemStatics_Ptr is access all ISelectorItemStatics;
   type ISelectorItemFactory_Interface;
   type ISelectorItemFactory is access all ISelectorItemFactory_Interface'Class;
   type ISelectorItemFactory_Ptr is access all ISelectorItemFactory;
   type IRepeatButton_Interface;
   type IRepeatButton is access all IRepeatButton_Interface'Class;
   type IRepeatButton_Ptr is access all IRepeatButton;
   type IRepeatButtonStatics_Interface;
   type IRepeatButtonStatics is access all IRepeatButtonStatics_Interface'Class;
   type IRepeatButtonStatics_Ptr is access all IRepeatButtonStatics;
   type IToggleButton_Interface;
   type IToggleButton is access all IToggleButton_Interface'Class;
   type IToggleButton_Ptr is access all IToggleButton;
   type IToggleButtonOverrides_Interface;
   type IToggleButtonOverrides is access all IToggleButtonOverrides_Interface'Class;
   type IToggleButtonOverrides_Ptr is access all IToggleButtonOverrides;
   type IToggleButtonStatics_Interface;
   type IToggleButtonStatics is access all IToggleButtonStatics_Interface'Class;
   type IToggleButtonStatics_Ptr is access all IToggleButtonStatics;
   type IToggleButtonFactory_Interface;
   type IToggleButtonFactory is access all IToggleButtonFactory_Interface'Class;
   type IToggleButtonFactory_Ptr is access all IToggleButtonFactory;
   type IAppBarTemplateSettings_Interface;
   type IAppBarTemplateSettings is access all IAppBarTemplateSettings_Interface'Class;
   type IAppBarTemplateSettings_Ptr is access all IAppBarTemplateSettings;
   type ICalendarViewTemplateSettings_Interface;
   type ICalendarViewTemplateSettings is access all ICalendarViewTemplateSettings_Interface'Class;
   type ICalendarViewTemplateSettings_Ptr is access all ICalendarViewTemplateSettings;
   type ICommandBarTemplateSettings_Interface;
   type ICommandBarTemplateSettings is access all ICommandBarTemplateSettings_Interface'Class;
   type ICommandBarTemplateSettings_Ptr is access all ICommandBarTemplateSettings;
   type ICommandBarTemplateSettings2_Interface;
   type ICommandBarTemplateSettings2 is access all ICommandBarTemplateSettings2_Interface'Class;
   type ICommandBarTemplateSettings2_Ptr is access all ICommandBarTemplateSettings2;
   type ICommandBarTemplateSettings3_Interface;
   type ICommandBarTemplateSettings3 is access all ICommandBarTemplateSettings3_Interface'Class;
   type ICommandBarTemplateSettings3_Ptr is access all ICommandBarTemplateSettings3;
   type ISplitViewTemplateSettings_Interface;
   type ISplitViewTemplateSettings is access all ISplitViewTemplateSettings_Interface'Class;
   type ISplitViewTemplateSettings_Ptr is access all ISplitViewTemplateSettings;
   type ICalendarPanel_Interface;
   type ICalendarPanel is access all ICalendarPanel_Interface'Class;
   type ICalendarPanel_Ptr is access all ICalendarPanel;
   type IGridViewItemPresenter_Interface;
   type IGridViewItemPresenter is access all IGridViewItemPresenter_Interface'Class;
   type IGridViewItemPresenter_Ptr is access all IGridViewItemPresenter;
   type IGridViewItemPresenterStatics_Interface;
   type IGridViewItemPresenterStatics is access all IGridViewItemPresenterStatics_Interface'Class;
   type IGridViewItemPresenterStatics_Ptr is access all IGridViewItemPresenterStatics;
   type IGridViewItemPresenterFactory_Interface;
   type IGridViewItemPresenterFactory is access all IGridViewItemPresenterFactory_Interface'Class;
   type IGridViewItemPresenterFactory_Ptr is access all IGridViewItemPresenterFactory;
   type IListViewItemPresenter_Interface;
   type IListViewItemPresenter is access all IListViewItemPresenter_Interface'Class;
   type IListViewItemPresenter_Ptr is access all IListViewItemPresenter;
   type IListViewItemPresenterStatics_Interface;
   type IListViewItemPresenterStatics is access all IListViewItemPresenterStatics_Interface'Class;
   type IListViewItemPresenterStatics_Ptr is access all IListViewItemPresenterStatics;
   type IListViewItemPresenterFactory_Interface;
   type IListViewItemPresenterFactory is access all IListViewItemPresenterFactory_Interface'Class;
   type IListViewItemPresenterFactory_Ptr is access all IListViewItemPresenterFactory;
   type IListViewItemPresenter2_Interface;
   type IListViewItemPresenter2 is access all IListViewItemPresenter2_Interface'Class;
   type IListViewItemPresenter2_Ptr is access all IListViewItemPresenter2;
   type IListViewItemPresenterStatics2_Interface;
   type IListViewItemPresenterStatics2 is access all IListViewItemPresenterStatics2_Interface'Class;
   type IListViewItemPresenterStatics2_Ptr is access all IListViewItemPresenterStatics2;
   type IListViewItemPresenter3_Interface;
   type IListViewItemPresenter3 is access all IListViewItemPresenter3_Interface'Class;
   type IListViewItemPresenter3_Ptr is access all IListViewItemPresenter3;
   type IListViewItemPresenterStatics3_Interface;
   type IListViewItemPresenterStatics3 is access all IListViewItemPresenterStatics3_Interface'Class;
   type IListViewItemPresenterStatics3_Ptr is access all IListViewItemPresenterStatics3;
   type IGeneratorPositionHelper_Interface;
   type IGeneratorPositionHelper is access all IGeneratorPositionHelper_Interface'Class;
   type IGeneratorPositionHelper_Ptr is access all IGeneratorPositionHelper;
   type IGeneratorPositionHelperStatics_Interface;
   type IGeneratorPositionHelperStatics is access all IGeneratorPositionHelperStatics_Interface'Class;
   type IGeneratorPositionHelperStatics_Ptr is access all IGeneratorPositionHelperStatics;
   type IFlyoutBaseClosingEventArgs_Interface;
   type IFlyoutBaseClosingEventArgs is access all IFlyoutBaseClosingEventArgs_Interface'Class;
   type IFlyoutBaseClosingEventArgs_Ptr is access all IFlyoutBaseClosingEventArgs;
   type IFlyoutBase_Interface;
   type IFlyoutBase is access all IFlyoutBase_Interface'Class;
   type IFlyoutBase_Ptr is access all IFlyoutBase;
   type IFlyoutBaseOverrides_Interface;
   type IFlyoutBaseOverrides is access all IFlyoutBaseOverrides_Interface'Class;
   type IFlyoutBaseOverrides_Ptr is access all IFlyoutBaseOverrides;
   type IFlyoutBaseStatics_Interface;
   type IFlyoutBaseStatics is access all IFlyoutBaseStatics_Interface'Class;
   type IFlyoutBaseStatics_Ptr is access all IFlyoutBaseStatics;
   type IFlyoutBaseFactory_Interface;
   type IFlyoutBaseFactory is access all IFlyoutBaseFactory_Interface'Class;
   type IFlyoutBaseFactory_Ptr is access all IFlyoutBaseFactory;
   type IFlyoutBase2_Interface;
   type IFlyoutBase2 is access all IFlyoutBase2_Interface'Class;
   type IFlyoutBase2_Ptr is access all IFlyoutBase2;
   type IFlyoutBaseStatics2_Interface;
   type IFlyoutBaseStatics2 is access all IFlyoutBaseStatics2_Interface'Class;
   type IFlyoutBaseStatics2_Ptr is access all IFlyoutBaseStatics2;
   type IFlyoutBase3_Interface;
   type IFlyoutBase3 is access all IFlyoutBase3_Interface'Class;
   type IFlyoutBase3_Ptr is access all IFlyoutBase3;
   type IFlyoutBaseStatics3_Interface;
   type IFlyoutBaseStatics3 is access all IFlyoutBaseStatics3_Interface'Class;
   type IFlyoutBaseStatics3_Ptr is access all IFlyoutBaseStatics3;
   type IFlyoutBase4_Interface;
   type IFlyoutBase4 is access all IFlyoutBase4_Interface'Class;
   type IFlyoutBase4_Ptr is access all IFlyoutBase4;
   type IFlyoutBaseOverrides4_Interface;
   type IFlyoutBaseOverrides4 is access all IFlyoutBaseOverrides4_Interface'Class;
   type IFlyoutBaseOverrides4_Ptr is access all IFlyoutBaseOverrides4;
   type IJumpListItemBackgroundConverter_Interface;
   type IJumpListItemBackgroundConverter is access all IJumpListItemBackgroundConverter_Interface'Class;
   type IJumpListItemBackgroundConverter_Ptr is access all IJumpListItemBackgroundConverter;
   type IJumpListItemBackgroundConverterStatics_Interface;
   type IJumpListItemBackgroundConverterStatics is access all IJumpListItemBackgroundConverterStatics_Interface'Class;
   type IJumpListItemBackgroundConverterStatics_Ptr is access all IJumpListItemBackgroundConverterStatics;
   type IJumpListItemForegroundConverter_Interface;
   type IJumpListItemForegroundConverter is access all IJumpListItemForegroundConverter_Interface'Class;
   type IJumpListItemForegroundConverter_Ptr is access all IJumpListItemForegroundConverter;
   type IJumpListItemForegroundConverterStatics_Interface;
   type IJumpListItemForegroundConverterStatics is access all IJumpListItemForegroundConverterStatics_Interface'Class;
   type IJumpListItemForegroundConverterStatics_Ptr is access all IJumpListItemForegroundConverterStatics;
   type IPickerFlyoutBase_Interface;
   type IPickerFlyoutBase is access all IPickerFlyoutBase_Interface'Class;
   type IPickerFlyoutBase_Ptr is access all IPickerFlyoutBase;
   type IPickerFlyoutBaseOverrides_Interface;
   type IPickerFlyoutBaseOverrides is access all IPickerFlyoutBaseOverrides_Interface'Class;
   type IPickerFlyoutBaseOverrides_Ptr is access all IPickerFlyoutBaseOverrides;
   type IPickerFlyoutBaseStatics_Interface;
   type IPickerFlyoutBaseStatics is access all IPickerFlyoutBaseStatics_Interface'Class;
   type IPickerFlyoutBaseStatics_Ptr is access all IPickerFlyoutBaseStatics;
   type IPickerFlyoutBaseFactory_Interface;
   type IPickerFlyoutBaseFactory is access all IPickerFlyoutBaseFactory_Interface'Class;
   type IPickerFlyoutBaseFactory_Ptr is access all IPickerFlyoutBaseFactory;
   type ILoopingSelector_Interface;
   type ILoopingSelector is access all ILoopingSelector_Interface'Class;
   type ILoopingSelector_Ptr is access all ILoopingSelector;
   type ILoopingSelectorStatics_Interface;
   type ILoopingSelectorStatics is access all ILoopingSelectorStatics_Interface'Class;
   type ILoopingSelectorStatics_Ptr is access all ILoopingSelectorStatics;
   type IPivotPanel_Interface;
   type IPivotPanel is access all IPivotPanel_Interface'Class;
   type IPivotPanel_Ptr is access all IPivotPanel;
   type ILoopingSelectorItem_Interface;
   type ILoopingSelectorItem is access all ILoopingSelectorItem_Interface'Class;
   type ILoopingSelectorItem_Ptr is access all ILoopingSelectorItem;
   type ILoopingSelectorPanel_Interface;
   type ILoopingSelectorPanel is access all ILoopingSelectorPanel_Interface'Class;
   type ILoopingSelectorPanel_Ptr is access all ILoopingSelectorPanel;
   type IPivotHeaderItem_Interface;
   type IPivotHeaderItem is access all IPivotHeaderItem_Interface'Class;
   type IPivotHeaderItem_Ptr is access all IPivotHeaderItem;
   type IPivotHeaderItemFactory_Interface;
   type IPivotHeaderItemFactory is access all IPivotHeaderItemFactory_Interface'Class;
   type IPivotHeaderItemFactory_Ptr is access all IPivotHeaderItemFactory;
   type IPivotHeaderPanel_Interface;
   type IPivotHeaderPanel is access all IPivotHeaderPanel_Interface'Class;
   type IPivotHeaderPanel_Ptr is access all IPivotHeaderPanel;
   type IValueConverter_Imported_Interface;
   type IValueConverter_Imported is access all IValueConverter_Imported_Interface'Class;
   type IValueConverter_Imported_Ptr is access all IValueConverter_Imported;
   type IIterator_IPopup_Interface;
   type IIterator_IPopup is access all IIterator_IPopup_Interface'Class;
   type IIterator_IPopup_Ptr is access all IIterator_IPopup;
   type IIterable_IPopup_Interface;
   type IIterable_IPopup is access all IIterable_IPopup_Interface'Class;
   type IIterable_IPopup_Ptr is access all IIterable_IPopup;
   type IVectorView_IPopup_Interface;
   type IVectorView_IPopup is access all IVectorView_IPopup_Interface'Class;
   type IVectorView_IPopup_Ptr is access all IVectorView_IPopup;
   
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
   type IColorSpectrum_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Color
   (
      This       : access IColorSpectrum_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_Color
   (
      This       : access IColorSpectrum_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_HsvColor
   (
      This       : access IColorSpectrum_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector4
   )
   return Windows.HRESULT is abstract;
   
   function put_HsvColor
   (
      This       : access IColorSpectrum_Interface
      ; value : Windows.Foundation.Numerics.Vector4
   )
   return Windows.HRESULT is abstract;
   
   function get_MinHue
   (
      This       : access IColorSpectrum_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_MinHue
   (
      This       : access IColorSpectrum_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxHue
   (
      This       : access IColorSpectrum_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxHue
   (
      This       : access IColorSpectrum_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MinSaturation
   (
      This       : access IColorSpectrum_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_MinSaturation
   (
      This       : access IColorSpectrum_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxSaturation
   (
      This       : access IColorSpectrum_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxSaturation
   (
      This       : access IColorSpectrum_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MinValue
   (
      This       : access IColorSpectrum_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_MinValue
   (
      This       : access IColorSpectrum_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxValue
   (
      This       : access IColorSpectrum_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxValue
   (
      This       : access IColorSpectrum_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Shape
   (
      This       : access IColorSpectrum_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.ColorSpectrumShape
   )
   return Windows.HRESULT is abstract;
   
   function put_Shape
   (
      This       : access IColorSpectrum_Interface
      ; value : Windows.UI.Xaml.Controls.ColorSpectrumShape
   )
   return Windows.HRESULT is abstract;
   
   function get_Components
   (
      This       : access IColorSpectrum_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.ColorSpectrumComponents
   )
   return Windows.HRESULT is abstract;
   
   function put_Components
   (
      This       : access IColorSpectrum_Interface
      ; value : Windows.UI.Xaml.Controls.ColorSpectrumComponents
   )
   return Windows.HRESULT is abstract;
   
   function add_ColorChanged
   (
      This       : access IColorSpectrum_Interface
      ; value : TypedEventHandler_IColorSpectrum_add_ColorChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ColorChanged
   (
      This       : access IColorSpectrum_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IColorSpectrum : aliased constant Windows.IID := (3460756081, 62729, 20376, (130, 136, 228, 148, 47, 179, 133, 223 ));
   
   ------------------------------------------------------------------------
   type IColorSpectrumStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ColorProperty
   (
      This       : access IColorSpectrumStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_HsvColorProperty
   (
      This       : access IColorSpectrumStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_MinHueProperty
   (
      This       : access IColorSpectrumStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxHueProperty
   (
      This       : access IColorSpectrumStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_MinSaturationProperty
   (
      This       : access IColorSpectrumStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxSaturationProperty
   (
      This       : access IColorSpectrumStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_MinValueProperty
   (
      This       : access IColorSpectrumStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxValueProperty
   (
      This       : access IColorSpectrumStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ShapeProperty
   (
      This       : access IColorSpectrumStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ComponentsProperty
   (
      This       : access IColorSpectrumStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IColorSpectrumStatics : aliased constant Windows.IID := (2422992508, 11502, 20112, (150, 139, 240, 165, 189, 105, 27, 74 ));
   
   ------------------------------------------------------------------------
   type IColorSpectrumFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IColorSpectrumFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.IColorSpectrum
   )
   return Windows.HRESULT is abstract;
   
   IID_IColorSpectrumFactory : aliased constant Windows.IID := (2429019678, 36941, 17067, (180, 79, 230, 141, 191, 12, 222, 233 ));
   
   ------------------------------------------------------------------------
   type IColorPickerSlider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ColorChannel
   (
      This       : access IColorPickerSlider_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.ColorPickerHsvChannel
   )
   return Windows.HRESULT is abstract;
   
   function put_ColorChannel
   (
      This       : access IColorPickerSlider_Interface
      ; value : Windows.UI.Xaml.Controls.ColorPickerHsvChannel
   )
   return Windows.HRESULT is abstract;
   
   IID_IColorPickerSlider : aliased constant Windows.IID := (2486783363, 57567, 19551, (187, 205, 129, 85, 244, 2, 4, 64 ));
   
   ------------------------------------------------------------------------
   type IColorPickerSliderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ColorChannelProperty
   (
      This       : access IColorPickerSliderStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IColorPickerSliderStatics : aliased constant Windows.IID := (585825386, 40931, 20206, (135, 52, 161, 57, 142, 196, 65, 58 ));
   
   ------------------------------------------------------------------------
   type IColorPickerSliderFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IColorPickerSliderFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.IColorPickerSlider
   )
   return Windows.HRESULT is abstract;
   
   IID_IColorPickerSliderFactory : aliased constant Windows.IID := (114850210, 35847, 19230, (169, 64, 159, 188, 232, 244, 150, 57 ));
   
   ------------------------------------------------------------------------
   type IScrollSnapPointsInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AreHorizontalSnapPointsRegular
   (
      This       : access IScrollSnapPointsInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AreVerticalSnapPointsRegular
   (
      This       : access IScrollSnapPointsInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_HorizontalSnapPointsChanged
   (
      This       : access IScrollSnapPointsInfo_Interface
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_HorizontalSnapPointsChanged
   (
      This       : access IScrollSnapPointsInfo_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_VerticalSnapPointsChanged
   (
      This       : access IScrollSnapPointsInfo_Interface
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VerticalSnapPointsChanged
   (
      This       : access IScrollSnapPointsInfo_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function GetIrregularSnapPoints
   (
      This       : access IScrollSnapPointsInfo_Interface
      ; orientation : Windows.UI.Xaml.Controls.Orientation
      ; alignment : Windows.UI.Xaml.Controls.Primitives.SnapPointsAlignment
      ; RetVal : access Windows.Foundation.Collections.IVectorView_Single -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetRegularSnapPoints
   (
      This       : access IScrollSnapPointsInfo_Interface
      ; orientation : Windows.UI.Xaml.Controls.Orientation
      ; alignment : Windows.UI.Xaml.Controls.Primitives.SnapPointsAlignment
      ; offset : access Windows.Single
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   IID_IScrollSnapPointsInfo : aliased constant Windows.IID := (459084598, 58907, 19793, (190, 65, 253, 141, 220, 85, 197, 140 ));
   
   ------------------------------------------------------------------------
   type IItemsChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Action
   (
      This       : access IItemsChangedEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IItemsChangedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.GeneratorPosition
   )
   return Windows.HRESULT is abstract;
   
   function get_OldPosition
   (
      This       : access IItemsChangedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.GeneratorPosition
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemCount
   (
      This       : access IItemsChangedEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemUICount
   (
      This       : access IItemsChangedEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   IID_IItemsChangedEventArgs : aliased constant Windows.IID := (3904132456, 32016, 16926, (190, 41, 129, 131, 154, 145, 222, 32 ));
   
   ------------------------------------------------------------------------
   type ILayoutInformation_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ILayoutInformation : aliased constant Windows.IID := (3040365723, 51407, 16819, (191, 22, 24, 200, 66, 14, 114, 201 ));
   
   ------------------------------------------------------------------------
   type ILayoutInformationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetLayoutExceptionElement
   (
      This       : access ILayoutInformationStatics_Interface
      ; dispatcher : Windows.Object
      ; RetVal : access Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function GetLayoutSlot
   (
      This       : access ILayoutInformationStatics_Interface
      ; element : Windows.UI.Xaml.IFrameworkElement
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   IID_ILayoutInformationStatics : aliased constant Windows.IID := (3473330073, 22761, 18050, (131, 38, 80, 202, 171, 101, 237, 124 ));
   
   ------------------------------------------------------------------------
   type ILayoutInformationStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAvailableSize
   (
      This       : access ILayoutInformationStatics2_Interface
      ; element : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   IID_ILayoutInformationStatics2 : aliased constant Windows.IID := (1979913653, 27982, 18745, (172, 97, 99, 152, 99, 206, 163, 107 ));
   
   ------------------------------------------------------------------------
   type IComboBoxTemplateSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DropDownOpenedHeight
   (
      This       : access IComboBoxTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_DropDownClosedHeight
   (
      This       : access IComboBoxTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_DropDownOffset
   (
      This       : access IComboBoxTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedItemDirection
   (
      This       : access IComboBoxTemplateSettings_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.AnimationDirection
   )
   return Windows.HRESULT is abstract;
   
   IID_IComboBoxTemplateSettings : aliased constant Windows.IID := (2200460366, 6134, 19107, (182, 27, 232, 124, 113, 134, 4, 234 ));
   
   ------------------------------------------------------------------------
   type IComboBoxTemplateSettings2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DropDownContentMinWidth
   (
      This       : access IComboBoxTemplateSettings2_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IComboBoxTemplateSettings2 : aliased constant Windows.IID := (15273175, 26814, 17565, (181, 167, 118, 226, 111, 112, 62, 155 ));
   
   ------------------------------------------------------------------------
   type IDragCompletedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HorizontalChange
   (
      This       : access IDragCompletedEventArgs_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_VerticalChange
   (
      This       : access IDragCompletedEventArgs_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Canceled
   (
      This       : access IDragCompletedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IDragCompletedEventArgs : aliased constant Windows.IID := (2957978017, 48406, 18678, (165, 17, 156, 39, 99, 100, 19, 49 ));
   
   ------------------------------------------------------------------------
   type IDragCompletedEventArgsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithHorizontalChangeVerticalChangeAndCanceled
   (
      This       : access IDragCompletedEventArgsFactory_Interface
      ; horizontalChange : Windows.Double
      ; verticalChange : Windows.Double
      ; canceled : Windows.Boolean
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.IDragCompletedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   IID_IDragCompletedEventArgsFactory : aliased constant Windows.IID := (916969885, 5260, 18783, (160, 252, 175, 200, 113, 214, 47, 51 ));
   
   ------------------------------------------------------------------------
   type IDragDeltaEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HorizontalChange
   (
      This       : access IDragDeltaEventArgs_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_VerticalChange
   (
      This       : access IDragDeltaEventArgs_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IDragDeltaEventArgs : aliased constant Windows.IID := (741201724, 10246, 18940, (170, 233, 109, 121, 43, 87, 43, 106 ));
   
   ------------------------------------------------------------------------
   type IDragDeltaEventArgsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithHorizontalChangeAndVerticalChange
   (
      This       : access IDragDeltaEventArgsFactory_Interface
      ; horizontalChange : Windows.Double
      ; verticalChange : Windows.Double
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.IDragDeltaEventArgs
   )
   return Windows.HRESULT is abstract;
   
   IID_IDragDeltaEventArgsFactory : aliased constant Windows.IID := (1189585391, 44565, 17574, (138, 4, 149, 176, 191, 154, 184, 118 ));
   
   ------------------------------------------------------------------------
   type IDragStartedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HorizontalOffset
   (
      This       : access IDragStartedEventArgs_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_VerticalOffset
   (
      This       : access IDragStartedEventArgs_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IDragStartedEventArgs : aliased constant Windows.IID := (2677104080, 41252, 17254, (189, 133, 36, 8, 33, 74, 238, 212 ));
   
   ------------------------------------------------------------------------
   type IDragStartedEventArgsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithHorizontalOffsetAndVerticalOffset
   (
      This       : access IDragStartedEventArgsFactory_Interface
      ; horizontalOffset : Windows.Double
      ; verticalOffset : Windows.Double
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.IDragStartedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   IID_IDragStartedEventArgsFactory : aliased constant Windows.IID := (1592780153, 50950, 18305, (163, 8, 201, 231, 244, 198, 161, 215 ));
   
   ------------------------------------------------------------------------
   type IGridViewItemTemplateSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DragItemsCount
   (
      This       : access IGridViewItemTemplateSettings_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   IID_IGridViewItemTemplateSettings : aliased constant Windows.IID := (2653993647, 5725, 16999, (164, 94, 26, 67, 167, 87, 6, 172 ));
   
   ------------------------------------------------------------------------
   type IListViewItemTemplateSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DragItemsCount
   (
      This       : access IListViewItemTemplateSettings_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   IID_IListViewItemTemplateSettings : aliased constant Windows.IID := (1739556031, 33401, 18054, (147, 38, 205, 24, 159, 39, 87, 93 ));
   
   ------------------------------------------------------------------------
   type IMenuFlyoutPresenterTemplateSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FlyoutContentMinWidth
   (
      This       : access IMenuFlyoutPresenterTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IMenuFlyoutPresenterTemplateSettings : aliased constant Windows.IID := (3599749133, 25245, 17225, (172, 81, 184, 119, 200, 9, 131, 184 ));
   
   ------------------------------------------------------------------------
   type IProgressBarTemplateSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EllipseDiameter
   (
      This       : access IProgressBarTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_EllipseOffset
   (
      This       : access IProgressBarTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_EllipseAnimationWellPosition
   (
      This       : access IProgressBarTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_EllipseAnimationEndPosition
   (
      This       : access IProgressBarTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ContainerAnimationStartPosition
   (
      This       : access IProgressBarTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ContainerAnimationEndPosition
   (
      This       : access IProgressBarTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_IndicatorLengthDelta
   (
      This       : access IProgressBarTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IProgressBarTemplateSettings : aliased constant Windows.IID := (1071835690, 58354, 19499, (148, 136, 145, 141, 119, 210, 187, 228 ));
   
   ------------------------------------------------------------------------
   type IProgressRingTemplateSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EllipseDiameter
   (
      This       : access IProgressRingTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_EllipseOffset
   (
      This       : access IProgressRingTemplateSettings_Interface
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxSideLength
   (
      This       : access IProgressRingTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IProgressRingTemplateSettings : aliased constant Windows.IID := (3115742700, 50979, 17126, (131, 233, 152, 38, 39, 43, 220, 14 ));
   
   ------------------------------------------------------------------------
   type IRangeBaseValueChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OldValue
   (
      This       : access IRangeBaseValueChangedEventArgs_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_NewValue
   (
      This       : access IRangeBaseValueChangedEventArgs_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IRangeBaseValueChangedEventArgs : aliased constant Windows.IID := (2710706039, 54721, 20380, (167, 176, 4, 1, 183, 230, 220, 92 ));
   
   ------------------------------------------------------------------------
   type IScrollEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NewValue
   (
      This       : access IScrollEventArgs_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ScrollEventType
   (
      This       : access IScrollEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.ScrollEventType
   )
   return Windows.HRESULT is abstract;
   
   IID_IScrollEventArgs : aliased constant Windows.IID := (3313389928, 15102, 17549, (183, 82, 47, 54, 76, 117, 215, 67 ));
   
   ------------------------------------------------------------------------
   type ISettingsFlyoutTemplateSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HeaderBackground
   (
      This       : access ISettingsFlyoutTemplateSettings_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_HeaderForeground
   (
      This       : access ISettingsFlyoutTemplateSettings_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_BorderBrush
   (
      This       : access ISettingsFlyoutTemplateSettings_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_BorderThickness
   (
      This       : access ISettingsFlyoutTemplateSettings_Interface
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function get_IconSource
   (
      This       : access ISettingsFlyoutTemplateSettings_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IImageSource
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentTransitions
   (
      This       : access ISettingsFlyoutTemplateSettings_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IVector_Transition
   )
   return Windows.HRESULT is abstract;
   
   IID_ISettingsFlyoutTemplateSettings : aliased constant Windows.IID := (3169930256, 52903, 17393, (157, 104, 87, 96, 93, 237, 105, 212 ));
   
   ------------------------------------------------------------------------
   type IToggleSwitchTemplateSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_KnobCurrentToOnOffset
   (
      This       : access IToggleSwitchTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_KnobCurrentToOffOffset
   (
      This       : access IToggleSwitchTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_KnobOnToOffOffset
   (
      This       : access IToggleSwitchTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_KnobOffToOnOffset
   (
      This       : access IToggleSwitchTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_CurtainCurrentToOnOffset
   (
      This       : access IToggleSwitchTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_CurtainCurrentToOffOffset
   (
      This       : access IToggleSwitchTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_CurtainOnToOffOffset
   (
      This       : access IToggleSwitchTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_CurtainOffToOnOffset
   (
      This       : access IToggleSwitchTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IToggleSwitchTemplateSettings : aliased constant Windows.IID := (45596109, 25226, 17251, (134, 224, 81, 214, 226, 232, 158, 88 ));
   
   ------------------------------------------------------------------------
   type IToolTipTemplateSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FromHorizontalOffset
   (
      This       : access IToolTipTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_FromVerticalOffset
   (
      This       : access IToolTipTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IToolTipTemplateSettings : aliased constant Windows.IID := (3560473159, 3780, 17670, (175, 253, 175, 172, 34, 37, 180, 140 ));
   
   ------------------------------------------------------------------------
   type IPopup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Child
   (
      This       : access IPopup_Interface
      ; RetVal : access Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function put_Child
   (
      This       : access IPopup_Interface
      ; value : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOpen
   (
      This       : access IPopup_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsOpen
   (
      This       : access IPopup_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HorizontalOffset
   (
      This       : access IPopup_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_HorizontalOffset
   (
      This       : access IPopup_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_VerticalOffset
   (
      This       : access IPopup_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_VerticalOffset
   (
      This       : access IPopup_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ChildTransitions
   (
      This       : access IPopup_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IVector_Transition
   )
   return Windows.HRESULT is abstract;
   
   function put_ChildTransitions
   (
      This       : access IPopup_Interface
      ; value : Windows.UI.Xaml.Media.Animation.IVector_Transition
   )
   return Windows.HRESULT is abstract;
   
   function get_IsLightDismissEnabled
   (
      This       : access IPopup_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsLightDismissEnabled
   (
      This       : access IPopup_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_Opened
   (
      This       : access IPopup_Interface
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Opened
   (
      This       : access IPopup_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Closed
   (
      This       : access IPopup_Interface
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Closed
   (
      This       : access IPopup_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IPopup : aliased constant Windows.IID := (1648460352, 59091, 18181, (161, 220, 57, 21, 100, 86, 238, 41 ));
   
   ------------------------------------------------------------------------
   type IPopupStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChildProperty
   (
      This       : access IPopupStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOpenProperty
   (
      This       : access IPopupStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_HorizontalOffsetProperty
   (
      This       : access IPopupStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_VerticalOffsetProperty
   (
      This       : access IPopupStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ChildTransitionsProperty
   (
      This       : access IPopupStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsLightDismissEnabledProperty
   (
      This       : access IPopupStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IPopupStatics : aliased constant Windows.IID := (1524875034, 28212, 16598, (138, 127, 202, 130, 42, 175, 89, 227 ));
   
   ------------------------------------------------------------------------
   type IPopup2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LightDismissOverlayMode
   (
      This       : access IPopup2_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.LightDismissOverlayMode
   )
   return Windows.HRESULT is abstract;
   
   function put_LightDismissOverlayMode
   (
      This       : access IPopup2_Interface
      ; value : Windows.UI.Xaml.Controls.LightDismissOverlayMode
   )
   return Windows.HRESULT is abstract;
   
   IID_IPopup2 : aliased constant Windows.IID := (929729612, 43712, 19232, (150, 106, 11, 147, 100, 254, 180, 181 ));
   
   ------------------------------------------------------------------------
   type IPopupStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LightDismissOverlayModeProperty
   (
      This       : access IPopupStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IPopupStatics2 : aliased constant Windows.IID := (731572716, 21999, 17334, (180, 89, 18, 228, 15, 250, 67, 2 ));
   
   ------------------------------------------------------------------------
   type ITickBar_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Fill
   (
      This       : access ITickBar_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_Fill
   (
      This       : access ITickBar_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   IID_ITickBar : aliased constant Windows.IID := (2571535354, 61942, 18557, (165, 172, 193, 89, 33, 191, 169, 149 ));
   
   ------------------------------------------------------------------------
   type ITickBarStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FillProperty
   (
      This       : access ITickBarStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ITickBarStatics : aliased constant Windows.IID := (745373248, 31133, 19028, (190, 9, 31, 239, 198, 29, 1, 142 ));
   
   ------------------------------------------------------------------------
   type IRangeBase_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Minimum
   (
      This       : access IRangeBase_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Minimum
   (
      This       : access IRangeBase_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Maximum
   (
      This       : access IRangeBase_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Maximum
   (
      This       : access IRangeBase_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_SmallChange
   (
      This       : access IRangeBase_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_SmallChange
   (
      This       : access IRangeBase_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_LargeChange
   (
      This       : access IRangeBase_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_LargeChange
   (
      This       : access IRangeBase_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IRangeBase_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IRangeBase_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function add_ValueChanged
   (
      This       : access IRangeBase_Interface
      ; value : Windows.UI.Xaml.Controls.Primitives.RangeBaseValueChangedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ValueChanged
   (
      This       : access IRangeBase_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IRangeBase : aliased constant Windows.IID := (4194315290, 18766, 18127, (145, 212, 225, 74, 141, 121, 134, 117 ));
   
   ------------------------------------------------------------------------
   type IRangeBaseOverrides_Interface is interface and Windows.IInspectable_Interface;
   
   function OnMinimumChanged
   (
      This       : access IRangeBaseOverrides_Interface
      ; oldMinimum : Windows.Double
      ; newMinimum : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function OnMaximumChanged
   (
      This       : access IRangeBaseOverrides_Interface
      ; oldMaximum : Windows.Double
      ; newMaximum : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function OnValueChanged
   (
      This       : access IRangeBaseOverrides_Interface
      ; oldValue : Windows.Double
      ; newValue : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IRangeBaseOverrides : aliased constant Windows.IID := (1116843833, 32523, 19394, (153, 196, 6, 231, 6, 38, 130, 216 ));
   
   ------------------------------------------------------------------------
   type IRangeBaseStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MinimumProperty
   (
      This       : access IRangeBaseStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_MaximumProperty
   (
      This       : access IRangeBaseStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SmallChangeProperty
   (
      This       : access IRangeBaseStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_LargeChangeProperty
   (
      This       : access IRangeBaseStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ValueProperty
   (
      This       : access IRangeBaseStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IRangeBaseStatics : aliased constant Windows.IID := (1743722465, 65079, 18255, (158, 151, 59, 94, 11, 48, 242, 224 ));
   
   ------------------------------------------------------------------------
   type IRangeBaseFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IRangeBaseFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.IRangeBase
   )
   return Windows.HRESULT is abstract;
   
   IID_IRangeBaseFactory : aliased constant Windows.IID := (949714033, 21024, 17074, (153, 146, 38, 144, 193, 166, 112, 48 ));
   
   ------------------------------------------------------------------------
   type IThumb_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsDragging
   (
      This       : access IThumb_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_DragStarted
   (
      This       : access IThumb_Interface
      ; value : Windows.UI.Xaml.Controls.Primitives.DragStartedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DragStarted
   (
      This       : access IThumb_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DragDelta
   (
      This       : access IThumb_Interface
      ; value : Windows.UI.Xaml.Controls.Primitives.DragDeltaEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DragDelta
   (
      This       : access IThumb_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DragCompleted
   (
      This       : access IThumb_Interface
      ; value : Windows.UI.Xaml.Controls.Primitives.DragCompletedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DragCompleted
   (
      This       : access IThumb_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function CancelDrag
   (
      This       : access IThumb_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IThumb : aliased constant Windows.IID := (3904025217, 3434, 17871, (179, 51, 36, 2, 176, 55, 240, 153 ));
   
   ------------------------------------------------------------------------
   type IThumbStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsDraggingProperty
   (
      This       : access IThumbStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IThumbStatics : aliased constant Windows.IID := (2505057515, 14067, 18034, (161, 134, 186, 175, 98, 106, 196, 173 ));
   
   ------------------------------------------------------------------------
   type IButtonBase_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ClickMode
   (
      This       : access IButtonBase_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.ClickMode
   )
   return Windows.HRESULT is abstract;
   
   function put_ClickMode
   (
      This       : access IButtonBase_Interface
      ; value : Windows.UI.Xaml.Controls.ClickMode
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPointerOver
   (
      This       : access IButtonBase_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPressed
   (
      This       : access IButtonBase_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Command
   (
      This       : access IButtonBase_Interface
      ; RetVal : access Windows.UI.Xaml.Input.ICommand
   )
   return Windows.HRESULT is abstract;
   
   function put_Command
   (
      This       : access IButtonBase_Interface
      ; value : Windows.UI.Xaml.Input.ICommand
   )
   return Windows.HRESULT is abstract;
   
   function get_CommandParameter
   (
      This       : access IButtonBase_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_CommandParameter
   (
      This       : access IButtonBase_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function add_Click
   (
      This       : access IButtonBase_Interface
      ; value : Windows.UI.Xaml.RoutedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Click
   (
      This       : access IButtonBase_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IButtonBase : aliased constant Windows.IID := (4194315290, 18766, 18127, (145, 212, 225, 74, 141, 121, 134, 116 ));
   
   ------------------------------------------------------------------------
   type IButtonBaseStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ClickModeProperty
   (
      This       : access IButtonBaseStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPointerOverProperty
   (
      This       : access IButtonBaseStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPressedProperty
   (
      This       : access IButtonBaseStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CommandProperty
   (
      This       : access IButtonBaseStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CommandParameterProperty
   (
      This       : access IButtonBaseStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IButtonBaseStatics : aliased constant Windows.IID := (1743722465, 65079, 18255, (158, 151, 59, 94, 11, 48, 242, 223 ));
   
   ------------------------------------------------------------------------
   type IButtonBaseFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IButtonBaseFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.IButtonBase
   )
   return Windows.HRESULT is abstract;
   
   IID_IButtonBaseFactory : aliased constant Windows.IID := (949714033, 21024, 17074, (153, 146, 38, 144, 193, 166, 112, 47 ));
   
   ------------------------------------------------------------------------
   type ICarouselPanel_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanVerticallyScroll
   (
      This       : access ICarouselPanel_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanVerticallyScroll
   (
      This       : access ICarouselPanel_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanHorizontallyScroll
   (
      This       : access ICarouselPanel_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanHorizontallyScroll
   (
      This       : access ICarouselPanel_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtentWidth
   (
      This       : access ICarouselPanel_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtentHeight
   (
      This       : access ICarouselPanel_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ViewportWidth
   (
      This       : access ICarouselPanel_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ViewportHeight
   (
      This       : access ICarouselPanel_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_HorizontalOffset
   (
      This       : access ICarouselPanel_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_VerticalOffset
   (
      This       : access ICarouselPanel_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ScrollOwner
   (
      This       : access ICarouselPanel_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_ScrollOwner
   (
      This       : access ICarouselPanel_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function LineUp
   (
      This       : access ICarouselPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function LineDown
   (
      This       : access ICarouselPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function LineLeft
   (
      This       : access ICarouselPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function LineRight
   (
      This       : access ICarouselPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function PageUp
   (
      This       : access ICarouselPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function PageDown
   (
      This       : access ICarouselPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function PageLeft
   (
      This       : access ICarouselPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function PageRight
   (
      This       : access ICarouselPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function MouseWheelUp
   (
      This       : access ICarouselPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function MouseWheelDown
   (
      This       : access ICarouselPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function MouseWheelLeft
   (
      This       : access ICarouselPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function MouseWheelRight
   (
      This       : access ICarouselPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function SetHorizontalOffset
   (
      This       : access ICarouselPanel_Interface
      ; offset : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function SetVerticalOffset
   (
      This       : access ICarouselPanel_Interface
      ; offset : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function MakeVisible
   (
      This       : access ICarouselPanel_Interface
      ; visual : Windows.UI.Xaml.IUIElement
      ; rectangle : Windows.Foundation.Rect
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   IID_ICarouselPanel : aliased constant Windows.IID := (3735779506, 14139, 16721, (135, 133, 229, 68, 208, 217, 54, 43 ));
   
   ------------------------------------------------------------------------
   type ICarouselPanelFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access ICarouselPanelFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.ICarouselPanel
   )
   return Windows.HRESULT is abstract;
   
   IID_ICarouselPanelFactory : aliased constant Windows.IID := (3239089156, 39649, 17422, (160, 221, 187, 182, 226, 41, 60, 190 ));
   
   ------------------------------------------------------------------------
   type IOrientedVirtualizingPanel_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanVerticallyScroll
   (
      This       : access IOrientedVirtualizingPanel_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanVerticallyScroll
   (
      This       : access IOrientedVirtualizingPanel_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanHorizontallyScroll
   (
      This       : access IOrientedVirtualizingPanel_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanHorizontallyScroll
   (
      This       : access IOrientedVirtualizingPanel_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtentWidth
   (
      This       : access IOrientedVirtualizingPanel_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtentHeight
   (
      This       : access IOrientedVirtualizingPanel_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ViewportWidth
   (
      This       : access IOrientedVirtualizingPanel_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ViewportHeight
   (
      This       : access IOrientedVirtualizingPanel_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_HorizontalOffset
   (
      This       : access IOrientedVirtualizingPanel_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_VerticalOffset
   (
      This       : access IOrientedVirtualizingPanel_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ScrollOwner
   (
      This       : access IOrientedVirtualizingPanel_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_ScrollOwner
   (
      This       : access IOrientedVirtualizingPanel_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function LineUp
   (
      This       : access IOrientedVirtualizingPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function LineDown
   (
      This       : access IOrientedVirtualizingPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function LineLeft
   (
      This       : access IOrientedVirtualizingPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function LineRight
   (
      This       : access IOrientedVirtualizingPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function PageUp
   (
      This       : access IOrientedVirtualizingPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function PageDown
   (
      This       : access IOrientedVirtualizingPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function PageLeft
   (
      This       : access IOrientedVirtualizingPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function PageRight
   (
      This       : access IOrientedVirtualizingPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function MouseWheelUp
   (
      This       : access IOrientedVirtualizingPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function MouseWheelDown
   (
      This       : access IOrientedVirtualizingPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function MouseWheelLeft
   (
      This       : access IOrientedVirtualizingPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function MouseWheelRight
   (
      This       : access IOrientedVirtualizingPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function SetHorizontalOffset
   (
      This       : access IOrientedVirtualizingPanel_Interface
      ; offset : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function SetVerticalOffset
   (
      This       : access IOrientedVirtualizingPanel_Interface
      ; offset : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function MakeVisible
   (
      This       : access IOrientedVirtualizingPanel_Interface
      ; visual : Windows.UI.Xaml.IUIElement
      ; rectangle : Windows.Foundation.Rect
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   IID_IOrientedVirtualizingPanel : aliased constant Windows.IID := (4034377079, 14781, 18158, (189, 215, 8, 38, 190, 237, 113, 184 ));
   
   ------------------------------------------------------------------------
   type IOrientedVirtualizingPanelFactory_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IOrientedVirtualizingPanelFactory : aliased constant Windows.IID := (2072948399, 63791, 17309, (158, 191, 233, 145, 159, 86, 201, 77 ));
   
   ------------------------------------------------------------------------
   type IScrollBar_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Orientation
   (
      This       : access IScrollBar_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Orientation
   )
   return Windows.HRESULT is abstract;
   
   function put_Orientation
   (
      This       : access IScrollBar_Interface
      ; value : Windows.UI.Xaml.Controls.Orientation
   )
   return Windows.HRESULT is abstract;
   
   function get_ViewportSize
   (
      This       : access IScrollBar_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_ViewportSize
   (
      This       : access IScrollBar_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_IndicatorMode
   (
      This       : access IScrollBar_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.ScrollingIndicatorMode
   )
   return Windows.HRESULT is abstract;
   
   function put_IndicatorMode
   (
      This       : access IScrollBar_Interface
      ; value : Windows.UI.Xaml.Controls.Primitives.ScrollingIndicatorMode
   )
   return Windows.HRESULT is abstract;
   
   function add_Scroll
   (
      This       : access IScrollBar_Interface
      ; value : Windows.UI.Xaml.Controls.Primitives.ScrollEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Scroll
   (
      This       : access IScrollBar_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IScrollBar : aliased constant Windows.IID := (4118472394, 53670, 19344, (164, 233, 84, 223, 27, 168, 210, 236 ));
   
   ------------------------------------------------------------------------
   type IScrollBarStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OrientationProperty
   (
      This       : access IScrollBarStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ViewportSizeProperty
   (
      This       : access IScrollBarStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IndicatorModeProperty
   (
      This       : access IScrollBarStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IScrollBarStatics : aliased constant Windows.IID := (1173025677, 47124, 18639, (151, 242, 83, 158, 177, 109, 253, 77 ));
   
   ------------------------------------------------------------------------
   type ISelector_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SelectedIndex
   (
      This       : access ISelector_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedIndex
   (
      This       : access ISelector_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedItem
   (
      This       : access ISelector_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedItem
   (
      This       : access ISelector_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedValue
   (
      This       : access ISelector_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedValue
   (
      This       : access ISelector_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedValuePath
   (
      This       : access ISelector_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedValuePath
   (
      This       : access ISelector_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSynchronizedWithCurrentItem
   (
      This       : access ISelector_Interface
      ; RetVal : access Windows.Foundation.IReference_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_IsSynchronizedWithCurrentItem
   (
      This       : access ISelector_Interface
      ; value : Windows.Foundation.IReference_Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_SelectionChanged
   (
      This       : access ISelector_Interface
      ; value : Windows.UI.Xaml.Controls.SelectionChangedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SelectionChanged
   (
      This       : access ISelector_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_ISelector : aliased constant Windows.IID := (3809391525, 45931, 17116, (133, 39, 205, 37, 19, 108, 8, 60 ));
   
   ------------------------------------------------------------------------
   type ISelectorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SelectedIndexProperty
   (
      This       : access ISelectorStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedItemProperty
   (
      This       : access ISelectorStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedValueProperty
   (
      This       : access ISelectorStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedValuePathProperty
   (
      This       : access ISelectorStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSynchronizedWithCurrentItemProperty
   (
      This       : access ISelectorStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetIsSelectionActive
   (
      This       : access ISelectorStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_ISelectorStatics : aliased constant Windows.IID := (321915654, 48400, 19977, (191, 247, 113, 239, 184, 187, 180, 43 ));
   
   ------------------------------------------------------------------------
   type ISelectorFactory_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ISelectorFactory : aliased constant Windows.IID := (3384682901, 53558, 17920, (177, 135, 138, 213, 96, 121, 180, 138 ));
   
   ------------------------------------------------------------------------
   type ISelectorItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsSelected
   (
      This       : access ISelectorItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsSelected
   (
      This       : access ISelectorItem_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_ISelectorItem : aliased constant Windows.IID := (1411157356, 643, 17793, (185, 69, 42, 100, 194, 138, 6, 70 ));
   
   ------------------------------------------------------------------------
   type ISelectorItemStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsSelectedProperty
   (
      This       : access ISelectorItemStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ISelectorItemStatics : aliased constant Windows.IID := (708131512, 52201, 17155, (146, 231, 200, 144, 110, 33, 131, 146 ));
   
   ------------------------------------------------------------------------
   type ISelectorItemFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access ISelectorItemFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.ISelectorItem
   )
   return Windows.HRESULT is abstract;
   
   IID_ISelectorItemFactory : aliased constant Windows.IID := (3107338565, 51306, 19230, (148, 64, 24, 121, 55, 141, 83, 19 ));
   
   ------------------------------------------------------------------------
   type IRepeatButton_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Delay
   (
      This       : access IRepeatButton_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Delay
   (
      This       : access IRepeatButton_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Interval
   (
      This       : access IRepeatButton_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Interval
   (
      This       : access IRepeatButton_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   IID_IRepeatButton : aliased constant Windows.IID := (35655161, 538, 18506, (169, 59, 15, 49, 2, 3, 20, 229 ));
   
   ------------------------------------------------------------------------
   type IRepeatButtonStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DelayProperty
   (
      This       : access IRepeatButtonStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IntervalProperty
   (
      This       : access IRepeatButtonStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IRepeatButtonStatics : aliased constant Windows.IID := (957656142, 62562, 20339, (129, 151, 232, 132, 102, 57, 198, 130 ));
   
   ------------------------------------------------------------------------
   type IToggleButton_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsChecked
   (
      This       : access IToggleButton_Interface
      ; RetVal : access Windows.Foundation.IReference_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_IsChecked
   (
      This       : access IToggleButton_Interface
      ; value : Windows.Foundation.IReference_Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsThreeState
   (
      This       : access IToggleButton_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsThreeState
   (
      This       : access IToggleButton_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_Checked
   (
      This       : access IToggleButton_Interface
      ; value : Windows.UI.Xaml.RoutedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Checked
   (
      This       : access IToggleButton_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Unchecked
   (
      This       : access IToggleButton_Interface
      ; value : Windows.UI.Xaml.RoutedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Unchecked
   (
      This       : access IToggleButton_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Indeterminate
   (
      This       : access IToggleButton_Interface
      ; value : Windows.UI.Xaml.RoutedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Indeterminate
   (
      This       : access IToggleButton_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IToggleButton : aliased constant Windows.IID := (1486387195, 4039, 16438, (157, 139, 18, 125, 250, 117, 193, 109 ));
   
   ------------------------------------------------------------------------
   type IToggleButtonOverrides_Interface is interface and Windows.IInspectable_Interface;
   
   function OnToggle
   (
      This       : access IToggleButtonOverrides_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IToggleButtonOverrides : aliased constant Windows.IID := (3524152360, 61835, 18714, (154, 69, 241, 160, 74, 147, 105, 164 ));
   
   ------------------------------------------------------------------------
   type IToggleButtonStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsCheckedProperty
   (
      This       : access IToggleButtonStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsThreeStateProperty
   (
      This       : access IToggleButtonStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IToggleButtonStatics : aliased constant Windows.IID := (2938022674, 296, 20327, (156, 90, 130, 50, 12, 68, 93, 25 ));
   
   ------------------------------------------------------------------------
   type IToggleButtonFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IToggleButtonFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.IToggleButton
   )
   return Windows.HRESULT is abstract;
   
   IID_IToggleButtonFactory : aliased constant Windows.IID := (3580535548, 64639, 17564, (152, 85, 122, 16, 85, 214, 104, 168 ));
   
   ------------------------------------------------------------------------
   type IAppBarTemplateSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ClipRect
   (
      This       : access IAppBarTemplateSettings_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_CompactVerticalDelta
   (
      This       : access IAppBarTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_CompactRootMargin
   (
      This       : access IAppBarTemplateSettings_Interface
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function get_MinimalVerticalDelta
   (
      This       : access IAppBarTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_MinimalRootMargin
   (
      This       : access IAppBarTemplateSettings_Interface
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function get_HiddenVerticalDelta
   (
      This       : access IAppBarTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_HiddenRootMargin
   (
      This       : access IAppBarTemplateSettings_Interface
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppBarTemplateSettings : aliased constant Windows.IID := (3166873699, 60213, 16956, (131, 137, 215, 130, 123, 227, 191, 103 ));
   
   ------------------------------------------------------------------------
   type ICalendarViewTemplateSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MinViewWidth
   (
      This       : access ICalendarViewTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_HeaderText
   (
      This       : access ICalendarViewTemplateSettings_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WeekDay1
   (
      This       : access ICalendarViewTemplateSettings_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WeekDay2
   (
      This       : access ICalendarViewTemplateSettings_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WeekDay3
   (
      This       : access ICalendarViewTemplateSettings_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WeekDay4
   (
      This       : access ICalendarViewTemplateSettings_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WeekDay5
   (
      This       : access ICalendarViewTemplateSettings_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WeekDay6
   (
      This       : access ICalendarViewTemplateSettings_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WeekDay7
   (
      This       : access ICalendarViewTemplateSettings_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HasMoreContentAfter
   (
      This       : access ICalendarViewTemplateSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HasMoreContentBefore
   (
      This       : access ICalendarViewTemplateSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HasMoreViews
   (
      This       : access ICalendarViewTemplateSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ClipRect
   (
      This       : access ICalendarViewTemplateSettings_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_CenterX
   (
      This       : access ICalendarViewTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_CenterY
   (
      This       : access ICalendarViewTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_ICalendarViewTemplateSettings : aliased constant Windows.IID := (1455887491, 25825, 18300, (138, 11, 203, 47, 51, 52, 185, 176 ));
   
   ------------------------------------------------------------------------
   type ICommandBarTemplateSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContentHeight
   (
      This       : access ICommandBarTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_OverflowContentClipRect
   (
      This       : access ICommandBarTemplateSettings_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_OverflowContentMinWidth
   (
      This       : access ICommandBarTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_OverflowContentMaxHeight
   (
      This       : access ICommandBarTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_OverflowContentHorizontalOffset
   (
      This       : access ICommandBarTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_OverflowContentHeight
   (
      This       : access ICommandBarTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_NegativeOverflowContentHeight
   (
      This       : access ICommandBarTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_ICommandBarTemplateSettings : aliased constant Windows.IID := (1640560940, 1450, 16714, (162, 174, 72, 44, 90, 70, 192, 142 ));
   
   ------------------------------------------------------------------------
   type ICommandBarTemplateSettings2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OverflowContentMaxWidth
   (
      This       : access ICommandBarTemplateSettings2_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_ICommandBarTemplateSettings2 : aliased constant Windows.IID := (4222766995, 49890, 16759, (162, 182, 60, 215, 5, 7, 60, 246 ));
   
   ------------------------------------------------------------------------
   type ICommandBarTemplateSettings3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EffectiveOverflowButtonVisibility
   (
      This       : access ICommandBarTemplateSettings3_Interface
      ; RetVal : access Windows.UI.Xaml.Visibility
   )
   return Windows.HRESULT is abstract;
   
   IID_ICommandBarTemplateSettings3 : aliased constant Windows.IID := (1003953850, 13315, 19454, (132, 45, 44, 232, 197, 17, 210, 69 ));
   
   ------------------------------------------------------------------------
   type ISplitViewTemplateSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OpenPaneLength
   (
      This       : access ISplitViewTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_NegativeOpenPaneLength
   (
      This       : access ISplitViewTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_OpenPaneLengthMinusCompactLength
   (
      This       : access ISplitViewTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_NegativeOpenPaneLengthMinusCompactLength
   (
      This       : access ISplitViewTemplateSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_OpenPaneGridLength
   (
      This       : access ISplitViewTemplateSettings_Interface
      ; RetVal : access Windows.UI.Xaml.GridLength
   )
   return Windows.HRESULT is abstract;
   
   function get_CompactPaneGridLength
   (
      This       : access ISplitViewTemplateSettings_Interface
      ; RetVal : access Windows.UI.Xaml.GridLength
   )
   return Windows.HRESULT is abstract;
   
   IID_ISplitViewTemplateSettings : aliased constant Windows.IID := (3244996007, 18838, 17475, (177, 153, 107, 107, 137, 18, 78, 171 ));
   
   ------------------------------------------------------------------------
   type ICalendarPanel_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ICalendarPanel : aliased constant Windows.IID := (4241840685, 723, 20198, (154, 144, 157, 243, 234, 208, 9, 148 ));
   
   ------------------------------------------------------------------------
   type IGridViewItemPresenter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SelectionCheckMarkVisualEnabled
   (
      This       : access IGridViewItemPresenter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectionCheckMarkVisualEnabled
   (
      This       : access IGridViewItemPresenter_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CheckHintBrush
   (
      This       : access IGridViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_CheckHintBrush
   (
      This       : access IGridViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_CheckSelectingBrush
   (
      This       : access IGridViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_CheckSelectingBrush
   (
      This       : access IGridViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_CheckBrush
   (
      This       : access IGridViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_CheckBrush
   (
      This       : access IGridViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_DragBackground
   (
      This       : access IGridViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_DragBackground
   (
      This       : access IGridViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_DragForeground
   (
      This       : access IGridViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_DragForeground
   (
      This       : access IGridViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_FocusBorderBrush
   (
      This       : access IGridViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_FocusBorderBrush
   (
      This       : access IGridViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_PlaceholderBackground
   (
      This       : access IGridViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_PlaceholderBackground
   (
      This       : access IGridViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerOverBackground
   (
      This       : access IGridViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_PointerOverBackground
   (
      This       : access IGridViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedBackground
   (
      This       : access IGridViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedBackground
   (
      This       : access IGridViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedForeground
   (
      This       : access IGridViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedForeground
   (
      This       : access IGridViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedPointerOverBackground
   (
      This       : access IGridViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedPointerOverBackground
   (
      This       : access IGridViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedPointerOverBorderBrush
   (
      This       : access IGridViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedPointerOverBorderBrush
   (
      This       : access IGridViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedBorderThickness
   (
      This       : access IGridViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedBorderThickness
   (
      This       : access IGridViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function get_DisabledOpacity
   (
      This       : access IGridViewItemPresenter_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_DisabledOpacity
   (
      This       : access IGridViewItemPresenter_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_DragOpacity
   (
      This       : access IGridViewItemPresenter_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_DragOpacity
   (
      This       : access IGridViewItemPresenter_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ReorderHintOffset
   (
      This       : access IGridViewItemPresenter_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_ReorderHintOffset
   (
      This       : access IGridViewItemPresenter_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_GridViewItemPresenterHorizontalContentAlignment
   (
      This       : access IGridViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.HorizontalAlignment
   )
   return Windows.HRESULT is abstract;
   
   function put_GridViewItemPresenterHorizontalContentAlignment
   (
      This       : access IGridViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.HorizontalAlignment
   )
   return Windows.HRESULT is abstract;
   
   function get_GridViewItemPresenterVerticalContentAlignment
   (
      This       : access IGridViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.VerticalAlignment
   )
   return Windows.HRESULT is abstract;
   
   function put_GridViewItemPresenterVerticalContentAlignment
   (
      This       : access IGridViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.VerticalAlignment
   )
   return Windows.HRESULT is abstract;
   
   function get_GridViewItemPresenterPadding
   (
      This       : access IGridViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function put_GridViewItemPresenterPadding
   (
      This       : access IGridViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerOverBackgroundMargin
   (
      This       : access IGridViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function put_PointerOverBackgroundMargin
   (
      This       : access IGridViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentMargin
   (
      This       : access IGridViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentMargin
   (
      This       : access IGridViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   IID_IGridViewItemPresenter : aliased constant Windows.IID := (558862352, 22242, 18465, (138, 28, 35, 5, 112, 154, 249, 75 ));
   
   ------------------------------------------------------------------------
   type IGridViewItemPresenterStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SelectionCheckMarkVisualEnabledProperty
   (
      This       : access IGridViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CheckHintBrushProperty
   (
      This       : access IGridViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CheckSelectingBrushProperty
   (
      This       : access IGridViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CheckBrushProperty
   (
      This       : access IGridViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_DragBackgroundProperty
   (
      This       : access IGridViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_DragForegroundProperty
   (
      This       : access IGridViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FocusBorderBrushProperty
   (
      This       : access IGridViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_PlaceholderBackgroundProperty
   (
      This       : access IGridViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerOverBackgroundProperty
   (
      This       : access IGridViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedBackgroundProperty
   (
      This       : access IGridViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedForegroundProperty
   (
      This       : access IGridViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedPointerOverBackgroundProperty
   (
      This       : access IGridViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedPointerOverBorderBrushProperty
   (
      This       : access IGridViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedBorderThicknessProperty
   (
      This       : access IGridViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_DisabledOpacityProperty
   (
      This       : access IGridViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_DragOpacityProperty
   (
      This       : access IGridViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ReorderHintOffsetProperty
   (
      This       : access IGridViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_GridViewItemPresenterHorizontalContentAlignmentProperty
   (
      This       : access IGridViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_GridViewItemPresenterVerticalContentAlignmentProperty
   (
      This       : access IGridViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_GridViewItemPresenterPaddingProperty
   (
      This       : access IGridViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerOverBackgroundMarginProperty
   (
      This       : access IGridViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentMarginProperty
   (
      This       : access IGridViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IGridViewItemPresenterStatics : aliased constant Windows.IID := (3914922180, 10110, 19058, (160, 30, 158, 22, 136, 152, 1, 120 ));
   
   ------------------------------------------------------------------------
   type IGridViewItemPresenterFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IGridViewItemPresenterFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.IGridViewItemPresenter
   )
   return Windows.HRESULT is abstract;
   
   IID_IGridViewItemPresenterFactory : aliased constant Windows.IID := (1405165944, 25531, 19045, (163, 241, 171, 17, 76, 252, 111, 254 ));
   
   ------------------------------------------------------------------------
   type IListViewItemPresenter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SelectionCheckMarkVisualEnabled
   (
      This       : access IListViewItemPresenter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectionCheckMarkVisualEnabled
   (
      This       : access IListViewItemPresenter_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CheckHintBrush
   (
      This       : access IListViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_CheckHintBrush
   (
      This       : access IListViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_CheckSelectingBrush
   (
      This       : access IListViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_CheckSelectingBrush
   (
      This       : access IListViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_CheckBrush
   (
      This       : access IListViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_CheckBrush
   (
      This       : access IListViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_DragBackground
   (
      This       : access IListViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_DragBackground
   (
      This       : access IListViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_DragForeground
   (
      This       : access IListViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_DragForeground
   (
      This       : access IListViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_FocusBorderBrush
   (
      This       : access IListViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_FocusBorderBrush
   (
      This       : access IListViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_PlaceholderBackground
   (
      This       : access IListViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_PlaceholderBackground
   (
      This       : access IListViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerOverBackground
   (
      This       : access IListViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_PointerOverBackground
   (
      This       : access IListViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedBackground
   (
      This       : access IListViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedBackground
   (
      This       : access IListViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedForeground
   (
      This       : access IListViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedForeground
   (
      This       : access IListViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedPointerOverBackground
   (
      This       : access IListViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedPointerOverBackground
   (
      This       : access IListViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedPointerOverBorderBrush
   (
      This       : access IListViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedPointerOverBorderBrush
   (
      This       : access IListViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedBorderThickness
   (
      This       : access IListViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedBorderThickness
   (
      This       : access IListViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function get_DisabledOpacity
   (
      This       : access IListViewItemPresenter_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_DisabledOpacity
   (
      This       : access IListViewItemPresenter_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_DragOpacity
   (
      This       : access IListViewItemPresenter_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_DragOpacity
   (
      This       : access IListViewItemPresenter_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ReorderHintOffset
   (
      This       : access IListViewItemPresenter_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_ReorderHintOffset
   (
      This       : access IListViewItemPresenter_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ListViewItemPresenterHorizontalContentAlignment
   (
      This       : access IListViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.HorizontalAlignment
   )
   return Windows.HRESULT is abstract;
   
   function put_ListViewItemPresenterHorizontalContentAlignment
   (
      This       : access IListViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.HorizontalAlignment
   )
   return Windows.HRESULT is abstract;
   
   function get_ListViewItemPresenterVerticalContentAlignment
   (
      This       : access IListViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.VerticalAlignment
   )
   return Windows.HRESULT is abstract;
   
   function put_ListViewItemPresenterVerticalContentAlignment
   (
      This       : access IListViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.VerticalAlignment
   )
   return Windows.HRESULT is abstract;
   
   function get_ListViewItemPresenterPadding
   (
      This       : access IListViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function put_ListViewItemPresenterPadding
   (
      This       : access IListViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerOverBackgroundMargin
   (
      This       : access IListViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function put_PointerOverBackgroundMargin
   (
      This       : access IListViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentMargin
   (
      This       : access IListViewItemPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentMargin
   (
      This       : access IListViewItemPresenter_Interface
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   IID_IListViewItemPresenter : aliased constant Windows.IID := (4236854973, 41890, 18793, (129, 116, 37, 181, 211, 194, 128, 51 ));
   
   ------------------------------------------------------------------------
   type IListViewItemPresenterStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SelectionCheckMarkVisualEnabledProperty
   (
      This       : access IListViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CheckHintBrushProperty
   (
      This       : access IListViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CheckSelectingBrushProperty
   (
      This       : access IListViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CheckBrushProperty
   (
      This       : access IListViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_DragBackgroundProperty
   (
      This       : access IListViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_DragForegroundProperty
   (
      This       : access IListViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FocusBorderBrushProperty
   (
      This       : access IListViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_PlaceholderBackgroundProperty
   (
      This       : access IListViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerOverBackgroundProperty
   (
      This       : access IListViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedBackgroundProperty
   (
      This       : access IListViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedForegroundProperty
   (
      This       : access IListViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedPointerOverBackgroundProperty
   (
      This       : access IListViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedPointerOverBorderBrushProperty
   (
      This       : access IListViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedBorderThicknessProperty
   (
      This       : access IListViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_DisabledOpacityProperty
   (
      This       : access IListViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_DragOpacityProperty
   (
      This       : access IListViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ReorderHintOffsetProperty
   (
      This       : access IListViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ListViewItemPresenterHorizontalContentAlignmentProperty
   (
      This       : access IListViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ListViewItemPresenterVerticalContentAlignmentProperty
   (
      This       : access IListViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ListViewItemPresenterPaddingProperty
   (
      This       : access IListViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerOverBackgroundMarginProperty
   (
      This       : access IListViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentMarginProperty
   (
      This       : access IListViewItemPresenterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IListViewItemPresenterStatics : aliased constant Windows.IID := (1694803290, 5597, 17147, (170, 93, 45, 140, 226, 233, 194, 148 ));
   
   ------------------------------------------------------------------------
   type IListViewItemPresenterFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IListViewItemPresenterFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.IListViewItemPresenter
   )
   return Windows.HRESULT is abstract;
   
   IID_IListViewItemPresenterFactory : aliased constant Windows.IID := (3765927165, 63460, 19047, (154, 192, 169, 148, 252, 172, 208, 32 ));
   
   ------------------------------------------------------------------------
   type IListViewItemPresenter2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SelectedPressedBackground
   (
      This       : access IListViewItemPresenter2_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedPressedBackground
   (
      This       : access IListViewItemPresenter2_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_PressedBackground
   (
      This       : access IListViewItemPresenter2_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_PressedBackground
   (
      This       : access IListViewItemPresenter2_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_CheckBoxBrush
   (
      This       : access IListViewItemPresenter2_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_CheckBoxBrush
   (
      This       : access IListViewItemPresenter2_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_FocusSecondaryBorderBrush
   (
      This       : access IListViewItemPresenter2_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_FocusSecondaryBorderBrush
   (
      This       : access IListViewItemPresenter2_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_CheckMode
   (
      This       : access IListViewItemPresenter2_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenterCheckMode
   )
   return Windows.HRESULT is abstract;
   
   function put_CheckMode
   (
      This       : access IListViewItemPresenter2_Interface
      ; value : Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenterCheckMode
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerOverForeground
   (
      This       : access IListViewItemPresenter2_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_PointerOverForeground
   (
      This       : access IListViewItemPresenter2_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   IID_IListViewItemPresenter2 : aliased constant Windows.IID := (4124857494, 57634, 19543, (166, 37, 172, 75, 8, 251, 45, 76 ));
   
   ------------------------------------------------------------------------
   type IListViewItemPresenterStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SelectedPressedBackgroundProperty
   (
      This       : access IListViewItemPresenterStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_PressedBackgroundProperty
   (
      This       : access IListViewItemPresenterStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CheckBoxBrushProperty
   (
      This       : access IListViewItemPresenterStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FocusSecondaryBorderBrushProperty
   (
      This       : access IListViewItemPresenterStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CheckModeProperty
   (
      This       : access IListViewItemPresenterStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerOverForegroundProperty
   (
      This       : access IListViewItemPresenterStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IListViewItemPresenterStatics2 : aliased constant Windows.IID := (1286846789, 53837, 17059, (158, 131, 168, 109, 6, 24, 191, 27 ));
   
   ------------------------------------------------------------------------
   type IListViewItemPresenter3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RevealBackground
   (
      This       : access IListViewItemPresenter3_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_RevealBackground
   (
      This       : access IListViewItemPresenter3_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_RevealBorderBrush
   (
      This       : access IListViewItemPresenter3_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_RevealBorderBrush
   (
      This       : access IListViewItemPresenter3_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_RevealBorderThickness
   (
      This       : access IListViewItemPresenter3_Interface
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function put_RevealBorderThickness
   (
      This       : access IListViewItemPresenter3_Interface
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function get_RevealBackgroundShowsAboveContent
   (
      This       : access IListViewItemPresenter3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_RevealBackgroundShowsAboveContent
   (
      This       : access IListViewItemPresenter3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IListViewItemPresenter3 : aliased constant Windows.IID := (912392211, 912, 20016, (173, 151, 135, 68, 64, 79, 112, 16 ));
   
   ------------------------------------------------------------------------
   type IListViewItemPresenterStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RevealBackgroundProperty
   (
      This       : access IListViewItemPresenterStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RevealBorderBrushProperty
   (
      This       : access IListViewItemPresenterStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RevealBorderThicknessProperty
   (
      This       : access IListViewItemPresenterStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RevealBackgroundShowsAboveContentProperty
   (
      This       : access IListViewItemPresenterStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IListViewItemPresenterStatics3 : aliased constant Windows.IID := (3285438750, 64038, 19687, (164, 237, 255, 148, 143, 1, 183, 192 ));
   
   ------------------------------------------------------------------------
   type IGeneratorPositionHelper_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IGeneratorPositionHelper : aliased constant Windows.IID := (3443536269, 30533, 16601, (171, 157, 171, 189, 164, 167, 255, 234 ));
   
   ------------------------------------------------------------------------
   type IGeneratorPositionHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromIndexAndOffset
   (
      This       : access IGeneratorPositionHelperStatics_Interface
      ; index : Windows.Int32
      ; offset : Windows.Int32
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.GeneratorPosition
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeneratorPositionHelperStatics : aliased constant Windows.IID := (2906691021, 24812, 17800, (141, 96, 57, 210, 144, 151, 164, 223 ));
   
   ------------------------------------------------------------------------
   type IFlyoutBaseClosingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Cancel
   (
      This       : access IFlyoutBaseClosingEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Cancel
   (
      This       : access IFlyoutBaseClosingEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IFlyoutBaseClosingEventArgs : aliased constant Windows.IID := (3497362733, 45210, 20433, (176, 5, 219, 43, 160, 18, 6, 251 ));
   
   ------------------------------------------------------------------------
   type IFlyoutBase_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Placement
   (
      This       : access IFlyoutBase_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.FlyoutPlacementMode
   )
   return Windows.HRESULT is abstract;
   
   function put_Placement
   (
      This       : access IFlyoutBase_Interface
      ; value : Windows.UI.Xaml.Controls.Primitives.FlyoutPlacementMode
   )
   return Windows.HRESULT is abstract;
   
   function add_Opened
   (
      This       : access IFlyoutBase_Interface
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Opened
   (
      This       : access IFlyoutBase_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Closed
   (
      This       : access IFlyoutBase_Interface
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Closed
   (
      This       : access IFlyoutBase_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Opening
   (
      This       : access IFlyoutBase_Interface
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Opening
   (
      This       : access IFlyoutBase_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function ShowAt
   (
      This       : access IFlyoutBase_Interface
      ; placementTarget : Windows.UI.Xaml.IFrameworkElement
   )
   return Windows.HRESULT is abstract;
   
   function Hide
   (
      This       : access IFlyoutBase_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IFlyoutBase : aliased constant Windows.IID := (1916725771, 53550, 17165, (169, 240, 155, 179, 43, 191, 153, 19 ));
   
   ------------------------------------------------------------------------
   type IFlyoutBaseOverrides_Interface is interface and Windows.IInspectable_Interface;
   
   function CreatePresenter
   (
      This       : access IFlyoutBaseOverrides_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.IControl
   )
   return Windows.HRESULT is abstract;
   
   IID_IFlyoutBaseOverrides : aliased constant Windows.IID := (270396550, 28493, 17828, (157, 14, 62, 206, 111, 22, 151, 126 ));
   
   ------------------------------------------------------------------------
   type IFlyoutBaseStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PlacementProperty
   (
      This       : access IFlyoutBaseStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_AttachedFlyoutProperty
   (
      This       : access IFlyoutBaseStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetAttachedFlyout
   (
      This       : access IFlyoutBaseStatics_Interface
      ; element : Windows.UI.Xaml.IFrameworkElement
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.IFlyoutBase
   )
   return Windows.HRESULT is abstract;
   
   function SetAttachedFlyout
   (
      This       : access IFlyoutBaseStatics_Interface
      ; element : Windows.UI.Xaml.IFrameworkElement
      ; value : Windows.UI.Xaml.Controls.Primitives.IFlyoutBase
   )
   return Windows.HRESULT is abstract;
   
   function ShowAttachedFlyout
   (
      This       : access IFlyoutBaseStatics_Interface
      ; flyoutOwner : Windows.UI.Xaml.IFrameworkElement
   )
   return Windows.HRESULT is abstract;
   
   IID_IFlyoutBaseStatics : aliased constant Windows.IID := (3805779427, 34240, 19938, (186, 193, 82, 148, 202, 1, 26, 120 ));
   
   ------------------------------------------------------------------------
   type IFlyoutBaseFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IFlyoutBaseFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.IFlyoutBase
   )
   return Windows.HRESULT is abstract;
   
   IID_IFlyoutBaseFactory : aliased constant Windows.IID := (473129943, 64679, 16510, (146, 14, 112, 225, 94, 159, 11, 241 ));
   
   ------------------------------------------------------------------------
   type IFlyoutBase2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Target
   (
      This       : access IFlyoutBase2_Interface
      ; RetVal : access Windows.UI.Xaml.IFrameworkElement
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowFocusOnInteraction
   (
      This       : access IFlyoutBase2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowFocusOnInteraction
   (
      This       : access IFlyoutBase2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_LightDismissOverlayMode
   (
      This       : access IFlyoutBase2_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.LightDismissOverlayMode
   )
   return Windows.HRESULT is abstract;
   
   function put_LightDismissOverlayMode
   (
      This       : access IFlyoutBase2_Interface
      ; value : Windows.UI.Xaml.Controls.LightDismissOverlayMode
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowFocusWhenDisabled
   (
      This       : access IFlyoutBase2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowFocusWhenDisabled
   (
      This       : access IFlyoutBase2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ElementSoundMode
   (
      This       : access IFlyoutBase2_Interface
      ; RetVal : access Windows.UI.Xaml.ElementSoundMode
   )
   return Windows.HRESULT is abstract;
   
   function put_ElementSoundMode
   (
      This       : access IFlyoutBase2_Interface
      ; value : Windows.UI.Xaml.ElementSoundMode
   )
   return Windows.HRESULT is abstract;
   
   function add_Closing
   (
      This       : access IFlyoutBase2_Interface
      ; value : TypedEventHandler_IFlyoutBase2_add_Closing
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Closing
   (
      This       : access IFlyoutBase2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IFlyoutBase2 : aliased constant Windows.IID := (4163584862, 26035, 16838, (169, 226, 119, 182, 123, 196, 192, 12 ));
   
   ------------------------------------------------------------------------
   type IFlyoutBaseStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllowFocusOnInteractionProperty
   (
      This       : access IFlyoutBaseStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_LightDismissOverlayModeProperty
   (
      This       : access IFlyoutBaseStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowFocusWhenDisabledProperty
   (
      This       : access IFlyoutBaseStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ElementSoundModeProperty
   (
      This       : access IFlyoutBaseStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IFlyoutBaseStatics2 : aliased constant Windows.IID := (2833847294, 11616, 17159, (170, 217, 86, 180, 80, 18, 27, 88 ));
   
   ------------------------------------------------------------------------
   type IFlyoutBase3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OverlayInputPassThroughElement
   (
      This       : access IFlyoutBase3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function put_OverlayInputPassThroughElement
   (
      This       : access IFlyoutBase3_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   IID_IFlyoutBase3 : aliased constant Windows.IID := (2828834578, 18656, 16960, (149, 185, 13, 253, 8, 38, 168, 211 ));
   
   ------------------------------------------------------------------------
   type IFlyoutBaseStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OverlayInputPassThroughElementProperty
   (
      This       : access IFlyoutBaseStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IFlyoutBaseStatics3 : aliased constant Windows.IID := (2074685007, 56598, 19428, (153, 219, 189, 157, 68, 6, 192, 248 ));
   
   ------------------------------------------------------------------------
   type IFlyoutBase4_Interface is interface and Windows.IInspectable_Interface;
   
   function TryInvokeKeyboardAccelerator
   (
      This       : access IFlyoutBase4_Interface
      ; args : Windows.UI.Xaml.Input.IProcessKeyboardAcceleratorEventArgs
   )
   return Windows.HRESULT is abstract;
   
   IID_IFlyoutBase4 : aliased constant Windows.IID := (3817438569, 41855, 18472, (155, 112, 14, 246, 124, 3, 181, 248 ));
   
   ------------------------------------------------------------------------
   type IFlyoutBaseOverrides4_Interface is interface and Windows.IInspectable_Interface;
   
   function OnProcessKeyboardAccelerators
   (
      This       : access IFlyoutBaseOverrides4_Interface
      ; args : Windows.UI.Xaml.Input.IProcessKeyboardAcceleratorEventArgs
   )
   return Windows.HRESULT is abstract;
   
   IID_IFlyoutBaseOverrides4 : aliased constant Windows.IID := (2797588557, 24563, 17432, (173, 216, 64, 66, 168, 141, 45, 165 ));
   
   ------------------------------------------------------------------------
   type IJumpListItemBackgroundConverter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Enabled
   (
      This       : access IJumpListItemBackgroundConverter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_Enabled
   (
      This       : access IJumpListItemBackgroundConverter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_Disabled
   (
      This       : access IJumpListItemBackgroundConverter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_Disabled
   (
      This       : access IJumpListItemBackgroundConverter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   IID_IJumpListItemBackgroundConverter : aliased constant Windows.IID := (2165799000, 53796, 16652, (177, 108, 197, 182, 187, 97, 136, 178 ));
   
   ------------------------------------------------------------------------
   type IJumpListItemBackgroundConverterStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EnabledProperty
   (
      This       : access IJumpListItemBackgroundConverterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_DisabledProperty
   (
      This       : access IJumpListItemBackgroundConverterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IJumpListItemBackgroundConverterStatics : aliased constant Windows.IID := (552059869, 28455, 18440, (176, 190, 131, 224, 233, 181, 204, 69 ));
   
   ------------------------------------------------------------------------
   type IJumpListItemForegroundConverter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Enabled
   (
      This       : access IJumpListItemForegroundConverter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_Enabled
   (
      This       : access IJumpListItemForegroundConverter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_Disabled
   (
      This       : access IJumpListItemForegroundConverter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_Disabled
   (
      This       : access IJumpListItemForegroundConverter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   IID_IJumpListItemForegroundConverter : aliased constant Windows.IID := (361819448, 50436, 18326, (166, 58, 91, 252, 158, 239, 170, 232 ));
   
   ------------------------------------------------------------------------
   type IJumpListItemForegroundConverterStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EnabledProperty
   (
      This       : access IJumpListItemForegroundConverterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_DisabledProperty
   (
      This       : access IJumpListItemForegroundConverterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IJumpListItemForegroundConverterStatics : aliased constant Windows.IID := (1196323666, 8460, 18035, (172, 106, 65, 63, 14, 44, 119, 80 ));
   
   ------------------------------------------------------------------------
   type IPickerFlyoutBase_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IPickerFlyoutBase : aliased constant Windows.IID := (3811931370, 4214, 17617, (147, 131, 220, 36, 172, 92, 255, 42 ));
   
   ------------------------------------------------------------------------
   type IPickerFlyoutBaseOverrides_Interface is interface and Windows.IInspectable_Interface;
   
   function OnConfirmed
   (
      This       : access IPickerFlyoutBaseOverrides_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ShouldShowConfirmationButtons
   (
      This       : access IPickerFlyoutBaseOverrides_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IPickerFlyoutBaseOverrides : aliased constant Windows.IID := (1543262026, 18466, 18356, (169, 88, 119, 194, 11, 161, 32, 211 ));
   
   ------------------------------------------------------------------------
   type IPickerFlyoutBaseStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TitleProperty
   (
      This       : access IPickerFlyoutBaseStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetTitle
   (
      This       : access IPickerFlyoutBaseStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetTitle
   (
      This       : access IPickerFlyoutBaseStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IPickerFlyoutBaseStatics : aliased constant Windows.IID := (1514998469, 35246, 16613, (167, 241, 187, 112, 35, 85, 173, 243 ));
   
   ------------------------------------------------------------------------
   type IPickerFlyoutBaseFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IPickerFlyoutBaseFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.IPickerFlyoutBase
   )
   return Windows.HRESULT is abstract;
   
   IID_IPickerFlyoutBaseFactory : aliased constant Windows.IID := (2126674515, 38146, 19435, (179, 66, 0, 86, 108, 143, 22, 176 ));
   
   ------------------------------------------------------------------------
   type ILoopingSelector_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ShouldLoop
   (
      This       : access ILoopingSelector_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ShouldLoop
   (
      This       : access ILoopingSelector_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Items
   (
      This       : access ILoopingSelector_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_Object -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Items
   (
      This       : access ILoopingSelector_Interface
      ; value : Windows.Foundation.Collections.IVector_Object
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedIndex
   (
      This       : access ILoopingSelector_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedIndex
   (
      This       : access ILoopingSelector_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedItem
   (
      This       : access ILoopingSelector_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedItem
   (
      This       : access ILoopingSelector_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemWidth
   (
      This       : access ILoopingSelector_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_ItemWidth
   (
      This       : access ILoopingSelector_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemHeight
   (
      This       : access ILoopingSelector_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_ItemHeight
   (
      This       : access ILoopingSelector_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemTemplate
   (
      This       : access ILoopingSelector_Interface
      ; RetVal : access Windows.UI.Xaml.IDataTemplate
   )
   return Windows.HRESULT is abstract;
   
   function put_ItemTemplate
   (
      This       : access ILoopingSelector_Interface
      ; value : Windows.UI.Xaml.IDataTemplate
   )
   return Windows.HRESULT is abstract;
   
   function add_SelectionChanged
   (
      This       : access ILoopingSelector_Interface
      ; value : Windows.UI.Xaml.Controls.SelectionChangedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SelectionChanged
   (
      This       : access ILoopingSelector_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_ILoopingSelector : aliased constant Windows.IID := (1285176836, 18471, 18905, (136, 6, 9, 57, 87, 176, 253, 33 ));
   
   ------------------------------------------------------------------------
   type ILoopingSelectorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ShouldLoopProperty
   (
      This       : access ILoopingSelectorStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemsProperty
   (
      This       : access ILoopingSelectorStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedIndexProperty
   (
      This       : access ILoopingSelectorStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedItemProperty
   (
      This       : access ILoopingSelectorStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemWidthProperty
   (
      This       : access ILoopingSelectorStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemHeightProperty
   (
      This       : access ILoopingSelectorStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemTemplateProperty
   (
      This       : access ILoopingSelectorStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ILoopingSelectorStatics : aliased constant Windows.IID := (65583866, 35965, 20421, (185, 42, 240, 73, 251, 147, 60, 197 ));
   
   ------------------------------------------------------------------------
   type IPivotPanel_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IPivotPanel : aliased constant Windows.IID := (2907618944, 8873, 19619, (146, 18, 39, 115, 182, 53, 159, 243 ));
   
   ------------------------------------------------------------------------
   type ILoopingSelectorItem_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ILoopingSelectorItem : aliased constant Windows.IID := (3331790009, 10182, 17459, (157, 124, 13, 191, 178, 244, 52, 79 ));
   
   ------------------------------------------------------------------------
   type ILoopingSelectorPanel_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ILoopingSelectorPanel : aliased constant Windows.IID := (1084865136, 4113, 18296, (135, 247, 107, 253, 32, 214, 55, 125 ));
   
   ------------------------------------------------------------------------
   type IPivotHeaderItem_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IPivotHeaderItem : aliased constant Windows.IID := (1497723586, 33450, 16651, (158, 85, 253, 142, 44, 152, 134, 45 ));
   
   ------------------------------------------------------------------------
   type IPivotHeaderItemFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IPivotHeaderItemFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.IPivotHeaderItem
   )
   return Windows.HRESULT is abstract;
   
   IID_IPivotHeaderItemFactory : aliased constant Windows.IID := (338725687, 6235, 16663, (188, 119, 221, 162, 235, 38, 27, 153 ));
   
   ------------------------------------------------------------------------
   type IPivotHeaderPanel_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IPivotHeaderPanel : aliased constant Windows.IID := (558386876, 37441, 16899, (189, 55, 108, 8, 251, 9, 102, 18 ));
   
   ------------------------------------------------------------------------
   type IValueConverter_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function Convert
   (
      This       : access IValueConverter_Imported_Interface
      ; value : Windows.Object
      ; targetType : Windows.UI.Xaml.Interop.TypeName
      ; parameter : Windows.Object
      ; language : Windows.String
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function ConvertBack
   (
      This       : access IValueConverter_Imported_Interface
      ; value : Windows.Object
      ; targetType : Windows.UI.Xaml.Interop.TypeName
      ; parameter : Windows.Object
      ; language : Windows.String
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IIterator_IPopup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPopup_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.IPopup
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPopup_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPopup_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPopup_Interface
      ; items : Windows.UI.Xaml.Controls.Primitives.IPopup_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IPopup : aliased constant Windows.IID := (1540032880, 21618, 22248, (177, 132, 208, 31, 184, 30, 64, 138 ));
   
   ------------------------------------------------------------------------
   type IIterable_IPopup_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPopup_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.IIterator_IPopup
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IPopup : aliased constant Windows.IID := (183524585, 15119, 23149, (160, 83, 208, 26, 26, 85, 79, 140 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IPopup_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPopup_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.IPopup
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPopup_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPopup_Interface
      ; value : Windows.UI.Xaml.Controls.Primitives.IPopup
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPopup_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Controls.Primitives.IPopup_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IPopup : aliased constant Windows.IID := (2106171314, 18022, 23102, (179, 108, 152, 134, 188, 188, 70, 99 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type DragCompletedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Controls.Primitives.IDragCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access DragCompletedEventHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access DragCompletedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Controls.Primitives.IDragCompletedEventArgs
   )
   return Windows.HRESULT;
   
   IID_DragCompletedEventHandler : aliased constant Windows.IID := (917670024, 6572, 19278, (145, 55, 166, 207, 43, 2, 56, 131 ));
   
   ------------------------------------------------------------------------
   type DragDeltaEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Controls.Primitives.IDragDeltaEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access DragDeltaEventHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access DragDeltaEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Controls.Primitives.IDragDeltaEventArgs
   )
   return Windows.HRESULT;
   
   IID_DragDeltaEventHandler : aliased constant Windows.IID := (1254248351, 44072, 18921, (145, 137, 220, 207, 254, 182, 100, 114 ));
   
   ------------------------------------------------------------------------
   type DragStartedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Controls.Primitives.IDragStartedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access DragStartedEventHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access DragStartedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Controls.Primitives.IDragStartedEventArgs
   )
   return Windows.HRESULT;
   
   IID_DragStartedEventHandler : aliased constant Windows.IID := (3538855050, 50778, 18781, (162, 241, 114, 198, 105, 137, 20, 45 ));
   
   ------------------------------------------------------------------------
   type ItemsChangedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Controls.Primitives.IItemsChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access ItemsChangedEventHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access ItemsChangedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Controls.Primitives.IItemsChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_ItemsChangedEventHandler : aliased constant Windows.IID := (394418110, 41732, 18479, (139, 240, 185, 210, 227, 150, 18, 163 ));
   
   ------------------------------------------------------------------------
   type RangeBaseValueChangedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Controls.Primitives.IRangeBaseValueChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access RangeBaseValueChangedEventHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access RangeBaseValueChangedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Controls.Primitives.IRangeBaseValueChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_RangeBaseValueChangedEventHandler : aliased constant Windows.IID := (3817893849, 19739, 19144, (164, 60, 195, 185, 8, 116, 39, 153 ));
   
   ------------------------------------------------------------------------
   type ScrollEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Controls.Primitives.IScrollEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access ScrollEventHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access ScrollEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Controls.Primitives.IScrollEventArgs
   )
   return Windows.HRESULT;
   
   IID_ScrollEventHandler : aliased constant Windows.IID := (2288038052, 41859, 19587, (179, 6, 161, 195, 157, 125, 184, 127 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IColorSpectrum_add_ColorChanged_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Primitives.IColorSpectrum ; args : Windows.UI.Xaml.Controls.IColorChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IColorSpectrum_add_ColorChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IColorSpectrum_add_ColorChanged_Interface
      ; sender : Windows.UI.Xaml.Controls.Primitives.IColorSpectrum
      ; args : Windows.UI.Xaml.Controls.IColorChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IColorSpectrum_add_ColorChanged : aliased constant Windows.IID := (1695349257, 28866, 20817, (162, 205, 39, 87, 15, 185, 85, 107 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IFlyoutBase2_add_Closing_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Primitives.IFlyoutBase ; args : Windows.UI.Xaml.Controls.Primitives.IFlyoutBaseClosingEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IFlyoutBase2_add_Closing_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IFlyoutBase2_add_Closing_Interface
      ; sender : Windows.UI.Xaml.Controls.Primitives.IFlyoutBase
      ; args : Windows.UI.Xaml.Controls.Primitives.IFlyoutBaseClosingEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IFlyoutBase2_add_Closing : aliased constant Windows.IID := (2531360700, 30919, 21856, (172, 58, 88, 127, 70, 219, 112, 214 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype ItemsChangedEventArgs is Windows.UI.Xaml.Controls.Primitives.IItemsChangedEventArgs;
   subtype LayoutInformation is Windows.UI.Xaml.Controls.Primitives.ILayoutInformation;
   subtype GeneratorPositionHelper is Windows.UI.Xaml.Controls.Primitives.IGeneratorPositionHelper;
   subtype ProgressRingTemplateSettings is Windows.UI.Xaml.Controls.Primitives.IProgressRingTemplateSettings;
   subtype ToggleSwitchTemplateSettings is Windows.UI.Xaml.Controls.Primitives.IToggleSwitchTemplateSettings;
   subtype ProgressBarTemplateSettings is Windows.UI.Xaml.Controls.Primitives.IProgressBarTemplateSettings;
   subtype SettingsFlyoutTemplateSettings is Windows.UI.Xaml.Controls.Primitives.ISettingsFlyoutTemplateSettings;
   subtype ToolTipTemplateSettings is Windows.UI.Xaml.Controls.Primitives.IToolTipTemplateSettings;
   subtype ComboBoxTemplateSettings is Windows.UI.Xaml.Controls.Primitives.IComboBoxTemplateSettings;
   subtype GridViewItemTemplateSettings is Windows.UI.Xaml.Controls.Primitives.IGridViewItemTemplateSettings;
   subtype ListViewItemTemplateSettings is Windows.UI.Xaml.Controls.Primitives.IListViewItemTemplateSettings;
   subtype MenuFlyoutPresenterTemplateSettings is Windows.UI.Xaml.Controls.Primitives.IMenuFlyoutPresenterTemplateSettings;
   subtype CalendarViewTemplateSettings is Windows.UI.Xaml.Controls.Primitives.ICalendarViewTemplateSettings;
   subtype SplitViewTemplateSettings is Windows.UI.Xaml.Controls.Primitives.ISplitViewTemplateSettings;
   subtype AppBarTemplateSettings is Windows.UI.Xaml.Controls.Primitives.IAppBarTemplateSettings;
   subtype CommandBarTemplateSettings is Windows.UI.Xaml.Controls.Primitives.ICommandBarTemplateSettings;
   subtype DragCompletedEventArgs is Windows.UI.Xaml.Controls.Primitives.IDragCompletedEventArgs;
   
   subtype DragDeltaEventArgs is Windows.UI.Xaml.Controls.Primitives.IDragDeltaEventArgs;
   
   subtype DragStartedEventArgs is Windows.UI.Xaml.Controls.Primitives.IDragStartedEventArgs;
   
   subtype RangeBaseValueChangedEventArgs is Windows.UI.Xaml.Controls.Primitives.IRangeBaseValueChangedEventArgs;
   subtype ScrollEventArgs is Windows.UI.Xaml.Controls.Primitives.IScrollEventArgs;
   
   function CreateScrollEventArgs return Windows.UI.Xaml.Controls.Primitives.IScrollEventArgs;
   
   subtype Popup is Windows.UI.Xaml.Controls.Primitives.IPopup;
   
   function CreatePopup return Windows.UI.Xaml.Controls.Primitives.IPopup;
   
   subtype TickBar is Windows.UI.Xaml.Controls.Primitives.ITickBar;
   
   function CreateTickBar return Windows.UI.Xaml.Controls.Primitives.ITickBar;
   
   subtype CarouselPanel is Windows.UI.Xaml.Controls.Primitives.ICarouselPanel;
   
   type ICarouselPanel_Interface_Impl is new ICarouselPanel_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased ICarouselPanel := null;
      m_ICarouselPanel : ICarouselPanel := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type ICarouselPanel_Impl is access all ICarouselPanel_Interface_Impl'Class;
   type ICarouselPanel_Impl_Ptr is access all ICarouselPanel_Impl;
   
   function QueryInterface
   (
      This       : access ICarouselPanel_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access ICarouselPanel_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access ICarouselPanel_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access ICarouselPanel_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access ICarouselPanel_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access ICarouselPanel_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_CanVerticallyScroll
   (
      This       : access ICarouselPanel_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function put_CanVerticallyScroll
   (
      This       : access ICarouselPanel_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT;
   
   function get_CanHorizontallyScroll
   (
      This       : access ICarouselPanel_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function put_CanHorizontallyScroll
   (
      This       : access ICarouselPanel_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT;
   
   function get_ExtentWidth
   (
      This       : access ICarouselPanel_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function get_ExtentHeight
   (
      This       : access ICarouselPanel_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function get_ViewportWidth
   (
      This       : access ICarouselPanel_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function get_ViewportHeight
   (
      This       : access ICarouselPanel_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function get_HorizontalOffset
   (
      This       : access ICarouselPanel_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function get_VerticalOffset
   (
      This       : access ICarouselPanel_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function get_ScrollOwner
   (
      This       : access ICarouselPanel_Interface_Impl
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT;
   
   function put_ScrollOwner
   (
      This       : access ICarouselPanel_Interface_Impl
      ; value : Windows.Object
   )
   return Windows.HRESULT;
   
   function LineUp
   (
      This       : access ICarouselPanel_Interface_Impl
   )
   return Windows.HRESULT;
   
   function LineDown
   (
      This       : access ICarouselPanel_Interface_Impl
   )
   return Windows.HRESULT;
   
   function LineLeft
   (
      This       : access ICarouselPanel_Interface_Impl
   )
   return Windows.HRESULT;
   
   function LineRight
   (
      This       : access ICarouselPanel_Interface_Impl
   )
   return Windows.HRESULT;
   
   function PageUp
   (
      This       : access ICarouselPanel_Interface_Impl
   )
   return Windows.HRESULT;
   
   function PageDown
   (
      This       : access ICarouselPanel_Interface_Impl
   )
   return Windows.HRESULT;
   
   function PageLeft
   (
      This       : access ICarouselPanel_Interface_Impl
   )
   return Windows.HRESULT;
   
   function PageRight
   (
      This       : access ICarouselPanel_Interface_Impl
   )
   return Windows.HRESULT;
   
   function MouseWheelUp
   (
      This       : access ICarouselPanel_Interface_Impl
   )
   return Windows.HRESULT;
   
   function MouseWheelDown
   (
      This       : access ICarouselPanel_Interface_Impl
   )
   return Windows.HRESULT;
   
   function MouseWheelLeft
   (
      This       : access ICarouselPanel_Interface_Impl
   )
   return Windows.HRESULT;
   
   function MouseWheelRight
   (
      This       : access ICarouselPanel_Interface_Impl
   )
   return Windows.HRESULT;
   
   function SetHorizontalOffset
   (
      This       : access ICarouselPanel_Interface_Impl
      ; offset : Windows.Double
   )
   return Windows.HRESULT;
   
   function SetVerticalOffset
   (
      This       : access ICarouselPanel_Interface_Impl
      ; offset : Windows.Double
   )
   return Windows.HRESULT;
   
   function MakeVisible
   (
      This       : access ICarouselPanel_Interface_Impl
      ; visual : Windows.UI.Xaml.IUIElement
      ; rectangle : Windows.Foundation.Rect
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT;
   
   subtype OrientedVirtualizingPanel is Windows.UI.Xaml.Controls.Primitives.IOrientedVirtualizingPanel;
   
   subtype CalendarPanel is Windows.UI.Xaml.Controls.Primitives.ICalendarPanel;
   
   function CreateCalendarPanel return Windows.UI.Xaml.Controls.Primitives.ICalendarPanel;
   
   subtype GridViewItemPresenter is Windows.UI.Xaml.Controls.Primitives.IGridViewItemPresenter;
   
   type IGridViewItemPresenter_Interface_Impl is new IGridViewItemPresenter_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IGridViewItemPresenter := null;
      m_IGridViewItemPresenter : IGridViewItemPresenter := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IGridViewItemPresenter_Impl is access all IGridViewItemPresenter_Interface_Impl'Class;
   type IGridViewItemPresenter_Impl_Ptr is access all IGridViewItemPresenter_Impl;
   
   function QueryInterface
   (
      This       : access IGridViewItemPresenter_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IGridViewItemPresenter_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IGridViewItemPresenter_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IGridViewItemPresenter_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IGridViewItemPresenter_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IGridViewItemPresenter_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_SelectionCheckMarkVisualEnabled
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function put_SelectionCheckMarkVisualEnabled
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT;
   
   function get_CheckHintBrush
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_CheckHintBrush
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_CheckSelectingBrush
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_CheckSelectingBrush
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_CheckBrush
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_CheckBrush
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_DragBackground
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_DragBackground
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_DragForeground
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_DragForeground
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_FocusBorderBrush
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_FocusBorderBrush
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_PlaceholderBackground
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_PlaceholderBackground
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_PointerOverBackground
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_PointerOverBackground
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_SelectedBackground
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_SelectedBackground
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_SelectedForeground
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_SelectedForeground
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_SelectedPointerOverBackground
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_SelectedPointerOverBackground
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_SelectedPointerOverBorderBrush
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_SelectedPointerOverBorderBrush
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_SelectedBorderThickness
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT;
   
   function put_SelectedBorderThickness
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT;
   
   function get_DisabledOpacity
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_DisabledOpacity
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_DragOpacity
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_DragOpacity
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_ReorderHintOffset
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_ReorderHintOffset
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_GridViewItemPresenterHorizontalContentAlignment
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.HorizontalAlignment
   )
   return Windows.HRESULT;
   
   function put_GridViewItemPresenterHorizontalContentAlignment
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.HorizontalAlignment
   )
   return Windows.HRESULT;
   
   function get_GridViewItemPresenterVerticalContentAlignment
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.VerticalAlignment
   )
   return Windows.HRESULT;
   
   function put_GridViewItemPresenterVerticalContentAlignment
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.VerticalAlignment
   )
   return Windows.HRESULT;
   
   function get_GridViewItemPresenterPadding
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT;
   
   function put_GridViewItemPresenterPadding
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT;
   
   function get_PointerOverBackgroundMargin
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT;
   
   function put_PointerOverBackgroundMargin
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT;
   
   function get_ContentMargin
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT;
   
   function put_ContentMargin
   (
      This       : access IGridViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT;
   
   subtype ListViewItemPresenter is Windows.UI.Xaml.Controls.Primitives.IListViewItemPresenter;
   
   type IListViewItemPresenter_Interface_Impl is new IListViewItemPresenter_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IListViewItemPresenter := null;
      m_IListViewItemPresenter : IListViewItemPresenter := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IListViewItemPresenter_Impl is access all IListViewItemPresenter_Interface_Impl'Class;
   type IListViewItemPresenter_Impl_Ptr is access all IListViewItemPresenter_Impl;
   
   function QueryInterface
   (
      This       : access IListViewItemPresenter_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IListViewItemPresenter_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IListViewItemPresenter_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IListViewItemPresenter_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IListViewItemPresenter_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IListViewItemPresenter_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_SelectionCheckMarkVisualEnabled
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function put_SelectionCheckMarkVisualEnabled
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT;
   
   function get_CheckHintBrush
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_CheckHintBrush
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_CheckSelectingBrush
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_CheckSelectingBrush
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_CheckBrush
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_CheckBrush
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_DragBackground
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_DragBackground
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_DragForeground
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_DragForeground
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_FocusBorderBrush
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_FocusBorderBrush
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_PlaceholderBackground
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_PlaceholderBackground
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_PointerOverBackground
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_PointerOverBackground
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_SelectedBackground
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_SelectedBackground
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_SelectedForeground
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_SelectedForeground
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_SelectedPointerOverBackground
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_SelectedPointerOverBackground
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_SelectedPointerOverBorderBrush
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_SelectedPointerOverBorderBrush
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_SelectedBorderThickness
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT;
   
   function put_SelectedBorderThickness
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT;
   
   function get_DisabledOpacity
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_DisabledOpacity
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_DragOpacity
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_DragOpacity
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_ReorderHintOffset
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_ReorderHintOffset
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_ListViewItemPresenterHorizontalContentAlignment
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.HorizontalAlignment
   )
   return Windows.HRESULT;
   
   function put_ListViewItemPresenterHorizontalContentAlignment
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.HorizontalAlignment
   )
   return Windows.HRESULT;
   
   function get_ListViewItemPresenterVerticalContentAlignment
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.VerticalAlignment
   )
   return Windows.HRESULT;
   
   function put_ListViewItemPresenterVerticalContentAlignment
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.VerticalAlignment
   )
   return Windows.HRESULT;
   
   function get_ListViewItemPresenterPadding
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT;
   
   function put_ListViewItemPresenterPadding
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT;
   
   function get_PointerOverBackgroundMargin
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT;
   
   function put_PointerOverBackgroundMargin
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT;
   
   function get_ContentMargin
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT;
   
   function put_ContentMargin
   (
      This       : access IListViewItemPresenter_Interface_Impl
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT;
   
   subtype ColorSpectrum is Windows.UI.Xaml.Controls.Primitives.IColorSpectrum;
   
   type IColorSpectrum_Interface_Impl is new IColorSpectrum_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IColorSpectrum := null;
      m_IColorSpectrum : IColorSpectrum := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IColorSpectrum_Impl is access all IColorSpectrum_Interface_Impl'Class;
   type IColorSpectrum_Impl_Ptr is access all IColorSpectrum_Impl;
   
   function QueryInterface
   (
      This       : access IColorSpectrum_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IColorSpectrum_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IColorSpectrum_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IColorSpectrum_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IColorSpectrum_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IColorSpectrum_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_Color
   (
      This       : access IColorSpectrum_Interface_Impl
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT;
   
   function put_Color
   (
      This       : access IColorSpectrum_Interface_Impl
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT;
   
   function get_HsvColor
   (
      This       : access IColorSpectrum_Interface_Impl
      ; RetVal : access Windows.Foundation.Numerics.Vector4
   )
   return Windows.HRESULT;
   
   function put_HsvColor
   (
      This       : access IColorSpectrum_Interface_Impl
      ; value : Windows.Foundation.Numerics.Vector4
   )
   return Windows.HRESULT;
   
   function get_MinHue
   (
      This       : access IColorSpectrum_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT;
   
   function put_MinHue
   (
      This       : access IColorSpectrum_Interface_Impl
      ; value : Windows.Int32
   )
   return Windows.HRESULT;
   
   function get_MaxHue
   (
      This       : access IColorSpectrum_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT;
   
   function put_MaxHue
   (
      This       : access IColorSpectrum_Interface_Impl
      ; value : Windows.Int32
   )
   return Windows.HRESULT;
   
   function get_MinSaturation
   (
      This       : access IColorSpectrum_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT;
   
   function put_MinSaturation
   (
      This       : access IColorSpectrum_Interface_Impl
      ; value : Windows.Int32
   )
   return Windows.HRESULT;
   
   function get_MaxSaturation
   (
      This       : access IColorSpectrum_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT;
   
   function put_MaxSaturation
   (
      This       : access IColorSpectrum_Interface_Impl
      ; value : Windows.Int32
   )
   return Windows.HRESULT;
   
   function get_MinValue
   (
      This       : access IColorSpectrum_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT;
   
   function put_MinValue
   (
      This       : access IColorSpectrum_Interface_Impl
      ; value : Windows.Int32
   )
   return Windows.HRESULT;
   
   function get_MaxValue
   (
      This       : access IColorSpectrum_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT;
   
   function put_MaxValue
   (
      This       : access IColorSpectrum_Interface_Impl
      ; value : Windows.Int32
   )
   return Windows.HRESULT;
   
   function get_Shape
   (
      This       : access IColorSpectrum_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Controls.ColorSpectrumShape
   )
   return Windows.HRESULT;
   
   function put_Shape
   (
      This       : access IColorSpectrum_Interface_Impl
      ; value : Windows.UI.Xaml.Controls.ColorSpectrumShape
   )
   return Windows.HRESULT;
   
   function get_Components
   (
      This       : access IColorSpectrum_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Controls.ColorSpectrumComponents
   )
   return Windows.HRESULT;
   
   function put_Components
   (
      This       : access IColorSpectrum_Interface_Impl
      ; value : Windows.UI.Xaml.Controls.ColorSpectrumComponents
   )
   return Windows.HRESULT;
   
   function add_ColorChanged
   (
      This       : access IColorSpectrum_Interface_Impl
      ; value : TypedEventHandler_IColorSpectrum_add_ColorChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_ColorChanged
   (
      This       : access IColorSpectrum_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   subtype SelectorItem is Windows.UI.Xaml.Controls.Primitives.ISelectorItem;
   
   type ISelectorItem_Interface_Impl is new ISelectorItem_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased ISelectorItem := null;
      m_ISelectorItem : ISelectorItem := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type ISelectorItem_Impl is access all ISelectorItem_Interface_Impl'Class;
   type ISelectorItem_Impl_Ptr is access all ISelectorItem_Impl;
   
   function QueryInterface
   (
      This       : access ISelectorItem_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access ISelectorItem_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access ISelectorItem_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access ISelectorItem_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access ISelectorItem_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access ISelectorItem_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_IsSelected
   (
      This       : access ISelectorItem_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function put_IsSelected
   (
      This       : access ISelectorItem_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT;
   
   subtype RangeBase is Windows.UI.Xaml.Controls.Primitives.IRangeBase;
   
   type IRangeBaseOverrides_Interface_Impl is new IRangeBaseOverrides_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IRangeBaseOverrides := null;
      m_IRangeBase : IRangeBase := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IRangeBaseOverrides_Impl is access all IRangeBaseOverrides_Interface_Impl'Class;
   type IRangeBaseOverrides_Impl_Ptr is access all IRangeBaseOverrides_Impl;
   
   function QueryInterface
   (
      This       : access IRangeBaseOverrides_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IRangeBaseOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IRangeBaseOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IRangeBaseOverrides_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IRangeBaseOverrides_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IRangeBaseOverrides_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function OnMinimumChanged
   (
      This       : access IRangeBaseOverrides_Interface_Impl
      ; oldMinimum : Windows.Double
      ; newMinimum : Windows.Double
   )
   return Windows.HRESULT;
   
   function OnMaximumChanged
   (
      This       : access IRangeBaseOverrides_Interface_Impl
      ; oldMaximum : Windows.Double
      ; newMaximum : Windows.Double
   )
   return Windows.HRESULT;
   
   function OnValueChanged
   (
      This       : access IRangeBaseOverrides_Interface_Impl
      ; oldValue : Windows.Double
      ; newValue : Windows.Double
   )
   return Windows.HRESULT;
   
   type IRangeBase_Interface_Impl is new IRangeBase_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IRangeBase := null;
      m_IRangeBase : IRangeBase := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IRangeBase_Impl is access all IRangeBase_Interface_Impl'Class;
   type IRangeBase_Impl_Ptr is access all IRangeBase_Impl;
   
   function QueryInterface
   (
      This       : access IRangeBase_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IRangeBase_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IRangeBase_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IRangeBase_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IRangeBase_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IRangeBase_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_Minimum
   (
      This       : access IRangeBase_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_Minimum
   (
      This       : access IRangeBase_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_Maximum
   (
      This       : access IRangeBase_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_Maximum
   (
      This       : access IRangeBase_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_SmallChange
   (
      This       : access IRangeBase_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_SmallChange
   (
      This       : access IRangeBase_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_LargeChange
   (
      This       : access IRangeBase_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_LargeChange
   (
      This       : access IRangeBase_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_Value
   (
      This       : access IRangeBase_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_Value
   (
      This       : access IRangeBase_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function add_ValueChanged
   (
      This       : access IRangeBase_Interface_Impl
      ; value : Windows.UI.Xaml.Controls.Primitives.RangeBaseValueChangedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_ValueChanged
   (
      This       : access IRangeBase_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   subtype ColorPickerSlider is Windows.UI.Xaml.Controls.Primitives.IColorPickerSlider;
   
   type IColorPickerSlider_Interface_Impl is new IColorPickerSlider_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IColorPickerSlider := null;
      m_IColorPickerSlider : IColorPickerSlider := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IColorPickerSlider_Impl is access all IColorPickerSlider_Interface_Impl'Class;
   type IColorPickerSlider_Impl_Ptr is access all IColorPickerSlider_Impl;
   
   function QueryInterface
   (
      This       : access IColorPickerSlider_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IColorPickerSlider_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IColorPickerSlider_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IColorPickerSlider_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IColorPickerSlider_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IColorPickerSlider_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_ColorChannel
   (
      This       : access IColorPickerSlider_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Controls.ColorPickerHsvChannel
   )
   return Windows.HRESULT;
   
   function put_ColorChannel
   (
      This       : access IColorPickerSlider_Interface_Impl
      ; value : Windows.UI.Xaml.Controls.ColorPickerHsvChannel
   )
   return Windows.HRESULT;
   
   subtype Thumb is Windows.UI.Xaml.Controls.Primitives.IThumb;
   
   function CreateThumb return Windows.UI.Xaml.Controls.Primitives.IThumb;
   
   subtype ButtonBase is Windows.UI.Xaml.Controls.Primitives.IButtonBase;
   
   type IButtonBase_Interface_Impl is new IButtonBase_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IButtonBase := null;
      m_IButtonBase : IButtonBase := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IButtonBase_Impl is access all IButtonBase_Interface_Impl'Class;
   type IButtonBase_Impl_Ptr is access all IButtonBase_Impl;
   
   function QueryInterface
   (
      This       : access IButtonBase_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IButtonBase_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IButtonBase_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IButtonBase_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IButtonBase_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IButtonBase_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_ClickMode
   (
      This       : access IButtonBase_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Controls.ClickMode
   )
   return Windows.HRESULT;
   
   function put_ClickMode
   (
      This       : access IButtonBase_Interface_Impl
      ; value : Windows.UI.Xaml.Controls.ClickMode
   )
   return Windows.HRESULT;
   
   function get_IsPointerOver
   (
      This       : access IButtonBase_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function get_IsPressed
   (
      This       : access IButtonBase_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function get_Command
   (
      This       : access IButtonBase_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Input.ICommand
   )
   return Windows.HRESULT;
   
   function put_Command
   (
      This       : access IButtonBase_Interface_Impl
      ; value : Windows.UI.Xaml.Input.ICommand
   )
   return Windows.HRESULT;
   
   function get_CommandParameter
   (
      This       : access IButtonBase_Interface_Impl
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT;
   
   function put_CommandParameter
   (
      This       : access IButtonBase_Interface_Impl
      ; value : Windows.Object
   )
   return Windows.HRESULT;
   
   function add_Click
   (
      This       : access IButtonBase_Interface_Impl
      ; value : Windows.UI.Xaml.RoutedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_Click
   (
      This       : access IButtonBase_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   subtype ScrollBar is Windows.UI.Xaml.Controls.Primitives.IScrollBar;
   
   function CreateScrollBar return Windows.UI.Xaml.Controls.Primitives.IScrollBar;
   
   subtype Selector is Windows.UI.Xaml.Controls.Primitives.ISelector;
   
   subtype RepeatButton is Windows.UI.Xaml.Controls.Primitives.IRepeatButton;
   
   function CreateRepeatButton return Windows.UI.Xaml.Controls.Primitives.IRepeatButton;
   
   subtype ToggleButton is Windows.UI.Xaml.Controls.Primitives.IToggleButton;
   
   type IToggleButtonOverrides_Interface_Impl is new IToggleButtonOverrides_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IToggleButtonOverrides := null;
      m_IToggleButton : IToggleButton := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IToggleButtonOverrides_Impl is access all IToggleButtonOverrides_Interface_Impl'Class;
   type IToggleButtonOverrides_Impl_Ptr is access all IToggleButtonOverrides_Impl;
   
   function QueryInterface
   (
      This       : access IToggleButtonOverrides_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IToggleButtonOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IToggleButtonOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IToggleButtonOverrides_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IToggleButtonOverrides_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IToggleButtonOverrides_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function OnToggle
   (
      This       : access IToggleButtonOverrides_Interface_Impl
   )
   return Windows.HRESULT;
   
   type IToggleButton_Interface_Impl is new IToggleButton_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IToggleButton := null;
      m_IToggleButton : IToggleButton := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IToggleButton_Impl is access all IToggleButton_Interface_Impl'Class;
   type IToggleButton_Impl_Ptr is access all IToggleButton_Impl;
   
   function QueryInterface
   (
      This       : access IToggleButton_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IToggleButton_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IToggleButton_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IToggleButton_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IToggleButton_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IToggleButton_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_IsChecked
   (
      This       : access IToggleButton_Interface_Impl
      ; RetVal : access Windows.Foundation.IReference_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT;
   
   function put_IsChecked
   (
      This       : access IToggleButton_Interface_Impl
      ; value : Windows.Foundation.IReference_Boolean
   )
   return Windows.HRESULT;
   
   function get_IsThreeState
   (
      This       : access IToggleButton_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function put_IsThreeState
   (
      This       : access IToggleButton_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT;
   
   function add_Checked
   (
      This       : access IToggleButton_Interface_Impl
      ; value : Windows.UI.Xaml.RoutedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_Checked
   (
      This       : access IToggleButton_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function add_Unchecked
   (
      This       : access IToggleButton_Interface_Impl
      ; value : Windows.UI.Xaml.RoutedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_Unchecked
   (
      This       : access IToggleButton_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function add_Indeterminate
   (
      This       : access IToggleButton_Interface_Impl
      ; value : Windows.UI.Xaml.RoutedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_Indeterminate
   (
      This       : access IToggleButton_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   subtype FlyoutBaseClosingEventArgs is Windows.UI.Xaml.Controls.Primitives.IFlyoutBaseClosingEventArgs;
   subtype FlyoutBase is Windows.UI.Xaml.Controls.Primitives.IFlyoutBase;
   
   type IFlyoutBaseOverrides_Interface_Impl is new IFlyoutBaseOverrides_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IFlyoutBaseOverrides := null;
      m_IFlyoutBase : IFlyoutBase := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IFlyoutBaseOverrides_Impl is access all IFlyoutBaseOverrides_Interface_Impl'Class;
   type IFlyoutBaseOverrides_Impl_Ptr is access all IFlyoutBaseOverrides_Impl;
   
   function QueryInterface
   (
      This       : access IFlyoutBaseOverrides_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IFlyoutBaseOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IFlyoutBaseOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IFlyoutBaseOverrides_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IFlyoutBaseOverrides_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IFlyoutBaseOverrides_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function CreatePresenter
   (
      This       : access IFlyoutBaseOverrides_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Controls.IControl
   )
   return Windows.HRESULT;
   
   type IFlyoutBase_Interface_Impl is new IFlyoutBase_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IFlyoutBase := null;
      m_IFlyoutBase : IFlyoutBase := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IFlyoutBase_Impl is access all IFlyoutBase_Interface_Impl'Class;
   type IFlyoutBase_Impl_Ptr is access all IFlyoutBase_Impl;
   
   function QueryInterface
   (
      This       : access IFlyoutBase_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IFlyoutBase_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IFlyoutBase_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IFlyoutBase_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IFlyoutBase_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IFlyoutBase_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_Placement
   (
      This       : access IFlyoutBase_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.FlyoutPlacementMode
   )
   return Windows.HRESULT;
   
   function put_Placement
   (
      This       : access IFlyoutBase_Interface_Impl
      ; value : Windows.UI.Xaml.Controls.Primitives.FlyoutPlacementMode
   )
   return Windows.HRESULT;
   
   function add_Opened
   (
      This       : access IFlyoutBase_Interface_Impl
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_Opened
   (
      This       : access IFlyoutBase_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function add_Closed
   (
      This       : access IFlyoutBase_Interface_Impl
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_Closed
   (
      This       : access IFlyoutBase_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function add_Opening
   (
      This       : access IFlyoutBase_Interface_Impl
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_Opening
   (
      This       : access IFlyoutBase_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function ShowAt
   (
      This       : access IFlyoutBase_Interface_Impl
      ; placementTarget : Windows.UI.Xaml.IFrameworkElement
   )
   return Windows.HRESULT;
   
   function Hide
   (
      This       : access IFlyoutBase_Interface_Impl
   )
   return Windows.HRESULT;
   
   subtype JumpListItemBackgroundConverter is Windows.UI.Xaml.Controls.Primitives.IJumpListItemBackgroundConverter;
   
   function CreateJumpListItemBackgroundConverter return Windows.UI.Xaml.Controls.Primitives.IJumpListItemBackgroundConverter;
   
   subtype JumpListItemForegroundConverter is Windows.UI.Xaml.Controls.Primitives.IJumpListItemForegroundConverter;
   
   function CreateJumpListItemForegroundConverter return Windows.UI.Xaml.Controls.Primitives.IJumpListItemForegroundConverter;
   
   subtype PickerFlyoutBase is Windows.UI.Xaml.Controls.Primitives.IPickerFlyoutBase;
   
   type IPickerFlyoutBaseOverrides_Interface_Impl is new IPickerFlyoutBaseOverrides_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IPickerFlyoutBaseOverrides := null;
      m_IPickerFlyoutBase : IPickerFlyoutBase := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IPickerFlyoutBaseOverrides_Impl is access all IPickerFlyoutBaseOverrides_Interface_Impl'Class;
   type IPickerFlyoutBaseOverrides_Impl_Ptr is access all IPickerFlyoutBaseOverrides_Impl;
   
   function QueryInterface
   (
      This       : access IPickerFlyoutBaseOverrides_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IPickerFlyoutBaseOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IPickerFlyoutBaseOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IPickerFlyoutBaseOverrides_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IPickerFlyoutBaseOverrides_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IPickerFlyoutBaseOverrides_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function OnConfirmed
   (
      This       : access IPickerFlyoutBaseOverrides_Interface_Impl
   )
   return Windows.HRESULT;
   
   function ShouldShowConfirmationButtons
   (
      This       : access IPickerFlyoutBaseOverrides_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   type IPickerFlyoutBase_Interface_Impl is new IPickerFlyoutBase_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IPickerFlyoutBase := null;
      m_IPickerFlyoutBase : IPickerFlyoutBase := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IPickerFlyoutBase_Impl is access all IPickerFlyoutBase_Interface_Impl'Class;
   type IPickerFlyoutBase_Impl_Ptr is access all IPickerFlyoutBase_Impl;
   
   function QueryInterface
   (
      This       : access IPickerFlyoutBase_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IPickerFlyoutBase_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IPickerFlyoutBase_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IPickerFlyoutBase_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IPickerFlyoutBase_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IPickerFlyoutBase_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   subtype LoopingSelector is Windows.UI.Xaml.Controls.Primitives.ILoopingSelector;
   subtype PivotPanel is Windows.UI.Xaml.Controls.Primitives.IPivotPanel;
   
   function CreatePivotPanel return Windows.UI.Xaml.Controls.Primitives.IPivotPanel;
   
   subtype LoopingSelectorItem is Windows.UI.Xaml.Controls.Primitives.ILoopingSelectorItem;
   subtype LoopingSelectorPanel is Windows.UI.Xaml.Controls.Primitives.ILoopingSelectorPanel;
   subtype PivotHeaderItem is Windows.UI.Xaml.Controls.Primitives.IPivotHeaderItem;
   
   type IPivotHeaderItem_Interface_Impl is new IPivotHeaderItem_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IPivotHeaderItem := null;
      m_IPivotHeaderItem : IPivotHeaderItem := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IPivotHeaderItem_Impl is access all IPivotHeaderItem_Interface_Impl'Class;
   type IPivotHeaderItem_Impl_Ptr is access all IPivotHeaderItem_Impl;
   
   function QueryInterface
   (
      This       : access IPivotHeaderItem_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IPivotHeaderItem_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IPivotHeaderItem_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IPivotHeaderItem_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IPivotHeaderItem_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IPivotHeaderItem_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   subtype PivotHeaderPanel is Windows.UI.Xaml.Controls.Primitives.IPivotHeaderPanel;
   
   function CreatePivotHeaderPanel return Windows.UI.Xaml.Controls.Primitives.IPivotHeaderPanel;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetLayoutExceptionElement
   (
      dispatcher : Windows.Object
   )
   return Windows.UI.Xaml.IUIElement;
   
   function GetLayoutSlot
   (
      element : Windows.UI.Xaml.IFrameworkElement
   )
   return Windows.Foundation.Rect;
   
   function GetAvailableSize
   (
      element : Windows.UI.Xaml.IUIElement
   )
   return Windows.Foundation.Size;
   
   function FromIndexAndOffset
   (
      index : Windows.Int32
      ; offset : Windows.Int32
   )
   return Windows.UI.Xaml.Controls.Primitives.GeneratorPosition;
   
   function CreateInstanceWithHorizontalChangeVerticalChangeAndCanceled
   (
      horizontalChange : Windows.Double
      ; verticalChange : Windows.Double
      ; canceled : Windows.Boolean
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Primitives.IDragCompletedEventArgs;
   
   function CreateInstanceWithHorizontalChangeAndVerticalChange
   (
      horizontalChange : Windows.Double
      ; verticalChange : Windows.Double
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Primitives.IDragDeltaEventArgs;
   
   function CreateInstanceWithHorizontalOffsetAndVerticalOffset
   (
      horizontalOffset : Windows.Double
      ; verticalOffset : Windows.Double
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Primitives.IDragStartedEventArgs;
   
   function get_LightDismissOverlayModeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ChildProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsOpenProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_HorizontalOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_VerticalOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ChildTransitionsProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsLightDismissEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FillProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Primitives.ICarouselPanel;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Primitives.IGridViewItemPresenter;
   
   function get_SelectionCheckMarkVisualEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CheckHintBrushProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CheckSelectingBrushProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CheckBrushProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_DragBackgroundProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_DragForegroundProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FocusBorderBrushProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PlaceholderBackgroundProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PointerOverBackgroundProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SelectedBackgroundProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SelectedForegroundProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SelectedPointerOverBackgroundProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SelectedPointerOverBorderBrushProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SelectedBorderThicknessProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_DisabledOpacityProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_DragOpacityProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ReorderHintOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_GridViewItemPresenterHorizontalContentAlignmentProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_GridViewItemPresenterVerticalContentAlignmentProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_GridViewItemPresenterPaddingProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PointerOverBackgroundMarginProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ContentMarginProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Primitives.IListViewItemPresenter;
   
   function get_SelectedPressedBackgroundProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PressedBackgroundProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CheckBoxBrushProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FocusSecondaryBorderBrushProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CheckModeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PointerOverForegroundProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RevealBackgroundProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RevealBorderBrushProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RevealBorderThicknessProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RevealBackgroundShowsAboveContentProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SelectionCheckMarkVisualEnabledProperty_IListViewItemPresenter
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CheckHintBrushProperty_IListViewItemPresenter
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CheckSelectingBrushProperty_IListViewItemPresenter
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CheckBrushProperty_IListViewItemPresenter
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_DragBackgroundProperty_IListViewItemPresenter
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_DragForegroundProperty_IListViewItemPresenter
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FocusBorderBrushProperty_IListViewItemPresenter
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PlaceholderBackgroundProperty_IListViewItemPresenter
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PointerOverBackgroundProperty_IListViewItemPresenter
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SelectedBackgroundProperty_IListViewItemPresenter
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SelectedForegroundProperty_IListViewItemPresenter
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SelectedPointerOverBackgroundProperty_IListViewItemPresenter
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SelectedPointerOverBorderBrushProperty_IListViewItemPresenter
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SelectedBorderThicknessProperty_IListViewItemPresenter
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_DisabledOpacityProperty_IListViewItemPresenter
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_DragOpacityProperty_IListViewItemPresenter
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ReorderHintOffsetProperty_IListViewItemPresenter
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ListViewItemPresenterHorizontalContentAlignmentProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ListViewItemPresenterVerticalContentAlignmentProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ListViewItemPresenterPaddingProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PointerOverBackgroundMarginProperty_IListViewItemPresenter
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ContentMarginProperty_IListViewItemPresenter
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ColorProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_HsvColorProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_MinHueProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_MaxHueProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_MinSaturationProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_MaxSaturationProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_MinValueProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_MaxValueProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ShapeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ComponentsProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Primitives.IColorSpectrum;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Primitives.ISelectorItem;
   
   function get_IsSelectedProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Primitives.IRangeBase;
   
   function get_MinimumProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_MaximumProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SmallChangeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_LargeChangeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ValueProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ColorChannelProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Primitives.IColorPickerSlider;
   
   function get_IsDraggingProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ClickModeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsPointerOverProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsPressedProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CommandProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CommandParameterProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Primitives.IButtonBase;
   
   function get_OrientationProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ViewportSizeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IndicatorModeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SelectedIndexProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SelectedItemProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SelectedValueProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SelectedValuePathProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsSynchronizedWithCurrentItemProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetIsSelectionActive
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   function get_DelayProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IntervalProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsCheckedProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsThreeStateProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Primitives.IToggleButton;
   
   function get_PlacementProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_AttachedFlyoutProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetAttachedFlyout
   (
      element : Windows.UI.Xaml.IFrameworkElement
   )
   return Windows.UI.Xaml.Controls.Primitives.IFlyoutBase;
   
   procedure SetAttachedFlyout
   (
      element : Windows.UI.Xaml.IFrameworkElement
      ; value : Windows.UI.Xaml.Controls.Primitives.IFlyoutBase
   )
   ;
   
   procedure ShowAttachedFlyout
   (
      flyoutOwner : Windows.UI.Xaml.IFrameworkElement
   )
   ;
   
   function get_OverlayInputPassThroughElementProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_AllowFocusOnInteractionProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_LightDismissOverlayModeProperty_IFlyoutBase
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_AllowFocusWhenDisabledProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ElementSoundModeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Primitives.IFlyoutBase;
   
   function get_EnabledProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_DisabledProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_EnabledProperty_IJumpListItemForegroundConverter
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_DisabledProperty_IJumpListItemForegroundConverter
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Primitives.IPickerFlyoutBase;
   
   function get_TitleProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetTitle
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.String;
   
   procedure SetTitle
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   ;
   
   function get_ShouldLoopProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ItemsProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SelectedIndexProperty_ILoopingSelector
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SelectedItemProperty_ILoopingSelector
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ItemWidthProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ItemHeightProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ItemTemplateProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Primitives.IPivotHeaderItem;

end;
