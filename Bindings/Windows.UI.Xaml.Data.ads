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
with Windows.Foundation.Collections;
limited with Windows.UI.Xaml.Interop;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.UI.Xaml.Data is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type BindingMode is (
      OneWay,
      OneTime,
      TwoWay
   );
   for BindingMode use (
      OneWay => 1,
      OneTime => 2,
      TwoWay => 3
   );
   for BindingMode'Size use 32;
   
   type BindingMode_Ptr is access BindingMode;
   
   type RelativeSourceMode is (
      None,
      TemplatedParent,
      Self
   );
   for RelativeSourceMode use (
      None => 0,
      TemplatedParent => 1,
      Self => 2
   );
   for RelativeSourceMode'Size use 32;
   
   type RelativeSourceMode_Ptr is access RelativeSourceMode;
   
   type UpdateSourceTrigger is (
      Default,
      PropertyChanged,
      Explicit,
      LostFocus
   );
   for UpdateSourceTrigger use (
      Default => 0,
      PropertyChanged => 1,
      Explicit => 2,
      LostFocus => 3
   );
   for UpdateSourceTrigger'Size use 32;
   
   type UpdateSourceTrigger_Ptr is access UpdateSourceTrigger;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type LoadMoreItemsResult is record
      Count : Windows.UInt32;
   end record;
   pragma Convention (C_Pass_By_Copy , LoadMoreItemsResult);
   
   type LoadMoreItemsResult_Ptr is access LoadMoreItemsResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type CurrentChangingEventHandler_Interface;
   type CurrentChangingEventHandler is access all CurrentChangingEventHandler_Interface'Class;
   type CurrentChangingEventHandler_Ptr is access all CurrentChangingEventHandler;
   type PropertyChangedEventHandler_Interface;
   type PropertyChangedEventHandler is access all PropertyChangedEventHandler_Interface'Class;
   type PropertyChangedEventHandler_Ptr is access all PropertyChangedEventHandler;
   type AsyncOperationCompletedHandler_LoadMoreItemsResult_Interface;
   type AsyncOperationCompletedHandler_LoadMoreItemsResult is access all AsyncOperationCompletedHandler_LoadMoreItemsResult_Interface'Class;
   type AsyncOperationCompletedHandler_LoadMoreItemsResult_Ptr is access all AsyncOperationCompletedHandler_LoadMoreItemsResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IItemsRangeInfo_Interface;
   type IItemsRangeInfo is access all IItemsRangeInfo_Interface'Class;
   type IItemsRangeInfo_Ptr is access all IItemsRangeInfo;
   type ISelectionInfo_Interface;
   type ISelectionInfo is access all ISelectionInfo_Interface'Class;
   type ISelectionInfo_Ptr is access all ISelectionInfo;
   type ICustomProperty_Interface;
   type ICustomProperty is access all ICustomProperty_Interface'Class;
   type ICustomProperty_Ptr is access all ICustomProperty;
   type ICustomPropertyProvider_Interface;
   type ICustomPropertyProvider is access all ICustomPropertyProvider_Interface'Class;
   type ICustomPropertyProvider_Ptr is access all ICustomPropertyProvider;
   type INotifyPropertyChanged_Interface;
   type INotifyPropertyChanged is access all INotifyPropertyChanged_Interface'Class;
   type INotifyPropertyChanged_Ptr is access all INotifyPropertyChanged;
   type ISupportIncrementalLoading_Interface;
   type ISupportIncrementalLoading is access all ISupportIncrementalLoading_Interface'Class;
   type ISupportIncrementalLoading_Ptr is access all ISupportIncrementalLoading;
   type IValueConverter_Interface;
   type IValueConverter is access all IValueConverter_Interface'Class;
   type IValueConverter_Ptr is access all IValueConverter;
   type IBindingExpressionBase_Interface;
   type IBindingExpressionBase is access all IBindingExpressionBase_Interface'Class;
   type IBindingExpressionBase_Ptr is access all IBindingExpressionBase;
   type IBindingExpressionBaseFactory_Interface;
   type IBindingExpressionBaseFactory is access all IBindingExpressionBaseFactory_Interface'Class;
   type IBindingExpressionBaseFactory_Ptr is access all IBindingExpressionBaseFactory;
   type IBindingOperations_Interface;
   type IBindingOperations is access all IBindingOperations_Interface'Class;
   type IBindingOperations_Ptr is access all IBindingOperations;
   type IBindingOperationsStatics_Interface;
   type IBindingOperationsStatics is access all IBindingOperationsStatics_Interface'Class;
   type IBindingOperationsStatics_Ptr is access all IBindingOperationsStatics;
   type ICurrentChangingEventArgs_Interface;
   type ICurrentChangingEventArgs is access all ICurrentChangingEventArgs_Interface'Class;
   type ICurrentChangingEventArgs_Ptr is access all ICurrentChangingEventArgs;
   type ICurrentChangingEventArgsFactory_Interface;
   type ICurrentChangingEventArgsFactory is access all ICurrentChangingEventArgsFactory_Interface'Class;
   type ICurrentChangingEventArgsFactory_Ptr is access all ICurrentChangingEventArgsFactory;
   type IPropertyChangedEventArgs_Interface;
   type IPropertyChangedEventArgs is access all IPropertyChangedEventArgs_Interface'Class;
   type IPropertyChangedEventArgs_Ptr is access all IPropertyChangedEventArgs;
   type IPropertyChangedEventArgsFactory_Interface;
   type IPropertyChangedEventArgsFactory is access all IPropertyChangedEventArgsFactory_Interface'Class;
   type IPropertyChangedEventArgsFactory_Ptr is access all IPropertyChangedEventArgsFactory;
   type IBindingBase_Interface;
   type IBindingBase is access all IBindingBase_Interface'Class;
   type IBindingBase_Ptr is access all IBindingBase;
   type IBindingBaseFactory_Interface;
   type IBindingBaseFactory is access all IBindingBaseFactory_Interface'Class;
   type IBindingBaseFactory_Ptr is access all IBindingBaseFactory;
   type IBindingExpression_Interface;
   type IBindingExpression is access all IBindingExpression_Interface'Class;
   type IBindingExpression_Ptr is access all IBindingExpression;
   type IBindingExpressionFactory_Interface;
   type IBindingExpressionFactory is access all IBindingExpressionFactory_Interface'Class;
   type IBindingExpressionFactory_Ptr is access all IBindingExpressionFactory;
   type IRelativeSource_Interface;
   type IRelativeSource is access all IRelativeSource_Interface'Class;
   type IRelativeSource_Ptr is access all IRelativeSource;
   type IRelativeSourceFactory_Interface;
   type IRelativeSourceFactory is access all IRelativeSourceFactory_Interface'Class;
   type IRelativeSourceFactory_Ptr is access all IRelativeSourceFactory;
   type IBinding_Interface;
   type IBinding is access all IBinding_Interface'Class;
   type IBinding_Ptr is access all IBinding;
   type IBindingFactory_Interface;
   type IBindingFactory is access all IBindingFactory_Interface'Class;
   type IBindingFactory_Ptr is access all IBindingFactory;
   type IBinding2_Interface;
   type IBinding2 is access all IBinding2_Interface'Class;
   type IBinding2_Ptr is access all IBinding2;
   type ICollectionView_Interface;
   type ICollectionView is access all ICollectionView_Interface'Class;
   type ICollectionView_Ptr is access all ICollectionView;
   type ICollectionViewFactory_Interface;
   type ICollectionViewFactory is access all ICollectionViewFactory_Interface'Class;
   type ICollectionViewFactory_Ptr is access all ICollectionViewFactory;
   type ICollectionViewGroup_Interface;
   type ICollectionViewGroup is access all ICollectionViewGroup_Interface'Class;
   type ICollectionViewGroup_Ptr is access all ICollectionViewGroup;
   type IItemIndexRange_Interface;
   type IItemIndexRange is access all IItemIndexRange_Interface'Class;
   type IItemIndexRange_Ptr is access all IItemIndexRange;
   type IItemIndexRangeFactory_Interface;
   type IItemIndexRangeFactory is access all IItemIndexRangeFactory_Interface'Class;
   type IItemIndexRangeFactory_Ptr is access all IItemIndexRangeFactory;
   type ICollectionViewSource_Interface;
   type ICollectionViewSource is access all ICollectionViewSource_Interface'Class;
   type ICollectionViewSource_Ptr is access all ICollectionViewSource;
   type ICollectionViewSourceStatics_Interface;
   type ICollectionViewSourceStatics is access all ICollectionViewSourceStatics_Interface'Class;
   type ICollectionViewSourceStatics_Ptr is access all ICollectionViewSourceStatics;
   type IAsyncOperation_LoadMoreItemsResult_Interface;
   type IAsyncOperation_LoadMoreItemsResult is access all IAsyncOperation_LoadMoreItemsResult_Interface'Class;
   type IAsyncOperation_LoadMoreItemsResult_Ptr is access all IAsyncOperation_LoadMoreItemsResult;
   type IIterator_IItemIndexRange_Interface;
   type IIterator_IItemIndexRange is access all IIterator_IItemIndexRange_Interface'Class;
   type IIterator_IItemIndexRange_Ptr is access all IIterator_IItemIndexRange;
   type IIterable_IItemIndexRange_Interface;
   type IIterable_IItemIndexRange is access all IIterable_IItemIndexRange_Interface'Class;
   type IIterable_IItemIndexRange_Ptr is access all IIterable_IItemIndexRange;
   type IVectorView_IItemIndexRange_Interface;
   type IVectorView_IItemIndexRange is access all IVectorView_IItemIndexRange_Interface'Class;
   type IVectorView_IItemIndexRange_Ptr is access all IVectorView_IItemIndexRange;
   
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
   
   IID_IItemsRangeInfo : aliased constant Windows.IID := (4032779877, 29181, 17826, (190, 19, 160, 129, 210, 148, 166, 141 ));
   
   type IItemsRangeInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function RangesChanged
   (
      This       : access IItemsRangeInfo_Interface
      ; visibleRange : Windows.UI.Xaml.Data.IItemIndexRange
      ; trackedItems : Windows.UI.Xaml.Data.IVectorView_IItemIndexRange
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISelectionInfo : aliased constant Windows.IID := (772983430, 57837, 16965, (190, 73, 32, 126, 66, 174, 197, 36 ));
   
   type ISelectionInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function SelectRange
   (
      This       : access ISelectionInfo_Interface
      ; itemIndexRange : Windows.UI.Xaml.Data.IItemIndexRange
   )
   return Windows.HRESULT is abstract;
   
   function DeselectRange
   (
      This       : access ISelectionInfo_Interface
      ; itemIndexRange : Windows.UI.Xaml.Data.IItemIndexRange
   )
   return Windows.HRESULT is abstract;
   
   function IsSelected
   (
      This       : access ISelectionInfo_Interface
      ; index : Windows.Int32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetSelectedRanges
   (
      This       : access ISelectionInfo_Interface
      ; RetVal : access Windows.UI.Xaml.Data.IVectorView_IItemIndexRange -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICustomProperty : aliased constant Windows.IID := (819630784, 9192, 17056, (174, 124, 115, 74, 14, 93, 39, 130 ));
   
   type ICustomProperty_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Type
   (
      This       : access ICustomProperty_Interface
      ; RetVal : access Windows.UI.Xaml.Interop.TypeName
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access ICustomProperty_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetValue
   (
      This       : access ICustomProperty_Interface
      ; target : Windows.Object
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function SetValue
   (
      This       : access ICustomProperty_Interface
      ; target : Windows.Object
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function GetIndexedValue
   (
      This       : access ICustomProperty_Interface
      ; target : Windows.Object
      ; index : Windows.Object
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function SetIndexedValue
   (
      This       : access ICustomProperty_Interface
      ; target : Windows.Object
      ; value : Windows.Object
      ; index : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_CanWrite
   (
      This       : access ICustomProperty_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanRead
   (
      This       : access ICustomProperty_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICustomPropertyProvider : aliased constant Windows.IID := (2089965397, 15944, 17076, (134, 119, 118, 55, 34, 103, 3, 63 ));
   
   type ICustomPropertyProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCustomProperty
   (
      This       : access ICustomPropertyProvider_Interface
      ; name : Windows.String
      ; RetVal : access Windows.UI.Xaml.Data.ICustomProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetIndexedProperty
   (
      This       : access ICustomPropertyProvider_Interface
      ; name : Windows.String
      ; type_x : Windows.UI.Xaml.Interop.TypeName
      ; RetVal : access Windows.UI.Xaml.Data.ICustomProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetStringRepresentation
   (
      This       : access ICustomPropertyProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Type
   (
      This       : access ICustomPropertyProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Interop.TypeName
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_INotifyPropertyChanged : aliased constant Windows.IID := (3480606364, 62196, 18539, (179, 2, 187, 76, 9, 186, 235, 250 ));
   
   type INotifyPropertyChanged_Interface is interface and Windows.IInspectable_Interface;
   
   function add_PropertyChanged
   (
      This       : access INotifyPropertyChanged_Interface
      ; value : Windows.UI.Xaml.Data.PropertyChangedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PropertyChanged
   (
      This       : access INotifyPropertyChanged_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISupportIncrementalLoading : aliased constant Windows.IID := (2136926610, 30356, 20076, (165, 27, 227, 75, 244, 61, 231, 67 ));
   
   type ISupportIncrementalLoading_Interface is interface and Windows.IInspectable_Interface;
   
   function LoadMoreItemsAsync
   (
      This       : access ISupportIncrementalLoading_Interface
      ; count : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Data.IAsyncOperation_LoadMoreItemsResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_HasMoreItems
   (
      This       : access ISupportIncrementalLoading_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IValueConverter : aliased constant Windows.IID := (3874684656, 1810, 18559, (179, 19, 243, 0, 184, 215, 154, 161 ));
   
   type IValueConverter_Interface is interface and Windows.IInspectable_Interface;
   
   function Convert
   (
      This       : access IValueConverter_Interface
      ; value : Windows.Object
      ; targetType : Windows.UI.Xaml.Interop.TypeName
      ; parameter : Windows.Object
      ; language : Windows.String
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function ConvertBack
   (
      This       : access IValueConverter_Interface
      ; value : Windows.Object
      ; targetType : Windows.UI.Xaml.Interop.TypeName
      ; parameter : Windows.Object
      ; language : Windows.String
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IBindingExpressionBase : aliased constant Windows.IID := (4260180308, 59732, 20327, (143, 182, 110, 215, 155, 58, 28, 179 ));
   
   type IBindingExpressionBase_Interface is interface and Windows.IInspectable_Interface;
   ------------------------------------------------------------------------
   
   IID_IBindingExpressionBaseFactory : aliased constant Windows.IID := (3933279911, 49881, 17269, (180, 113, 102, 185, 196, 140, 121, 48 ));
   
   type IBindingExpressionBaseFactory_Interface is interface and Windows.IInspectable_Interface;
   ------------------------------------------------------------------------
   
   IID_IBindingOperations : aliased constant Windows.IID := (1879037752, 38969, 16796, (161, 122, 75, 54, 4, 225, 82, 78 ));
   
   type IBindingOperations_Interface is interface and Windows.IInspectable_Interface;
   ------------------------------------------------------------------------
   
   IID_IBindingOperationsStatics : aliased constant Windows.IID := (3780505459, 38304, 19115, (140, 125, 42, 71, 218, 7, 60, 121 ));
   
   type IBindingOperationsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function SetBinding
   (
      This       : access IBindingOperationsStatics_Interface
      ; target : Windows.UI.Xaml.IDependencyObject
      ; dp : Windows.UI.Xaml.IDependencyProperty
      ; binding : Windows.UI.Xaml.Data.IBindingBase
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICurrentChangingEventArgs : aliased constant Windows.IID := (4186512937, 20940, 18397, (165, 185, 53, 220, 73, 20, 175, 105 ));
   
   type ICurrentChangingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Cancel
   (
      This       : access ICurrentChangingEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Cancel
   (
      This       : access ICurrentChangingEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCancelable
   (
      This       : access ICurrentChangingEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICurrentChangingEventArgsFactory : aliased constant Windows.IID := (356237038, 25331, 18639, (129, 131, 139, 226, 109, 227, 166, 110 ));
   
   type ICurrentChangingEventArgsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access ICurrentChangingEventArgsFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Data.ICurrentChangingEventArgs
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithCancelableParameter
   (
      This       : access ICurrentChangingEventArgsFactory_Interface
      ; isCancelable : Windows.Boolean
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Data.ICurrentChangingEventArgs
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IPropertyChangedEventArgs : aliased constant Windows.IID := (1328785824, 23796, 18340, (177, 111, 215, 250, 175, 23, 69, 126 ));
   
   type IPropertyChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PropertyName
   (
      This       : access IPropertyChangedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IPropertyChangedEventArgsFactory : aliased constant Windows.IID := (1842125827, 57543, 20206, (142, 169, 55, 227, 64, 110, 235, 28 ));
   
   type IPropertyChangedEventArgsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IPropertyChangedEventArgsFactory_Interface
      ; name : Windows.String
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Data.IPropertyChangedEventArgs
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IBindingBase : aliased constant Windows.IID := (361341611, 15637, 18876, (164, 71, 138, 84, 72, 229, 136, 112 ));
   
   type IBindingBase_Interface is interface and Windows.IInspectable_Interface;
   ------------------------------------------------------------------------
   
   IID_IBindingBaseFactory : aliased constant Windows.IID := (584776762, 30465, 18022, (161, 186, 152, 89, 189, 207, 236, 52 ));
   
   type IBindingBaseFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IBindingBaseFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Data.IBindingBase
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IBindingExpression : aliased constant Windows.IID := (1365907877, 49917, 19102, (159, 211, 154, 164, 47, 153, 90, 60 ));
   
   type IBindingExpression_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DataItem
   (
      This       : access IBindingExpression_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_ParentBinding
   (
      This       : access IBindingExpression_Interface
      ; RetVal : access Windows.UI.Xaml.Data.IBinding
   )
   return Windows.HRESULT is abstract;
   
   function UpdateSource
   (
      This       : access IBindingExpression_Interface
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IBindingExpressionFactory : aliased constant Windows.IID := (481647833, 56178, 16563, (162, 181, 36, 238, 110, 165, 195, 40 ));
   
   type IBindingExpressionFactory_Interface is interface and Windows.IInspectable_Interface;
   ------------------------------------------------------------------------
   
   IID_IRelativeSource : aliased constant Windows.IID := (597151364, 10274, 18490, (180, 153, 208, 240, 49, 224, 108, 107 ));
   
   type IRelativeSource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Mode
   (
      This       : access IRelativeSource_Interface
      ; RetVal : access Windows.UI.Xaml.Data.RelativeSourceMode
   )
   return Windows.HRESULT is abstract;
   
   function put_Mode
   (
      This       : access IRelativeSource_Interface
      ; value : Windows.UI.Xaml.Data.RelativeSourceMode
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRelativeSourceFactory : aliased constant Windows.IID := (4018377421, 17518, 20371, (170, 203, 155, 18, 85, 87, 116, 96 ));
   
   type IRelativeSourceFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IRelativeSourceFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Data.IRelativeSource
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IBinding : aliased constant Windows.IID := (1064963179, 53263, 18224, (140, 29, 72, 225, 108, 70, 249, 202 ));
   
   type IBinding_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Path
   (
      This       : access IBinding_Interface
      ; RetVal : access Windows.UI.Xaml.IPropertyPath
   )
   return Windows.HRESULT is abstract;
   
   function put_Path
   (
      This       : access IBinding_Interface
      ; value : Windows.UI.Xaml.IPropertyPath
   )
   return Windows.HRESULT is abstract;
   
   function get_Mode
   (
      This       : access IBinding_Interface
      ; RetVal : access Windows.UI.Xaml.Data.BindingMode
   )
   return Windows.HRESULT is abstract;
   
   function put_Mode
   (
      This       : access IBinding_Interface
      ; value : Windows.UI.Xaml.Data.BindingMode
   )
   return Windows.HRESULT is abstract;
   
   function get_Source
   (
      This       : access IBinding_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_Source
   (
      This       : access IBinding_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_RelativeSource
   (
      This       : access IBinding_Interface
      ; RetVal : access Windows.UI.Xaml.Data.IRelativeSource
   )
   return Windows.HRESULT is abstract;
   
   function put_RelativeSource
   (
      This       : access IBinding_Interface
      ; value : Windows.UI.Xaml.Data.IRelativeSource
   )
   return Windows.HRESULT is abstract;
   
   function get_ElementName
   (
      This       : access IBinding_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ElementName
   (
      This       : access IBinding_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Converter
   (
      This       : access IBinding_Interface
      ; RetVal : access Windows.UI.Xaml.Data.IValueConverter
   )
   return Windows.HRESULT is abstract;
   
   function put_Converter
   (
      This       : access IBinding_Interface
      ; value : Windows.UI.Xaml.Data.IValueConverter
   )
   return Windows.HRESULT is abstract;
   
   function get_ConverterParameter
   (
      This       : access IBinding_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_ConverterParameter
   (
      This       : access IBinding_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_ConverterLanguage
   (
      This       : access IBinding_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ConverterLanguage
   (
      This       : access IBinding_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IBindingFactory : aliased constant Windows.IID := (4282563336, 50078, 20350, (132, 52, 161, 86, 144, 131, 136, 60 ));
   
   type IBindingFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IBindingFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Data.IBinding
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IBinding2 : aliased constant Windows.IID := (888762315, 1030, 18611, (158, 130, 243, 51, 236, 76, 105, 16 ));
   
   type IBinding2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FallbackValue
   (
      This       : access IBinding2_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_FallbackValue
   (
      This       : access IBinding2_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_TargetNullValue
   (
      This       : access IBinding2_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetNullValue
   (
      This       : access IBinding2_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_UpdateSourceTrigger
   (
      This       : access IBinding2_Interface
      ; RetVal : access Windows.UI.Xaml.Data.UpdateSourceTrigger
   )
   return Windows.HRESULT is abstract;
   
   function put_UpdateSourceTrigger
   (
      This       : access IBinding2_Interface
      ; value : Windows.UI.Xaml.Data.UpdateSourceTrigger
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICollectionView : aliased constant Windows.IID := (2347286500, 56303, 17631, (129, 38, 163, 26, 137, 18, 29, 220 ));
   
   type ICollectionView_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CurrentItem
   (
      This       : access ICollectionView_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentPosition
   (
      This       : access ICollectionView_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCurrentAfterLast
   (
      This       : access ICollectionView_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCurrentBeforeFirst
   (
      This       : access ICollectionView_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CollectionGroups
   (
      This       : access ICollectionView_Interface
      ; RetVal : access Windows.Foundation.IObservableVector_Object -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_HasMoreItems
   (
      This       : access ICollectionView_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_CurrentChanged
   (
      This       : access ICollectionView_Interface
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CurrentChanged
   (
      This       : access ICollectionView_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CurrentChanging
   (
      This       : access ICollectionView_Interface
      ; value : Windows.UI.Xaml.Data.CurrentChangingEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CurrentChanging
   (
      This       : access ICollectionView_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function MoveCurrentTo
   (
      This       : access ICollectionView_Interface
      ; item : Windows.Object
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveCurrentToPosition
   (
      This       : access ICollectionView_Interface
      ; index : Windows.Int32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveCurrentToFirst
   (
      This       : access ICollectionView_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveCurrentToLast
   (
      This       : access ICollectionView_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveCurrentToNext
   (
      This       : access ICollectionView_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveCurrentToPrevious
   (
      This       : access ICollectionView_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function LoadMoreItemsAsync
   (
      This       : access ICollectionView_Interface
      ; count : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Data.IAsyncOperation_LoadMoreItemsResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICollectionViewFactory : aliased constant Windows.IID := (886352628, 36466, 18768, (145, 146, 236, 208, 125, 57, 157, 10 ));
   
   type ICollectionViewFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateView
   (
      This       : access ICollectionViewFactory_Interface
      ; RetVal : access Windows.UI.Xaml.Data.ICollectionView
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICollectionViewGroup : aliased constant Windows.IID := (2114042328, 55221, 18614, (179, 28, 91, 181, 189, 245, 240, 155 ));
   
   type ICollectionViewGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Group
   (
      This       : access ICollectionViewGroup_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_GroupItems
   (
      This       : access ICollectionViewGroup_Interface
      ; RetVal : access Windows.Foundation.IObservableVector_Object -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IItemIndexRange : aliased constant Windows.IID := (2209887422, 1411, 18982, (155, 100, 139, 244, 162, 246, 87, 4 ));
   
   type IItemIndexRange_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FirstIndex
   (
      This       : access IItemIndexRange_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Length
   (
      This       : access IItemIndexRange_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_LastIndex
   (
      This       : access IItemIndexRange_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IItemIndexRangeFactory : aliased constant Windows.IID := (2263008320, 11898, 19581, (166, 100, 232, 171, 240, 123, 252, 126 ));
   
   type IItemIndexRangeFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IItemIndexRangeFactory_Interface
      ; firstIndex : Windows.Int32
      ; length : Windows.UInt32
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Data.IItemIndexRange
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICollectionViewSource : aliased constant Windows.IID := (2791969094, 54011, 20141, (190, 159, 53, 120, 164, 102, 220, 254 ));
   
   type ICollectionViewSource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Source
   (
      This       : access ICollectionViewSource_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_Source
   (
      This       : access ICollectionViewSource_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_View
   (
      This       : access ICollectionViewSource_Interface
      ; RetVal : access Windows.UI.Xaml.Data.ICollectionView
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSourceGrouped
   (
      This       : access ICollectionViewSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsSourceGrouped
   (
      This       : access ICollectionViewSource_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemsPath
   (
      This       : access ICollectionViewSource_Interface
      ; RetVal : access Windows.UI.Xaml.IPropertyPath
   )
   return Windows.HRESULT is abstract;
   
   function put_ItemsPath
   (
      This       : access ICollectionViewSource_Interface
      ; value : Windows.UI.Xaml.IPropertyPath
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICollectionViewSourceStatics : aliased constant Windows.IID := (389678864, 18095, 19468, (129, 139, 33, 182, 239, 129, 191, 101 ));
   
   type ICollectionViewSourceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SourceProperty
   (
      This       : access ICollectionViewSourceStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ViewProperty
   (
      This       : access ICollectionViewSourceStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSourceGroupedProperty
   (
      This       : access ICollectionViewSourceStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemsPathProperty
   (
      This       : access ICollectionViewSourceStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_LoadMoreItemsResult : aliased constant Windows.IID := (3347581085, 14251, 23458, (184, 101, 90, 48, 154, 205, 252, 77 ));
   
   type IAsyncOperation_LoadMoreItemsResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_LoadMoreItemsResult_Interface
      ; handler : Windows.UI.Xaml.Data.AsyncOperationCompletedHandler_LoadMoreItemsResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_LoadMoreItemsResult_Interface
      ; RetVal : access Windows.UI.Xaml.Data.AsyncOperationCompletedHandler_LoadMoreItemsResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_LoadMoreItemsResult_Interface
      ; RetVal : access Windows.UI.Xaml.Data.LoadMoreItemsResult
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_IItemIndexRange : aliased constant Windows.IID := (2619488806, 3201, 23030, (169, 9, 186, 73, 102, 180, 207, 36 ));
   
   type IIterator_IItemIndexRange_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IItemIndexRange_Interface
      ; RetVal : access Windows.UI.Xaml.Data.IItemIndexRange
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IItemIndexRange_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IItemIndexRange_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IItemIndexRange_Interface
      ; items : Windows.UI.Xaml.Data.IItemIndexRange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_IItemIndexRange : aliased constant Windows.IID := (658210931, 35862, 22978, (166, 22, 10, 83, 68, 131, 198, 18 ));
   
   type IIterable_IItemIndexRange_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IItemIndexRange_Interface
      ; RetVal : access Windows.UI.Xaml.Data.IIterator_IItemIndexRange
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_IItemIndexRange : aliased constant Windows.IID := (3501353734, 5864, 22375, (166, 11, 238, 62, 50, 228, 61, 251 ));
   
   type IVectorView_IItemIndexRange_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IItemIndexRange_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Data.IItemIndexRange
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IItemIndexRange_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IItemIndexRange_Interface
      ; value : Windows.UI.Xaml.Data.IItemIndexRange
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IItemIndexRange_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Data.IItemIndexRange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_CurrentChangingEventHandler : aliased constant Windows.IID := (4085812664, 5023, 19918, (141, 201, 247, 241, 68, 77, 17, 133 ));
   
   type CurrentChangingEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Data.ICurrentChangingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_CurrentChangingEventHandler'access) with null record;
   
   function Invoke
   (
      This       : access CurrentChangingEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Data.ICurrentChangingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_PropertyChangedEventHandler : aliased constant Windows.IID := (1358011414, 2594, 19854, (160, 137, 30, 169, 149, 22, 87, 210 ));
   
   type PropertyChangedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Data.IPropertyChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_PropertyChangedEventHandler'access) with null record;
   
   function Invoke
   (
      This       : access PropertyChangedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Data.IPropertyChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_LoadMoreItemsResult : aliased constant Windows.IID := (284914571, 42555, 20590, (158, 215, 46, 171, 55, 145, 82, 33 ));
   
   type AsyncOperationCompletedHandler_LoadMoreItemsResult_Interface(Callback : access procedure (asyncInfo : Windows.UI.Xaml.Data.IAsyncOperation_LoadMoreItemsResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_LoadMoreItemsResult'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_LoadMoreItemsResult_Interface
      ; asyncInfo : Windows.UI.Xaml.Data.IAsyncOperation_LoadMoreItemsResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype CurrentChangingEventArgs is Windows.UI.Xaml.Data.ICurrentChangingEventArgs;
   
   type ICurrentChangingEventArgs_Interface_Impl is new ICurrentChangingEventArgs_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased ICurrentChangingEventArgs := null;
      m_ICurrentChangingEventArgs : ICurrentChangingEventArgs := null;
   end record;
   
   type ICurrentChangingEventArgs_Impl is access all ICurrentChangingEventArgs_Interface_Impl'Class;
   type ICurrentChangingEventArgs_Impl_Ptr is access all ICurrentChangingEventArgs_Impl;
   
   function QueryInterface
   (
      This       : access ICurrentChangingEventArgs_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access ICurrentChangingEventArgs_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access ICurrentChangingEventArgs_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access ICurrentChangingEventArgs_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access ICurrentChangingEventArgs_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access ICurrentChangingEventArgs_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_Cancel
   (
      This       : access ICurrentChangingEventArgs_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function put_Cancel
   (
      This       : access ICurrentChangingEventArgs_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT;
   
   function get_IsCancelable
   (
      This       : access ICurrentChangingEventArgs_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   subtype PropertyChangedEventArgs is Windows.UI.Xaml.Data.IPropertyChangedEventArgs;
   
   type IPropertyChangedEventArgs_Interface_Impl is new IPropertyChangedEventArgs_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IPropertyChangedEventArgs := null;
      m_IPropertyChangedEventArgs : IPropertyChangedEventArgs := null;
   end record;
   
   type IPropertyChangedEventArgs_Impl is access all IPropertyChangedEventArgs_Interface_Impl'Class;
   type IPropertyChangedEventArgs_Impl_Ptr is access all IPropertyChangedEventArgs_Impl;
   
   function QueryInterface
   (
      This       : access IPropertyChangedEventArgs_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IPropertyChangedEventArgs_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IPropertyChangedEventArgs_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IPropertyChangedEventArgs_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IPropertyChangedEventArgs_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IPropertyChangedEventArgs_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_PropertyName
   (
      This       : access IPropertyChangedEventArgs_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   subtype BindingExpressionBase is Windows.UI.Xaml.Data.IBindingExpressionBase;
   
   subtype BindingOperations is Windows.UI.Xaml.Data.IBindingOperations;
   subtype BindingBase is Windows.UI.Xaml.Data.IBindingBase;
   
   type IBindingBase_Interface_Impl is new IBindingBase_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IBindingBase := null;
      m_IBindingBase : IBindingBase := null;
   end record;
   
   type IBindingBase_Impl is access all IBindingBase_Interface_Impl'Class;
   type IBindingBase_Impl_Ptr is access all IBindingBase_Impl;
   
   function QueryInterface
   (
      This       : access IBindingBase_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IBindingBase_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IBindingBase_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IBindingBase_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IBindingBase_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IBindingBase_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   subtype BindingExpression is Windows.UI.Xaml.Data.IBindingExpression;
   
   subtype RelativeSource is Windows.UI.Xaml.Data.IRelativeSource;
   
   type IRelativeSource_Interface_Impl is new IRelativeSource_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IRelativeSource := null;
      m_IRelativeSource : IRelativeSource := null;
   end record;
   
   type IRelativeSource_Impl is access all IRelativeSource_Interface_Impl'Class;
   type IRelativeSource_Impl_Ptr is access all IRelativeSource_Impl;
   
   function QueryInterface
   (
      This       : access IRelativeSource_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IRelativeSource_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IRelativeSource_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IRelativeSource_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IRelativeSource_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IRelativeSource_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_Mode
   (
      This       : access IRelativeSource_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Data.RelativeSourceMode
   )
   return Windows.HRESULT;
   
   function put_Mode
   (
      This       : access IRelativeSource_Interface_Impl
      ; value : Windows.UI.Xaml.Data.RelativeSourceMode
   )
   return Windows.HRESULT;
   
   subtype Binding is Windows.UI.Xaml.Data.IBinding;
   
   type IBinding_Interface_Impl is new IBinding_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IBinding := null;
      m_IBinding : IBinding := null;
   end record;
   
   type IBinding_Impl is access all IBinding_Interface_Impl'Class;
   type IBinding_Impl_Ptr is access all IBinding_Impl;
   
   function QueryInterface
   (
      This       : access IBinding_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IBinding_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IBinding_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IBinding_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IBinding_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IBinding_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_Path
   (
      This       : access IBinding_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.IPropertyPath
   )
   return Windows.HRESULT;
   
   function put_Path
   (
      This       : access IBinding_Interface_Impl
      ; value : Windows.UI.Xaml.IPropertyPath
   )
   return Windows.HRESULT;
   
   function get_Mode
   (
      This       : access IBinding_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Data.BindingMode
   )
   return Windows.HRESULT;
   
   function put_Mode
   (
      This       : access IBinding_Interface_Impl
      ; value : Windows.UI.Xaml.Data.BindingMode
   )
   return Windows.HRESULT;
   
   function get_Source
   (
      This       : access IBinding_Interface_Impl
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT;
   
   function put_Source
   (
      This       : access IBinding_Interface_Impl
      ; value : Windows.Object
   )
   return Windows.HRESULT;
   
   function get_RelativeSource
   (
      This       : access IBinding_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Data.IRelativeSource
   )
   return Windows.HRESULT;
   
   function put_RelativeSource
   (
      This       : access IBinding_Interface_Impl
      ; value : Windows.UI.Xaml.Data.IRelativeSource
   )
   return Windows.HRESULT;
   
   function get_ElementName
   (
      This       : access IBinding_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function put_ElementName
   (
      This       : access IBinding_Interface_Impl
      ; value : Windows.String
   )
   return Windows.HRESULT;
   
   function get_Converter
   (
      This       : access IBinding_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Data.IValueConverter
   )
   return Windows.HRESULT;
   
   function put_Converter
   (
      This       : access IBinding_Interface_Impl
      ; value : Windows.UI.Xaml.Data.IValueConverter
   )
   return Windows.HRESULT;
   
   function get_ConverterParameter
   (
      This       : access IBinding_Interface_Impl
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT;
   
   function put_ConverterParameter
   (
      This       : access IBinding_Interface_Impl
      ; value : Windows.Object
   )
   return Windows.HRESULT;
   
   function get_ConverterLanguage
   (
      This       : access IBinding_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function put_ConverterLanguage
   (
      This       : access IBinding_Interface_Impl
      ; value : Windows.String
   )
   return Windows.HRESULT;
   
   subtype ItemIndexRange is Windows.UI.Xaml.Data.IItemIndexRange;
   
   type IItemIndexRange_Interface_Impl is new IItemIndexRange_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IItemIndexRange := null;
      m_IItemIndexRange : IItemIndexRange := null;
   end record;
   
   type IItemIndexRange_Impl is access all IItemIndexRange_Interface_Impl'Class;
   type IItemIndexRange_Impl_Ptr is access all IItemIndexRange_Impl;
   
   function QueryInterface
   (
      This       : access IItemIndexRange_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IItemIndexRange_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IItemIndexRange_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IItemIndexRange_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IItemIndexRange_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IItemIndexRange_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_FirstIndex
   (
      This       : access IItemIndexRange_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT;
   
   function get_Length
   (
      This       : access IItemIndexRange_Interface_Impl
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT;
   
   function get_LastIndex
   (
      This       : access IItemIndexRange_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT;
   
   subtype CollectionViewSource is Windows.UI.Xaml.Data.ICollectionViewSource;
   
   function CreateCollectionViewSource return Windows.UI.Xaml.Data.ICollectionViewSource;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Data.ICurrentChangingEventArgs;
   
   function CreateWithCancelableParameter
   (
      isCancelable : Windows.Boolean
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Data.ICurrentChangingEventArgs;
   
   function CreateInstance
   (
      name : Windows.String
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Data.IPropertyChangedEventArgs;
   
   procedure SetBinding
   (
      target : Windows.UI.Xaml.IDependencyObject
      ; dp : Windows.UI.Xaml.IDependencyProperty
      ; binding : Windows.UI.Xaml.Data.IBindingBase
   )
   ;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Data.IBindingBase;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Data.IRelativeSource;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Data.IBinding;
   
   function CreateInstance
   (
      firstIndex : Windows.Int32
      ; length : Windows.UInt32
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Data.IItemIndexRange;
   
   function get_SourceProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ViewProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsSourceGroupedProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ItemsPathProperty
   return Windows.UI.Xaml.IDependencyProperty;

end;
