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
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.UI.Xaml.Controls.Primitives;
limited with Windows.Media.Playback;
limited with Windows.Storage.Streams;
limited with Windows.UI.Composition;
limited with Windows.UI.Xaml.Media.Media3D;
--------------------------------------------------------------------------------
package Windows.UI.Xaml.Media is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AcrylicBackgroundSource is (
      HostBackdrop,
      Backdrop
   );
   for AcrylicBackgroundSource use (
      HostBackdrop => 0,
      Backdrop => 1
   );
   for AcrylicBackgroundSource'Size use 32;
   
   type AcrylicBackgroundSource_Ptr is access AcrylicBackgroundSource;
   
   type RevealBrushState is (
      Normal,
      PointerOver,
      Pressed
   );
   for RevealBrushState use (
      Normal => 0,
      PointerOver => 1,
      Pressed => 2
   );
   for RevealBrushState'Size use 32;
   
   type RevealBrushState_Ptr is access RevealBrushState;
   
   type MediaElementState is (
      Closed,
      Opening,
      Buffering,
      Playing,
      Paused,
      Stopped
   );
   for MediaElementState use (
      Closed => 0,
      Opening => 1,
      Buffering => 2,
      Playing => 3,
      Paused => 4,
      Stopped => 5
   );
   for MediaElementState'Size use 32;
   
   type MediaElementState_Ptr is access MediaElementState;
   
   type AudioCategory is (
      Other,
      Communications,
      Alerts,
      SoundEffects,
      GameEffects,
      GameMedia,
      GameChat,
      Speech,
      Movie,
      Media
   );
   for AudioCategory use (
      Other => 0,
      Communications => 3,
      Alerts => 4,
      SoundEffects => 5,
      GameEffects => 6,
      GameMedia => 7,
      GameChat => 8,
      Speech => 9,
      Movie => 10,
      Media => 11
   );
   for AudioCategory'Size use 32;
   
   type AudioCategory_Ptr is access AudioCategory;
   
   type AudioDeviceType is (
      Console,
      Multimedia,
      Communications
   );
   for AudioDeviceType use (
      Console => 0,
      Multimedia => 1,
      Communications => 2
   );
   for AudioDeviceType'Size use 32;
   
   type AudioDeviceType_Ptr is access AudioDeviceType;
   
   type BrushMappingMode is (
      Absolute,
      RelativeToBoundingBox
   );
   for BrushMappingMode use (
      Absolute => 0,
      RelativeToBoundingBox => 1
   );
   for BrushMappingMode'Size use 32;
   
   type BrushMappingMode_Ptr is access BrushMappingMode;
   
   type ColorInterpolationMode is (
      ScRgbLinearInterpolation,
      SRgbLinearInterpolation
   );
   for ColorInterpolationMode use (
      ScRgbLinearInterpolation => 0,
      SRgbLinearInterpolation => 1
   );
   for ColorInterpolationMode'Size use 32;
   
   type ColorInterpolationMode_Ptr is access ColorInterpolationMode;
   
   type ElementCompositeMode is (
      Inherit,
      SourceOver,
      MinBlend
   );
   for ElementCompositeMode use (
      Inherit => 0,
      SourceOver => 1,
      MinBlend => 2
   );
   for ElementCompositeMode'Size use 32;
   
   type ElementCompositeMode_Ptr is access ElementCompositeMode;
   
   type FastPlayFallbackBehaviour is (
      Skip,
      Hide,
      Disable
   );
   for FastPlayFallbackBehaviour use (
      Skip => 0,
      Hide => 1,
      Disable => 2
   );
   for FastPlayFallbackBehaviour'Size use 32;
   
   type FastPlayFallbackBehaviour_Ptr is access FastPlayFallbackBehaviour;
   
   type FillRule is (
      EvenOdd,
      Nonzero
   );
   for FillRule use (
      EvenOdd => 0,
      Nonzero => 1
   );
   for FillRule'Size use 32;
   
   type FillRule_Ptr is access FillRule;
   
   type GradientSpreadMethod is (
      Pad,
      Reflect,
      Repeat
   );
   for GradientSpreadMethod use (
      Pad => 0,
      Reflect => 1,
      Repeat => 2
   );
   for GradientSpreadMethod'Size use 32;
   
   type GradientSpreadMethod_Ptr is access GradientSpreadMethod;
   
   type MediaCanPlayResponse is (
      NotSupported,
      Maybe,
      Probably
   );
   for MediaCanPlayResponse use (
      NotSupported => 0,
      Maybe => 1,
      Probably => 2
   );
   for MediaCanPlayResponse'Size use 32;
   
   type MediaCanPlayResponse_Ptr is access MediaCanPlayResponse;
   
   type PenLineCap is (
      Flat,
      Square,
      Round,
      Triangle
   );
   for PenLineCap use (
      Flat => 0,
      Square => 1,
      Round => 2,
      Triangle => 3
   );
   for PenLineCap'Size use 32;
   
   type PenLineCap_Ptr is access PenLineCap;
   
   type PenLineJoin is (
      Miter,
      Bevel,
      Round
   );
   for PenLineJoin use (
      Miter => 0,
      Bevel => 1,
      Round => 2
   );
   for PenLineJoin'Size use 32;
   
   type PenLineJoin_Ptr is access PenLineJoin;
   
   type Stereo3DVideoPackingMode is (
      None,
      SideBySide,
      TopBottom
   );
   for Stereo3DVideoPackingMode use (
      None => 0,
      SideBySide => 1,
      TopBottom => 2
   );
   for Stereo3DVideoPackingMode'Size use 32;
   
   type Stereo3DVideoPackingMode_Ptr is access Stereo3DVideoPackingMode;
   
   type Stereo3DVideoRenderMode is (
      Mono,
      Stereo
   );
   for Stereo3DVideoRenderMode use (
      Mono => 0,
      Stereo => 1
   );
   for Stereo3DVideoRenderMode'Size use 32;
   
   type Stereo3DVideoRenderMode_Ptr is access Stereo3DVideoRenderMode;
   
   type Stretch is (
      None,
      Fill,
      Uniform,
      UniformToFill
   );
   for Stretch use (
      None => 0,
      Fill => 1,
      Uniform => 2,
      UniformToFill => 3
   );
   for Stretch'Size use 32;
   
   type Stretch_Ptr is access Stretch;
   
   type StyleSimulations is (
      None,
      BoldSimulation,
      ItalicSimulation,
      BoldItalicSimulation
   );
   for StyleSimulations use (
      None => 0,
      BoldSimulation => 1,
      ItalicSimulation => 2,
      BoldItalicSimulation => 3
   );
   for StyleSimulations'Size use 32;
   
   type StyleSimulations_Ptr is access StyleSimulations;
   
   type SweepDirection is (
      Counterclockwise,
      Clockwise
   );
   for SweepDirection use (
      Counterclockwise => 0,
      Clockwise => 1
   );
   for SweepDirection'Size use 32;
   
   type SweepDirection_Ptr is access SweepDirection;
   
   type AlignmentX is (
      Left,
      Center,
      Right
   );
   for AlignmentX use (
      Left => 0,
      Center => 1,
      Right => 2
   );
   for AlignmentX'Size use 32;
   
   type AlignmentX_Ptr is access AlignmentX;
   
   type AlignmentY is (
      Top,
      Center,
      Bottom
   );
   for AlignmentY use (
      Top => 0,
      Center => 1,
      Bottom => 2
   );
   for AlignmentY'Size use 32;
   
   type AlignmentY_Ptr is access AlignmentY;
   
   type LoadedImageSourceLoadStatus is (
      Success,
      NetworkError,
      InvalidFormat,
      Other
   );
   for LoadedImageSourceLoadStatus use (
      Success => 0,
      NetworkError => 1,
      InvalidFormat => 2,
      Other => 3
   );
   for LoadedImageSourceLoadStatus'Size use 32;
   
   type LoadedImageSourceLoadStatus_Ptr is access LoadedImageSourceLoadStatus;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type Matrix is record
      M11 : Windows.Double;
      M12 : Windows.Double;
      M21 : Windows.Double;
      M22 : Windows.Double;
      OffsetX : Windows.Double;
      OffsetY : Windows.Double;
   end record;
   pragma Convention (C_Pass_By_Copy , Matrix);
   
   type Matrix_Ptr is access Matrix;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type RateChangedRoutedEventHandler_Interface;
   type RateChangedRoutedEventHandler is access all RateChangedRoutedEventHandler_Interface'Class;
   type RateChangedRoutedEventHandler_Ptr is access all RateChangedRoutedEventHandler;
   type TimelineMarkerRoutedEventHandler_Interface;
   type TimelineMarkerRoutedEventHandler is access all TimelineMarkerRoutedEventHandler_Interface'Class;
   type TimelineMarkerRoutedEventHandler_Ptr is access all TimelineMarkerRoutedEventHandler;
   type TypedEventHandler_ILoadedImageSurface_add_LoadCompleted_Interface;
   type TypedEventHandler_ILoadedImageSurface_add_LoadCompleted is access all TypedEventHandler_ILoadedImageSurface_add_LoadCompleted_Interface'Class;
   type TypedEventHandler_ILoadedImageSurface_add_LoadCompleted_Ptr is access all TypedEventHandler_ILoadedImageSurface_add_LoadCompleted;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IAcrylicBrush_Interface;
   type IAcrylicBrush is access all IAcrylicBrush_Interface'Class;
   type IAcrylicBrush_Ptr is access all IAcrylicBrush;
   type IAcrylicBrushStatics_Interface;
   type IAcrylicBrushStatics is access all IAcrylicBrushStatics_Interface'Class;
   type IAcrylicBrushStatics_Ptr is access all IAcrylicBrushStatics;
   type IAcrylicBrushFactory_Interface;
   type IAcrylicBrushFactory is access all IAcrylicBrushFactory_Interface'Class;
   type IAcrylicBrushFactory_Ptr is access all IAcrylicBrushFactory;
   type IRevealBrush_Interface;
   type IRevealBrush is access all IRevealBrush_Interface'Class;
   type IRevealBrush_Ptr is access all IRevealBrush;
   type IRevealBrushFactory_Interface;
   type IRevealBrushFactory is access all IRevealBrushFactory_Interface'Class;
   type IRevealBrushFactory_Ptr is access all IRevealBrushFactory;
   type IRevealBrushStatics_Interface;
   type IRevealBrushStatics is access all IRevealBrushStatics_Interface'Class;
   type IRevealBrushStatics_Ptr is access all IRevealBrushStatics;
   type IRevealBorderBrushFactory_Interface;
   type IRevealBorderBrushFactory is access all IRevealBorderBrushFactory_Interface'Class;
   type IRevealBorderBrushFactory_Ptr is access all IRevealBorderBrushFactory;
   type IRevealBorderBrush_Interface;
   type IRevealBorderBrush is access all IRevealBorderBrush_Interface'Class;
   type IRevealBorderBrush_Ptr is access all IRevealBorderBrush;
   type IRevealBackgroundBrushFactory_Interface;
   type IRevealBackgroundBrushFactory is access all IRevealBackgroundBrushFactory_Interface'Class;
   type IRevealBackgroundBrushFactory_Ptr is access all IRevealBackgroundBrushFactory;
   type IRevealBackgroundBrush_Interface;
   type IRevealBackgroundBrush is access all IRevealBackgroundBrush_Interface'Class;
   type IRevealBackgroundBrush_Ptr is access all IRevealBackgroundBrush;
   type IVisualTreeHelper_Interface;
   type IVisualTreeHelper is access all IVisualTreeHelper_Interface'Class;
   type IVisualTreeHelper_Ptr is access all IVisualTreeHelper;
   type IVisualTreeHelperStatics_Interface;
   type IVisualTreeHelperStatics is access all IVisualTreeHelperStatics_Interface'Class;
   type IVisualTreeHelperStatics_Ptr is access all IVisualTreeHelperStatics;
   type IVisualTreeHelperStatics2_Interface;
   type IVisualTreeHelperStatics2 is access all IVisualTreeHelperStatics2_Interface'Class;
   type IVisualTreeHelperStatics2_Ptr is access all IVisualTreeHelperStatics2;
   type IPartialMediaFailureDetectedEventArgs_Interface;
   type IPartialMediaFailureDetectedEventArgs is access all IPartialMediaFailureDetectedEventArgs_Interface'Class;
   type IPartialMediaFailureDetectedEventArgs_Ptr is access all IPartialMediaFailureDetectedEventArgs;
   type IPartialMediaFailureDetectedEventArgs2_Interface;
   type IPartialMediaFailureDetectedEventArgs2 is access all IPartialMediaFailureDetectedEventArgs2_Interface'Class;
   type IPartialMediaFailureDetectedEventArgs2_Ptr is access all IPartialMediaFailureDetectedEventArgs2;
   type IMatrixHelper_Interface;
   type IMatrixHelper is access all IMatrixHelper_Interface'Class;
   type IMatrixHelper_Ptr is access all IMatrixHelper;
   type IMatrixHelperStatics_Interface;
   type IMatrixHelperStatics is access all IMatrixHelperStatics_Interface'Class;
   type IMatrixHelperStatics_Ptr is access all IMatrixHelperStatics;
   type IVector_Brush_Interface;
   type IVector_Brush is access all IVector_Brush_Interface'Class;
   type IVector_Brush_Ptr is access all IVector_Brush;
   type IIterable_Brush_Interface;
   type IIterable_Brush is access all IIterable_Brush_Interface'Class;
   type IIterable_Brush_Ptr is access all IIterable_Brush;
   type ICompositionTarget_Interface;
   type ICompositionTarget is access all ICompositionTarget_Interface'Class;
   type ICompositionTarget_Ptr is access all ICompositionTarget;
   type ICompositionTargetStatics_Interface;
   type ICompositionTargetStatics is access all ICompositionTargetStatics_Interface'Class;
   type ICompositionTargetStatics_Ptr is access all ICompositionTargetStatics;
   type IVector_Double_Interface;
   type IVector_Double is access all IVector_Double_Interface'Class;
   type IVector_Double_Ptr is access all IVector_Double;
   type IIterable_Double_Interface;
   type IIterable_Double is access all IIterable_Double_Interface'Class;
   type IIterable_Double_Ptr is access all IIterable_Double;
   type IFontFamily_Interface;
   type IFontFamily is access all IFontFamily_Interface'Class;
   type IFontFamily_Ptr is access all IFontFamily;
   type IFontFamilyFactory_Interface;
   type IFontFamilyFactory is access all IFontFamilyFactory_Interface'Class;
   type IFontFamilyFactory_Ptr is access all IFontFamilyFactory;
   type IFontFamilyStatics2_Interface;
   type IFontFamilyStatics2 is access all IFontFamilyStatics2_Interface'Class;
   type IFontFamilyStatics2_Ptr is access all IFontFamilyStatics2;
   type IMediaTransportControlsThumbnailRequestedEventArgs_Interface;
   type IMediaTransportControlsThumbnailRequestedEventArgs is access all IMediaTransportControlsThumbnailRequestedEventArgs_Interface'Class;
   type IMediaTransportControlsThumbnailRequestedEventArgs_Ptr is access all IMediaTransportControlsThumbnailRequestedEventArgs;
   type IVector_Point_Interface;
   type IVector_Point is access all IVector_Point_Interface'Class;
   type IVector_Point_Ptr is access all IVector_Point;
   type IIterable_Point_Interface;
   type IIterable_Point is access all IIterable_Point_Interface'Class;
   type IIterable_Point_Ptr is access all IIterable_Point;
   type IRenderingEventArgs_Interface;
   type IRenderingEventArgs is access all IRenderingEventArgs_Interface'Class;
   type IRenderingEventArgs_Ptr is access all IRenderingEventArgs;
   type IVector_TimelineMarker_Interface;
   type IVector_TimelineMarker is access all IVector_TimelineMarker_Interface'Class;
   type IVector_TimelineMarker_Ptr is access all IVector_TimelineMarker;
   type IIterable_TimelineMarker_Interface;
   type IIterable_TimelineMarker is access all IIterable_TimelineMarker_Interface'Class;
   type IIterable_TimelineMarker_Ptr is access all IIterable_TimelineMarker;
   type IVector_Transform_Interface;
   type IVector_Transform is access all IVector_Transform_Interface'Class;
   type IVector_Transform_Ptr is access all IVector_Transform;
   type IIterable_Transform_Interface;
   type IIterable_Transform is access all IIterable_Transform_Interface'Class;
   type IIterable_Transform_Ptr is access all IIterable_Transform;
   type IBrush_Interface;
   type IBrush is access all IBrush_Interface'Class;
   type IBrush_Ptr is access all IBrush;
   type IBrushStatics_Interface;
   type IBrushStatics is access all IBrushStatics_Interface'Class;
   type IBrushStatics_Ptr is access all IBrushStatics;
   type IBrushFactory_Interface;
   type IBrushFactory is access all IBrushFactory_Interface'Class;
   type IBrushFactory_Ptr is access all IBrushFactory;
   type ICacheMode_Interface;
   type ICacheMode is access all ICacheMode_Interface'Class;
   type ICacheMode_Ptr is access all ICacheMode;
   type ICacheModeFactory_Interface;
   type ICacheModeFactory is access all ICacheModeFactory_Interface'Class;
   type ICacheModeFactory_Ptr is access all ICacheModeFactory;
   type IGeneralTransform_Interface;
   type IGeneralTransform is access all IGeneralTransform_Interface'Class;
   type IGeneralTransform_Ptr is access all IGeneralTransform;
   type IGeneralTransformOverrides_Interface;
   type IGeneralTransformOverrides is access all IGeneralTransformOverrides_Interface'Class;
   type IGeneralTransformOverrides_Ptr is access all IGeneralTransformOverrides;
   type IGeneralTransformFactory_Interface;
   type IGeneralTransformFactory is access all IGeneralTransformFactory_Interface'Class;
   type IGeneralTransformFactory_Ptr is access all IGeneralTransformFactory;
   type IGeometry_Interface;
   type IGeometry is access all IGeometry_Interface'Class;
   type IGeometry_Ptr is access all IGeometry;
   type IGeometryStatics_Interface;
   type IGeometryStatics is access all IGeometryStatics_Interface'Class;
   type IGeometryStatics_Ptr is access all IGeometryStatics;
   type IGeometryFactory_Interface;
   type IGeometryFactory is access all IGeometryFactory_Interface'Class;
   type IGeometryFactory_Ptr is access all IGeometryFactory;
   type IImageSource_Interface;
   type IImageSource is access all IImageSource_Interface'Class;
   type IImageSource_Ptr is access all IImageSource;
   type IImageSourceFactory_Interface;
   type IImageSourceFactory is access all IImageSourceFactory_Interface'Class;
   type IImageSourceFactory_Ptr is access all IImageSourceFactory;
   type IPathSegment_Interface;
   type IPathSegment is access all IPathSegment_Interface'Class;
   type IPathSegment_Ptr is access all IPathSegment;
   type IPathSegmentFactory_Interface;
   type IPathSegmentFactory is access all IPathSegmentFactory_Interface'Class;
   type IPathSegmentFactory_Ptr is access all IPathSegmentFactory;
   type IProjection_Interface;
   type IProjection is access all IProjection_Interface'Class;
   type IProjection_Ptr is access all IProjection;
   type IProjectionFactory_Interface;
   type IProjectionFactory is access all IProjectionFactory_Interface'Class;
   type IProjectionFactory_Ptr is access all IProjectionFactory;
   type IRateChangedRoutedEventArgs_Interface;
   type IRateChangedRoutedEventArgs is access all IRateChangedRoutedEventArgs_Interface'Class;
   type IRateChangedRoutedEventArgs_Ptr is access all IRateChangedRoutedEventArgs;
   type ITimelineMarker_Interface;
   type ITimelineMarker is access all ITimelineMarker_Interface'Class;
   type ITimelineMarker_Ptr is access all ITimelineMarker;
   type ITimelineMarkerStatics_Interface;
   type ITimelineMarkerStatics is access all ITimelineMarkerStatics_Interface'Class;
   type ITimelineMarkerStatics_Ptr is access all ITimelineMarkerStatics;
   type ITimelineMarkerRoutedEventArgs_Interface;
   type ITimelineMarkerRoutedEventArgs is access all ITimelineMarkerRoutedEventArgs_Interface'Class;
   type ITimelineMarkerRoutedEventArgs_Ptr is access all ITimelineMarkerRoutedEventArgs;
   type IXamlLight_Interface;
   type IXamlLight is access all IXamlLight_Interface'Class;
   type IXamlLight_Ptr is access all IXamlLight;
   type IXamlLightOverrides_Interface;
   type IXamlLightOverrides is access all IXamlLightOverrides_Interface'Class;
   type IXamlLightOverrides_Ptr is access all IXamlLightOverrides;
   type IXamlLightProtected_Interface;
   type IXamlLightProtected is access all IXamlLightProtected_Interface'Class;
   type IXamlLightProtected_Ptr is access all IXamlLightProtected;
   type IXamlLightStatics_Interface;
   type IXamlLightStatics is access all IXamlLightStatics_Interface'Class;
   type IXamlLightStatics_Ptr is access all IXamlLightStatics;
   type IXamlLightFactory_Interface;
   type IXamlLightFactory is access all IXamlLightFactory_Interface'Class;
   type IXamlLightFactory_Ptr is access all IXamlLightFactory;
   type IBitmapCache_Interface;
   type IBitmapCache is access all IBitmapCache_Interface'Class;
   type IBitmapCache_Ptr is access all IBitmapCache;
   type IMatrix3DProjection_Interface;
   type IMatrix3DProjection is access all IMatrix3DProjection_Interface'Class;
   type IMatrix3DProjection_Ptr is access all IMatrix3DProjection;
   type IMatrix3DProjectionStatics_Interface;
   type IMatrix3DProjectionStatics is access all IMatrix3DProjectionStatics_Interface'Class;
   type IMatrix3DProjectionStatics_Ptr is access all IMatrix3DProjectionStatics;
   type IPlaneProjection_Interface;
   type IPlaneProjection is access all IPlaneProjection_Interface'Class;
   type IPlaneProjection_Ptr is access all IPlaneProjection;
   type IPlaneProjectionStatics_Interface;
   type IPlaneProjectionStatics is access all IPlaneProjectionStatics_Interface'Class;
   type IPlaneProjectionStatics_Ptr is access all IPlaneProjectionStatics;
   type IRectangleGeometry_Interface;
   type IRectangleGeometry is access all IRectangleGeometry_Interface'Class;
   type IRectangleGeometry_Ptr is access all IRectangleGeometry;
   type IRectangleGeometryStatics_Interface;
   type IRectangleGeometryStatics is access all IRectangleGeometryStatics_Interface'Class;
   type IRectangleGeometryStatics_Ptr is access all IRectangleGeometryStatics;
   type ISolidColorBrush_Interface;
   type ISolidColorBrush is access all ISolidColorBrush_Interface'Class;
   type ISolidColorBrush_Ptr is access all ISolidColorBrush;
   type ISolidColorBrushStatics_Interface;
   type ISolidColorBrushStatics is access all ISolidColorBrushStatics_Interface'Class;
   type ISolidColorBrushStatics_Ptr is access all ISolidColorBrushStatics;
   type ISolidColorBrushFactory_Interface;
   type ISolidColorBrushFactory is access all ISolidColorBrushFactory_Interface'Class;
   type ISolidColorBrushFactory_Ptr is access all ISolidColorBrushFactory;
   type ITransform_Interface;
   type ITransform is access all ITransform_Interface'Class;
   type ITransform_Ptr is access all ITransform;
   type ITransformFactory_Interface;
   type ITransformFactory is access all ITransformFactory_Interface'Class;
   type ITransformFactory_Ptr is access all ITransformFactory;
   type ICompositeTransform_Interface;
   type ICompositeTransform is access all ICompositeTransform_Interface'Class;
   type ICompositeTransform_Ptr is access all ICompositeTransform;
   type ICompositeTransformStatics_Interface;
   type ICompositeTransformStatics is access all ICompositeTransformStatics_Interface'Class;
   type ICompositeTransformStatics_Ptr is access all ICompositeTransformStatics;
   type IMatrixTransform_Interface;
   type IMatrixTransform is access all IMatrixTransform_Interface'Class;
   type IMatrixTransform_Ptr is access all IMatrixTransform;
   type IMatrixTransformStatics_Interface;
   type IMatrixTransformStatics is access all IMatrixTransformStatics_Interface'Class;
   type IMatrixTransformStatics_Ptr is access all IMatrixTransformStatics;
   type IRotateTransform_Interface;
   type IRotateTransform is access all IRotateTransform_Interface'Class;
   type IRotateTransform_Ptr is access all IRotateTransform;
   type IRotateTransformStatics_Interface;
   type IRotateTransformStatics is access all IRotateTransformStatics_Interface'Class;
   type IRotateTransformStatics_Ptr is access all IRotateTransformStatics;
   type IScaleTransform_Interface;
   type IScaleTransform is access all IScaleTransform_Interface'Class;
   type IScaleTransform_Ptr is access all IScaleTransform;
   type IScaleTransformStatics_Interface;
   type IScaleTransformStatics is access all IScaleTransformStatics_Interface'Class;
   type IScaleTransformStatics_Ptr is access all IScaleTransformStatics;
   type ISkewTransform_Interface;
   type ISkewTransform is access all ISkewTransform_Interface'Class;
   type ISkewTransform_Ptr is access all ISkewTransform;
   type ISkewTransformStatics_Interface;
   type ISkewTransformStatics is access all ISkewTransformStatics_Interface'Class;
   type ISkewTransformStatics_Ptr is access all ISkewTransformStatics;
   type ITransformGroup_Interface;
   type ITransformGroup is access all ITransformGroup_Interface'Class;
   type ITransformGroup_Ptr is access all ITransformGroup;
   type ITransformGroupStatics_Interface;
   type ITransformGroupStatics is access all ITransformGroupStatics_Interface'Class;
   type ITransformGroupStatics_Ptr is access all ITransformGroupStatics;
   type ITranslateTransform_Interface;
   type ITranslateTransform is access all ITranslateTransform_Interface'Class;
   type ITranslateTransform_Ptr is access all ITranslateTransform;
   type ITranslateTransformStatics_Interface;
   type ITranslateTransformStatics is access all ITranslateTransformStatics_Interface'Class;
   type ITranslateTransformStatics_Ptr is access all ITranslateTransformStatics;
   type IVector_Geometry_Interface;
   type IVector_Geometry is access all IVector_Geometry_Interface'Class;
   type IVector_Geometry_Ptr is access all IVector_Geometry;
   type IIterable_Geometry_Interface;
   type IIterable_Geometry is access all IIterable_Geometry_Interface'Class;
   type IIterable_Geometry_Ptr is access all IIterable_Geometry;
   type IVector_GradientStop_Interface;
   type IVector_GradientStop is access all IVector_GradientStop_Interface'Class;
   type IVector_GradientStop_Ptr is access all IVector_GradientStop;
   type IIterable_GradientStop_Interface;
   type IIterable_GradientStop is access all IIterable_GradientStop_Interface'Class;
   type IIterable_GradientStop_Ptr is access all IIterable_GradientStop;
   type ILoadedImageSourceLoadCompletedEventArgs_Interface;
   type ILoadedImageSourceLoadCompletedEventArgs is access all ILoadedImageSourceLoadCompletedEventArgs_Interface'Class;
   type ILoadedImageSourceLoadCompletedEventArgs_Ptr is access all ILoadedImageSourceLoadCompletedEventArgs;
   type ILoadedImageSurface_Interface;
   type ILoadedImageSurface is access all ILoadedImageSurface_Interface'Class;
   type ILoadedImageSurface_Ptr is access all ILoadedImageSurface;
   type ILoadedImageSurfaceStatics_Interface;
   type ILoadedImageSurfaceStatics is access all ILoadedImageSurfaceStatics_Interface'Class;
   type ILoadedImageSurfaceStatics_Ptr is access all ILoadedImageSurfaceStatics;
   type IVector_PathFigure_Interface;
   type IVector_PathFigure is access all IVector_PathFigure_Interface'Class;
   type IVector_PathFigure_Ptr is access all IVector_PathFigure;
   type IIterable_PathFigure_Interface;
   type IIterable_PathFigure is access all IIterable_PathFigure_Interface'Class;
   type IIterable_PathFigure_Ptr is access all IIterable_PathFigure;
   type IVector_PathSegment_Interface;
   type IVector_PathSegment is access all IVector_PathSegment_Interface'Class;
   type IVector_PathSegment_Ptr is access all IVector_PathSegment;
   type IIterable_PathSegment_Interface;
   type IIterable_PathSegment is access all IIterable_PathSegment_Interface'Class;
   type IIterable_PathSegment_Ptr is access all IIterable_PathSegment;
   type IGradientStop_Interface;
   type IGradientStop is access all IGradientStop_Interface'Class;
   type IGradientStop_Ptr is access all IGradientStop;
   type IGradientStopStatics_Interface;
   type IGradientStopStatics is access all IGradientStopStatics_Interface'Class;
   type IGradientStopStatics_Ptr is access all IGradientStopStatics;
   type IPathFigure_Interface;
   type IPathFigure is access all IPathFigure_Interface'Class;
   type IPathFigure_Ptr is access all IPathFigure;
   type IPathFigureStatics_Interface;
   type IPathFigureStatics is access all IPathFigureStatics_Interface'Class;
   type IPathFigureStatics_Ptr is access all IPathFigureStatics;
   type IArcSegment_Interface;
   type IArcSegment is access all IArcSegment_Interface'Class;
   type IArcSegment_Ptr is access all IArcSegment;
   type IArcSegmentStatics_Interface;
   type IArcSegmentStatics is access all IArcSegmentStatics_Interface'Class;
   type IArcSegmentStatics_Ptr is access all IArcSegmentStatics;
   type IBezierSegment_Interface;
   type IBezierSegment is access all IBezierSegment_Interface'Class;
   type IBezierSegment_Ptr is access all IBezierSegment;
   type IBezierSegmentStatics_Interface;
   type IBezierSegmentStatics is access all IBezierSegmentStatics_Interface'Class;
   type IBezierSegmentStatics_Ptr is access all IBezierSegmentStatics;
   type IEllipseGeometry_Interface;
   type IEllipseGeometry is access all IEllipseGeometry_Interface'Class;
   type IEllipseGeometry_Ptr is access all IEllipseGeometry;
   type IEllipseGeometryStatics_Interface;
   type IEllipseGeometryStatics is access all IEllipseGeometryStatics_Interface'Class;
   type IEllipseGeometryStatics_Ptr is access all IEllipseGeometryStatics;
   type IGeometryGroup_Interface;
   type IGeometryGroup is access all IGeometryGroup_Interface'Class;
   type IGeometryGroup_Ptr is access all IGeometryGroup;
   type IGeometryGroupStatics_Interface;
   type IGeometryGroupStatics is access all IGeometryGroupStatics_Interface'Class;
   type IGeometryGroupStatics_Ptr is access all IGeometryGroupStatics;
   type IGradientBrush_Interface;
   type IGradientBrush is access all IGradientBrush_Interface'Class;
   type IGradientBrush_Ptr is access all IGradientBrush;
   type IGradientBrushStatics_Interface;
   type IGradientBrushStatics is access all IGradientBrushStatics_Interface'Class;
   type IGradientBrushStatics_Ptr is access all IGradientBrushStatics;
   type IGradientBrushFactory_Interface;
   type IGradientBrushFactory is access all IGradientBrushFactory_Interface'Class;
   type IGradientBrushFactory_Ptr is access all IGradientBrushFactory;
   type ILineGeometry_Interface;
   type ILineGeometry is access all ILineGeometry_Interface'Class;
   type ILineGeometry_Ptr is access all ILineGeometry;
   type ILineGeometryStatics_Interface;
   type ILineGeometryStatics is access all ILineGeometryStatics_Interface'Class;
   type ILineGeometryStatics_Ptr is access all ILineGeometryStatics;
   type ILineSegment_Interface;
   type ILineSegment is access all ILineSegment_Interface'Class;
   type ILineSegment_Ptr is access all ILineSegment;
   type ILineSegmentStatics_Interface;
   type ILineSegmentStatics is access all ILineSegmentStatics_Interface'Class;
   type ILineSegmentStatics_Ptr is access all ILineSegmentStatics;
   type IPathGeometry_Interface;
   type IPathGeometry is access all IPathGeometry_Interface'Class;
   type IPathGeometry_Ptr is access all IPathGeometry;
   type IPathGeometryStatics_Interface;
   type IPathGeometryStatics is access all IPathGeometryStatics_Interface'Class;
   type IPathGeometryStatics_Ptr is access all IPathGeometryStatics;
   type IPolyBezierSegment_Interface;
   type IPolyBezierSegment is access all IPolyBezierSegment_Interface'Class;
   type IPolyBezierSegment_Ptr is access all IPolyBezierSegment;
   type IPolyBezierSegmentStatics_Interface;
   type IPolyBezierSegmentStatics is access all IPolyBezierSegmentStatics_Interface'Class;
   type IPolyBezierSegmentStatics_Ptr is access all IPolyBezierSegmentStatics;
   type IPolyLineSegment_Interface;
   type IPolyLineSegment is access all IPolyLineSegment_Interface'Class;
   type IPolyLineSegment_Ptr is access all IPolyLineSegment;
   type IPolyLineSegmentStatics_Interface;
   type IPolyLineSegmentStatics is access all IPolyLineSegmentStatics_Interface'Class;
   type IPolyLineSegmentStatics_Ptr is access all IPolyLineSegmentStatics;
   type IPolyQuadraticBezierSegment_Interface;
   type IPolyQuadraticBezierSegment is access all IPolyQuadraticBezierSegment_Interface'Class;
   type IPolyQuadraticBezierSegment_Ptr is access all IPolyQuadraticBezierSegment;
   type IPolyQuadraticBezierSegmentStatics_Interface;
   type IPolyQuadraticBezierSegmentStatics is access all IPolyQuadraticBezierSegmentStatics_Interface'Class;
   type IPolyQuadraticBezierSegmentStatics_Ptr is access all IPolyQuadraticBezierSegmentStatics;
   type IQuadraticBezierSegment_Interface;
   type IQuadraticBezierSegment is access all IQuadraticBezierSegment_Interface'Class;
   type IQuadraticBezierSegment_Ptr is access all IQuadraticBezierSegment;
   type IQuadraticBezierSegmentStatics_Interface;
   type IQuadraticBezierSegmentStatics is access all IQuadraticBezierSegmentStatics_Interface'Class;
   type IQuadraticBezierSegmentStatics_Ptr is access all IQuadraticBezierSegmentStatics;
   type ITileBrush_Interface;
   type ITileBrush is access all ITileBrush_Interface'Class;
   type ITileBrush_Ptr is access all ITileBrush;
   type ITileBrushStatics_Interface;
   type ITileBrushStatics is access all ITileBrushStatics_Interface'Class;
   type ITileBrushStatics_Ptr is access all ITileBrushStatics;
   type ITileBrushFactory_Interface;
   type ITileBrushFactory is access all ITileBrushFactory_Interface'Class;
   type ITileBrushFactory_Ptr is access all ITileBrushFactory;
   type IXamlCompositionBrushBase_Interface;
   type IXamlCompositionBrushBase is access all IXamlCompositionBrushBase_Interface'Class;
   type IXamlCompositionBrushBase_Ptr is access all IXamlCompositionBrushBase;
   type IXamlCompositionBrushBaseOverrides_Interface;
   type IXamlCompositionBrushBaseOverrides is access all IXamlCompositionBrushBaseOverrides_Interface'Class;
   type IXamlCompositionBrushBaseOverrides_Ptr is access all IXamlCompositionBrushBaseOverrides;
   type IXamlCompositionBrushBaseProtected_Interface;
   type IXamlCompositionBrushBaseProtected is access all IXamlCompositionBrushBaseProtected_Interface'Class;
   type IXamlCompositionBrushBaseProtected_Ptr is access all IXamlCompositionBrushBaseProtected;
   type IXamlCompositionBrushBaseStatics_Interface;
   type IXamlCompositionBrushBaseStatics is access all IXamlCompositionBrushBaseStatics_Interface'Class;
   type IXamlCompositionBrushBaseStatics_Ptr is access all IXamlCompositionBrushBaseStatics;
   type IXamlCompositionBrushBaseFactory_Interface;
   type IXamlCompositionBrushBaseFactory is access all IXamlCompositionBrushBaseFactory_Interface'Class;
   type IXamlCompositionBrushBaseFactory_Ptr is access all IXamlCompositionBrushBaseFactory;
   type IImageBrush_Interface;
   type IImageBrush is access all IImageBrush_Interface'Class;
   type IImageBrush_Ptr is access all IImageBrush;
   type IImageBrushStatics_Interface;
   type IImageBrushStatics is access all IImageBrushStatics_Interface'Class;
   type IImageBrushStatics_Ptr is access all IImageBrushStatics;
   type ILinearGradientBrush_Interface;
   type ILinearGradientBrush is access all ILinearGradientBrush_Interface'Class;
   type ILinearGradientBrush_Ptr is access all ILinearGradientBrush;
   type ILinearGradientBrushStatics_Interface;
   type ILinearGradientBrushStatics is access all ILinearGradientBrushStatics_Interface'Class;
   type ILinearGradientBrushStatics_Ptr is access all ILinearGradientBrushStatics;
   type ILinearGradientBrushFactory_Interface;
   type ILinearGradientBrushFactory is access all ILinearGradientBrushFactory_Interface'Class;
   type ILinearGradientBrushFactory_Ptr is access all ILinearGradientBrushFactory;
   type ICompositionSurface_Imported_Interface;
   type ICompositionSurface_Imported is access all ICompositionSurface_Imported_Interface'Class;
   type ICompositionSurface_Imported_Ptr is access all ICompositionSurface_Imported;
   type IIterator_IXamlLight_Interface;
   type IIterator_IXamlLight is access all IIterator_IXamlLight_Interface'Class;
   type IIterator_IXamlLight_Ptr is access all IIterator_IXamlLight;
   type IIterable_IXamlLight_Interface;
   type IIterable_IXamlLight is access all IIterable_IXamlLight_Interface'Class;
   type IIterable_IXamlLight_Ptr is access all IIterable_IXamlLight;
   type IVectorView_IXamlLight_Interface;
   type IVectorView_IXamlLight is access all IVectorView_IXamlLight_Interface'Class;
   type IVectorView_IXamlLight_Ptr is access all IVectorView_IXamlLight;
   type IVector_IXamlLight_Interface;
   type IVector_IXamlLight is access all IVector_IXamlLight_Interface'Class;
   type IVector_IXamlLight_Ptr is access all IVector_IXamlLight;
   type IIterator_IBrush_Interface;
   type IIterator_IBrush is access all IIterator_IBrush_Interface'Class;
   type IIterator_IBrush_Ptr is access all IIterator_IBrush;
   type IIterable_IBrush_Interface;
   type IIterable_IBrush is access all IIterable_IBrush_Interface'Class;
   type IIterable_IBrush_Ptr is access all IIterable_IBrush;
   type IVectorView_IBrush_Interface;
   type IVectorView_IBrush is access all IVectorView_IBrush_Interface'Class;
   type IVectorView_IBrush_Ptr is access all IVectorView_IBrush;
   type IVector_IBrush_Interface;
   type IVector_IBrush is access all IVector_IBrush_Interface'Class;
   type IVector_IBrush_Ptr is access all IVector_IBrush;
   
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
   type IAcrylicBrush_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BackgroundSource
   (
      This       : access IAcrylicBrush_Interface
      ; RetVal : access Windows.UI.Xaml.Media.AcrylicBackgroundSource
   )
   return Windows.HRESULT is abstract;
   
   function put_BackgroundSource
   (
      This       : access IAcrylicBrush_Interface
      ; value : Windows.UI.Xaml.Media.AcrylicBackgroundSource
   )
   return Windows.HRESULT is abstract;
   
   function get_TintColor
   (
      This       : access IAcrylicBrush_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_TintColor
   (
      This       : access IAcrylicBrush_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_TintOpacity
   (
      This       : access IAcrylicBrush_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_TintOpacity
   (
      This       : access IAcrylicBrush_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_TintTransitionDuration
   (
      This       : access IAcrylicBrush_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_TintTransitionDuration
   (
      This       : access IAcrylicBrush_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_AlwaysUseFallback
   (
      This       : access IAcrylicBrush_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AlwaysUseFallback
   (
      This       : access IAcrylicBrush_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IAcrylicBrush : aliased constant Windows.IID := (2042351438, 52582, 20251, (168, 182, 205, 109, 41, 119, 193, 141 ));
   
   ------------------------------------------------------------------------
   type IAcrylicBrushStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BackgroundSourceProperty
   (
      This       : access IAcrylicBrushStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TintColorProperty
   (
      This       : access IAcrylicBrushStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TintOpacityProperty
   (
      This       : access IAcrylicBrushStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TintTransitionDurationProperty
   (
      This       : access IAcrylicBrushStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_AlwaysUseFallbackProperty
   (
      This       : access IAcrylicBrushStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IAcrylicBrushStatics : aliased constant Windows.IID := (663223673, 41946, 16959, (184, 26, 89, 145, 71, 151, 21, 35 ));
   
   ------------------------------------------------------------------------
   type IAcrylicBrushFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IAcrylicBrushFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.IAcrylicBrush
   )
   return Windows.HRESULT is abstract;
   
   IID_IAcrylicBrushFactory : aliased constant Windows.IID := (2174952808, 63180, 16403, (131, 99, 146, 138, 226, 59, 122, 97 ));
   
   ------------------------------------------------------------------------
   type IRevealBrush_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Color
   (
      This       : access IRevealBrush_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_Color
   (
      This       : access IRevealBrush_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_TargetTheme
   (
      This       : access IRevealBrush_Interface
      ; RetVal : access Windows.UI.Xaml.ApplicationTheme
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetTheme
   (
      This       : access IRevealBrush_Interface
      ; value : Windows.UI.Xaml.ApplicationTheme
   )
   return Windows.HRESULT is abstract;
   
   function get_AlwaysUseFallback
   (
      This       : access IRevealBrush_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AlwaysUseFallback
   (
      This       : access IRevealBrush_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IRevealBrush : aliased constant Windows.IID := (540451053, 33393, 17304, (144, 25, 37, 135, 32, 147, 241, 63 ));
   
   ------------------------------------------------------------------------
   type IRevealBrushFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IRevealBrushFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.IRevealBrush
   )
   return Windows.HRESULT is abstract;
   
   IID_IRevealBrushFactory : aliased constant Windows.IID := (2643687886, 58272, 19119, (190, 55, 234, 157, 157, 212, 49, 5 ));
   
   ------------------------------------------------------------------------
   type IRevealBrushStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ColorProperty
   (
      This       : access IRevealBrushStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TargetThemeProperty
   (
      This       : access IRevealBrushStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_AlwaysUseFallbackProperty
   (
      This       : access IRevealBrushStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_StateProperty
   (
      This       : access IRevealBrushStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function SetState
   (
      This       : access IRevealBrushStatics_Interface
      ; element : Windows.UI.Xaml.IUIElement
      ; value : Windows.UI.Xaml.Media.RevealBrushState
   )
   return Windows.HRESULT is abstract;
   
   function GetState
   (
      This       : access IRevealBrushStatics_Interface
      ; element : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.UI.Xaml.Media.RevealBrushState
   )
   return Windows.HRESULT is abstract;
   
   IID_IRevealBrushStatics : aliased constant Windows.IID := (420423205, 29193, 19778, (168, 71, 26, 196, 187, 187, 52, 153 ));
   
   ------------------------------------------------------------------------
   type IRevealBorderBrushFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IRevealBorderBrushFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.IRevealBorderBrush
   )
   return Windows.HRESULT is abstract;
   
   IID_IRevealBorderBrushFactory : aliased constant Windows.IID := (2495763096, 62968, 17538, (162, 92, 103, 88, 80, 26, 134, 38 ));
   
   ------------------------------------------------------------------------
   type IRevealBorderBrush_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IRevealBorderBrush : aliased constant Windows.IID := (101425429, 50498, 18492, (130, 2, 95, 3, 51, 24, 102, 201 ));
   
   ------------------------------------------------------------------------
   type IRevealBackgroundBrushFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IRevealBackgroundBrushFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.IRevealBackgroundBrush
   )
   return Windows.HRESULT is abstract;
   
   IID_IRevealBackgroundBrushFactory : aliased constant Windows.IID := (2354494634, 677, 20293, (133, 6, 141, 57, 34, 143, 93, 63 ));
   
   ------------------------------------------------------------------------
   type IRevealBackgroundBrush_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IRevealBackgroundBrush : aliased constant Windows.IID := (639486990, 6545, 19679, (174, 224, 99, 80, 163, 249, 11, 185 ));
   
   ------------------------------------------------------------------------
   type IVisualTreeHelper_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IVisualTreeHelper : aliased constant Windows.IID := (616117731, 21191, 16705, (139, 172, 167, 61, 6, 19, 5, 105 ));
   
   ------------------------------------------------------------------------
   type IVisualTreeHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FindElementsInHostCoordinatesPoint
   (
      This       : access IVisualTreeHelperStatics_Interface
      ; intersectingPoint : Windows.Foundation.Point
      ; subtree : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.UI.Xaml.IIterable_IUIElement -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindElementsInHostCoordinatesRect
   (
      This       : access IVisualTreeHelperStatics_Interface
      ; intersectingRect : Windows.Foundation.Rect
      ; subtree : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.UI.Xaml.IIterable_IUIElement -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAllElementsInHostCoordinatesPoint
   (
      This       : access IVisualTreeHelperStatics_Interface
      ; intersectingPoint : Windows.Foundation.Point
      ; subtree : Windows.UI.Xaml.IUIElement
      ; includeAllElements : Windows.Boolean
      ; RetVal : access Windows.UI.Xaml.IIterable_IUIElement -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAllElementsInHostCoordinatesRect
   (
      This       : access IVisualTreeHelperStatics_Interface
      ; intersectingRect : Windows.Foundation.Rect
      ; subtree : Windows.UI.Xaml.IUIElement
      ; includeAllElements : Windows.Boolean
      ; RetVal : access Windows.UI.Xaml.IIterable_IUIElement -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetChild
   (
      This       : access IVisualTreeHelperStatics_Interface
      ; reference : Windows.UI.Xaml.IDependencyObject
      ; childIndex : Windows.Int32
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function GetChildrenCount
   (
      This       : access IVisualTreeHelperStatics_Interface
      ; reference : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function GetParent
   (
      This       : access IVisualTreeHelperStatics_Interface
      ; reference : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function DisconnectChildrenRecursive
   (
      This       : access IVisualTreeHelperStatics_Interface
      ; element : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   IID_IVisualTreeHelperStatics : aliased constant Windows.IID := (3881261252, 53853, 19229, (151, 31, 89, 111, 23, 241, 43, 170 ));
   
   ------------------------------------------------------------------------
   type IVisualTreeHelperStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetOpenPopups
   (
      This       : access IVisualTreeHelperStatics2_Interface
      ; window : Windows.UI.Xaml.IWindow
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.IVectorView_IPopup -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IVisualTreeHelperStatics2 : aliased constant Windows.IID := (129814902, 34463, 17575, (135, 151, 33, 3, 164, 195, 228, 122 ));
   
   ------------------------------------------------------------------------
   type IPartialMediaFailureDetectedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StreamKind
   (
      This       : access IPartialMediaFailureDetectedEventArgs_Interface
      ; RetVal : access Windows.Media.Playback.FailedMediaStreamKind
   )
   return Windows.HRESULT is abstract;
   
   IID_IPartialMediaFailureDetectedEventArgs : aliased constant Windows.IID := (45505169, 58785, 17451, (136, 211, 45, 193, 39, 191, 197, 155 ));
   
   ------------------------------------------------------------------------
   type IPartialMediaFailureDetectedEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExtendedError
   (
      This       : access IPartialMediaFailureDetectedEventArgs2_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IPartialMediaFailureDetectedEventArgs2 : aliased constant Windows.IID := (1929857141, 35085, 16747, (185, 174, 232, 77, 253, 156, 75, 27 ));
   
   ------------------------------------------------------------------------
   type IMatrixHelper_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IMatrixHelper : aliased constant Windows.IID := (4090448002, 1717, 18632, (158, 178, 23, 99, 233, 54, 64, 56 ));
   
   ------------------------------------------------------------------------
   type IMatrixHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Identity
   (
      This       : access IMatrixHelperStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Matrix
   )
   return Windows.HRESULT is abstract;
   
   function FromElements
   (
      This       : access IMatrixHelperStatics_Interface
      ; m11 : Windows.Double
      ; m12 : Windows.Double
      ; m21 : Windows.Double
      ; m22 : Windows.Double
      ; offsetX : Windows.Double
      ; offsetY : Windows.Double
      ; RetVal : access Windows.UI.Xaml.Media.Matrix
   )
   return Windows.HRESULT is abstract;
   
   function GetIsIdentity
   (
      This       : access IMatrixHelperStatics_Interface
      ; target : Windows.UI.Xaml.Media.Matrix
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Transform_x
   (
      This       : access IMatrixHelperStatics_Interface
      ; target : Windows.UI.Xaml.Media.Matrix
      ; point : Windows.Foundation.Point
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   IID_IMatrixHelperStatics : aliased constant Windows.IID := (3246786214, 14836, 19338, (132, 3, 40, 229, 229, 240, 51, 180 ));
   
   ------------------------------------------------------------------------
   type IVector_Brush_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_Brush_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_Brush_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_Brush_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_Brush_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_Brush_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_Brush_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_Brush_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_Brush_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_Brush_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_Brush_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_Brush_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Media.IBrush_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_Brush_Interface
      ; items : Windows.UI.Xaml.Media.IBrush_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_Brush : aliased constant Windows.IID := (2832041188, 16095, 20850, (143, 119, 16, 233, 16, 229, 220, 93 ));
   
   ------------------------------------------------------------------------
   type IIterable_Brush_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_Brush_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_Brush : aliased constant Windows.IID := (2961085141, 1715, 24018, (141, 73, 52, 159, 251, 216, 70, 52 ));
   
   ------------------------------------------------------------------------
   type ICompositionTarget_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ICompositionTarget : aliased constant Windows.IID := (651149296, 28988, 19436, (136, 3, 225, 1, 247, 177, 78, 211 ));
   
   ------------------------------------------------------------------------
   type ICompositionTargetStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function add_Rendering
   (
      This       : access ICompositionTargetStatics_Interface
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Rendering
   (
      This       : access ICompositionTargetStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SurfaceContentsLost
   (
      This       : access ICompositionTargetStatics_Interface
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SurfaceContentsLost
   (
      This       : access ICompositionTargetStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_ICompositionTargetStatics : aliased constant Windows.IID := (723185725, 7890, 19289, (189, 0, 117, 148, 238, 146, 131, 43 ));
   
   ------------------------------------------------------------------------
   type IVector_Double_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_Double_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_Double_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_Double_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_Double_Interface
      ; value : Windows.Double
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_Double_Interface
      ; index : Windows.UInt32
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_Double_Interface
      ; index : Windows.UInt32
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_Double_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_Double_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_Double_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_Double_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_Double_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Double_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_Double_Interface
      ; items : Windows.Double_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_Double : aliased constant Windows.IID := (4099068476, 48901, 24382, (136, 231, 209, 122, 103, 22, 185, 17 ));
   
   ------------------------------------------------------------------------
   type IIterable_Double_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_Double_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_Double : aliased constant Windows.IID := (3342374478, 40036, 23502, (181, 206, 97, 233, 162, 130, 236, 74 ));
   
   ------------------------------------------------------------------------
   type IFontFamily_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Source
   (
      This       : access IFontFamily_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IFontFamily : aliased constant Windows.IID := (2454093412, 54890, 19700, (147, 34, 61, 35, 179, 192, 195, 97 ));
   
   ------------------------------------------------------------------------
   type IFontFamilyFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithName
   (
      This       : access IFontFamilyFactory_Interface
      ; familyName : Windows.String
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.IFontFamily
   )
   return Windows.HRESULT is abstract;
   
   IID_IFontFamilyFactory : aliased constant Windows.IID := (3579851639, 15790, 19917, (175, 9, 249, 73, 142, 158, 198, 89 ));
   
   ------------------------------------------------------------------------
   type IFontFamilyStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_XamlAutoFontFamily
   (
      This       : access IFontFamilyStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IFontFamily
   )
   return Windows.HRESULT is abstract;
   
   IID_IFontFamilyStatics2 : aliased constant Windows.IID := (1387100921, 14310, 17047, (162, 56, 151, 251, 106, 64, 141, 158 ));
   
   ------------------------------------------------------------------------
   type IMediaTransportControlsThumbnailRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function SetThumbnailImage
   (
      This       : access IMediaTransportControlsThumbnailRequestedEventArgs_Interface
      ; source : Windows.Storage.Streams.IInputStream
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IMediaTransportControlsThumbnailRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaTransportControlsThumbnailRequestedEventArgs : aliased constant Windows.IID := (3836260892, 58306, 18524, (174, 105, 241, 83, 123, 118, 117, 90 ));
   
   ------------------------------------------------------------------------
   type IVector_Point_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_Point_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_Point_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_Point_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_Point_Interface
      ; value : Windows.Foundation.Point
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_Point_Interface
      ; index : Windows.UInt32
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_Point_Interface
      ; index : Windows.UInt32
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_Point_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_Point_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_Point_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_Point_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_Point_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Foundation.Point_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_Point_Interface
      ; items : Windows.Foundation.Point_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_Point : aliased constant Windows.IID := (3235189673, 60490, 23133, (182, 213, 183, 7, 222, 253, 185, 247 ));
   
   ------------------------------------------------------------------------
   type IIterable_Point_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_Point_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_Point : aliased constant Windows.IID := (3247581197, 14857, 21539, (157, 197, 103, 184, 62, 189, 228, 29 ));
   
   ------------------------------------------------------------------------
   type IRenderingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RenderingTime
   (
      This       : access IRenderingEventArgs_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   IID_IRenderingEventArgs : aliased constant Windows.IID := (1542968077, 38728, 19181, (131, 128, 215, 137, 14, 183, 118, 160 ));
   
   ------------------------------------------------------------------------
   type IVector_TimelineMarker_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_TimelineMarker_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Media.ITimelineMarker
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_TimelineMarker_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_TimelineMarker_Interface
      ; RetVal : access Windows.UI.Xaml.Media.ITimelineMarker
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_TimelineMarker_Interface
      ; value : Windows.UI.Xaml.Media.ITimelineMarker
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_TimelineMarker_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.ITimelineMarker
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_TimelineMarker_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.ITimelineMarker
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_TimelineMarker_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_TimelineMarker_Interface
      ; value : Windows.UI.Xaml.Media.ITimelineMarker
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_TimelineMarker_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_TimelineMarker_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_TimelineMarker_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Media.ITimelineMarker_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_TimelineMarker_Interface
      ; items : Windows.UI.Xaml.Media.ITimelineMarker_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_TimelineMarker : aliased constant Windows.IID := (3000556980, 53944, 22832, (148, 45, 38, 17, 135, 86, 189, 70 ));
   
   ------------------------------------------------------------------------
   type IIterable_TimelineMarker_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_TimelineMarker_Interface
      ; RetVal : access Windows.UI.Xaml.Media.ITimelineMarker
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_TimelineMarker : aliased constant Windows.IID := (2490129141, 19465, 22404, (156, 242, 80, 105, 71, 55, 142, 142 ));
   
   ------------------------------------------------------------------------
   type IVector_Transform_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_Transform_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Media.ITransform
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_Transform_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_Transform_Interface
      ; RetVal : access Windows.UI.Xaml.Media.ITransform
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_Transform_Interface
      ; value : Windows.UI.Xaml.Media.ITransform
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_Transform_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.ITransform
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_Transform_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.ITransform
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_Transform_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_Transform_Interface
      ; value : Windows.UI.Xaml.Media.ITransform
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_Transform_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_Transform_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_Transform_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Media.ITransform_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_Transform_Interface
      ; items : Windows.UI.Xaml.Media.ITransform_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_Transform : aliased constant Windows.IID := (1658305473, 29173, 22033, (169, 132, 229, 113, 194, 222, 123, 170 ));
   
   ------------------------------------------------------------------------
   type IIterable_Transform_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_Transform_Interface
      ; RetVal : access Windows.UI.Xaml.Media.ITransform
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_Transform : aliased constant Windows.IID := (4220300476, 54252, 20920, (151, 120, 153, 237, 232, 70, 54, 17 ));
   
   ------------------------------------------------------------------------
   type IBrush_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Opacity
   (
      This       : access IBrush_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Opacity
   (
      This       : access IBrush_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Transform
   (
      This       : access IBrush_Interface
      ; RetVal : access Windows.UI.Xaml.Media.ITransform
   )
   return Windows.HRESULT is abstract;
   
   function put_Transform
   (
      This       : access IBrush_Interface
      ; value : Windows.UI.Xaml.Media.ITransform
   )
   return Windows.HRESULT is abstract;
   
   function get_RelativeTransform
   (
      This       : access IBrush_Interface
      ; RetVal : access Windows.UI.Xaml.Media.ITransform
   )
   return Windows.HRESULT is abstract;
   
   function put_RelativeTransform
   (
      This       : access IBrush_Interface
      ; value : Windows.UI.Xaml.Media.ITransform
   )
   return Windows.HRESULT is abstract;
   
   IID_IBrush : aliased constant Windows.IID := (2282136353, 7686, 16940, (161, 204, 1, 105, 101, 89, 224, 33 ));
   
   ------------------------------------------------------------------------
   type IBrushStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OpacityProperty
   (
      This       : access IBrushStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TransformProperty
   (
      This       : access IBrushStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RelativeTransformProperty
   (
      This       : access IBrushStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IBrushStatics : aliased constant Windows.IID := (3876335874, 549, 18421, (178, 46, 4, 103, 97, 159, 106, 34 ));
   
   ------------------------------------------------------------------------
   type IBrushFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IBrushFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   IID_IBrushFactory : aliased constant Windows.IID := (966154402, 5371, 19343, (131, 230, 110, 61, 171, 18, 6, 155 ));
   
   ------------------------------------------------------------------------
   type ICacheMode_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ICacheMode : aliased constant Windows.IID := (2564590353, 50937, 19883, (184, 56, 95, 213, 236, 140, 115, 80 ));
   
   ------------------------------------------------------------------------
   type ICacheModeFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access ICacheModeFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.ICacheMode
   )
   return Windows.HRESULT is abstract;
   
   IID_ICacheModeFactory : aliased constant Windows.IID := (3944713307, 2747, 20080, (184, 168, 98, 13, 13, 149, 58, 178 ));
   
   ------------------------------------------------------------------------
   type IGeneralTransform_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Inverse
   (
      This       : access IGeneralTransform_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IGeneralTransform
   )
   return Windows.HRESULT is abstract;
   
   function TransformPoint
   (
      This       : access IGeneralTransform_Interface
      ; point : Windows.Foundation.Point
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function TryTransform
   (
      This       : access IGeneralTransform_Interface
      ; inPoint : Windows.Foundation.Point
      ; outPoint : access Windows.Foundation.Point
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TransformBounds
   (
      This       : access IGeneralTransform_Interface
      ; rect : Windows.Foundation.Rect
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeneralTransform : aliased constant Windows.IID := (2691143863, 41708, 16735, (173, 226, 234, 222, 147, 51, 242, 199 ));
   
   ------------------------------------------------------------------------
   type IGeneralTransformOverrides_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InverseCore
   (
      This       : access IGeneralTransformOverrides_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IGeneralTransform
   )
   return Windows.HRESULT is abstract;
   
   function TryTransformCore
   (
      This       : access IGeneralTransformOverrides_Interface
      ; inPoint : Windows.Foundation.Point
      ; outPoint : access Windows.Foundation.Point
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TransformBoundsCore
   (
      This       : access IGeneralTransformOverrides_Interface
      ; rect : Windows.Foundation.Rect
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeneralTransformOverrides : aliased constant Windows.IID := (1326583939, 9423, 17700, (144, 173, 138, 66, 177, 193, 39, 131 ));
   
   ------------------------------------------------------------------------
   type IGeneralTransformFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IGeneralTransformFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.IGeneralTransform
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeneralTransformFactory : aliased constant Windows.IID := (2049296688, 10692, 20017, (182, 249, 222, 221, 82, 228, 223, 27 ));
   
   ------------------------------------------------------------------------
   type IGeometry_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Transform
   (
      This       : access IGeometry_Interface
      ; RetVal : access Windows.UI.Xaml.Media.ITransform
   )
   return Windows.HRESULT is abstract;
   
   function put_Transform
   (
      This       : access IGeometry_Interface
      ; value : Windows.UI.Xaml.Media.ITransform
   )
   return Windows.HRESULT is abstract;
   
   function get_Bounds
   (
      This       : access IGeometry_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeometry : aliased constant Windows.IID := (4195498121, 2765, 16763, (182, 45, 92, 161, 191, 77, 252, 14 ));
   
   ------------------------------------------------------------------------
   type IGeometryStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Empty
   (
      This       : access IGeometryStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IGeometry
   )
   return Windows.HRESULT is abstract;
   
   function get_StandardFlatteningTolerance
   (
      This       : access IGeometryStatics_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_TransformProperty
   (
      This       : access IGeometryStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeometryStatics : aliased constant Windows.IID := (2054204044, 2822, 18015, (182, 55, 154, 71, 229, 167, 1, 17 ));
   
   ------------------------------------------------------------------------
   type IGeometryFactory_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IGeometryFactory : aliased constant Windows.IID := (4133334819, 54781, 17145, (179, 42, 146, 156, 90, 75, 84, 225 ));
   
   ------------------------------------------------------------------------
   type IImageSource_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IImageSource : aliased constant Windows.IID := (1937699593, 59969, 19862, (167, 28, 152, 233, 142, 252, 171, 7 ));
   
   ------------------------------------------------------------------------
   type IImageSourceFactory_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IImageSourceFactory : aliased constant Windows.IID := (696172545, 9536, 20058, (171, 102, 136, 3, 93, 211, 221, 181 ));
   
   ------------------------------------------------------------------------
   type IPathSegment_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IPathSegment : aliased constant Windows.IID := (4244271567, 40163, 18255, (129, 87, 16, 182, 67, 90, 97, 107 ));
   
   ------------------------------------------------------------------------
   type IPathSegmentFactory_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IPathSegmentFactory : aliased constant Windows.IID := (706480814, 60621, 17508, (161, 72, 111, 253, 179, 170, 40, 31 ));
   
   ------------------------------------------------------------------------
   type IProjection_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IProjection : aliased constant Windows.IID := (3007591767, 32569, 19716, (168, 156, 132, 67, 56, 202, 200, 151 ));
   
   ------------------------------------------------------------------------
   type IProjectionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IProjectionFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.IProjection
   )
   return Windows.HRESULT is abstract;
   
   IID_IProjectionFactory : aliased constant Windows.IID := (3304234155, 24749, 20260, (189, 39, 157, 105, 195, 18, 124, 154 ));
   
   ------------------------------------------------------------------------
   type IRateChangedRoutedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IRateChangedRoutedEventArgs : aliased constant Windows.IID := (2417404527, 15528, 19584, (142, 47, 136, 81, 166, 143, 19, 31 ));
   
   ------------------------------------------------------------------------
   type ITimelineMarker_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Time
   (
      This       : access ITimelineMarker_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_Time
   (
      This       : access ITimelineMarker_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Type
   (
      This       : access ITimelineMarker_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Type
   (
      This       : access ITimelineMarker_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Text
   (
      This       : access ITimelineMarker_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Text
   (
      This       : access ITimelineMarker_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_ITimelineMarker : aliased constant Windows.IID := (2794385453, 17850, 20048, (140, 173, 170, 234, 58, 34, 122, 245 ));
   
   ------------------------------------------------------------------------
   type ITimelineMarkerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TimeProperty
   (
      This       : access ITimelineMarkerStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TypeProperty
   (
      This       : access ITimelineMarkerStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TextProperty
   (
      This       : access ITimelineMarkerStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ITimelineMarkerStatics : aliased constant Windows.IID := (3299799238, 5795, 18507, (135, 245, 101, 40, 184, 240, 74, 71 ));
   
   ------------------------------------------------------------------------
   type ITimelineMarkerRoutedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Marker
   (
      This       : access ITimelineMarkerRoutedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Media.ITimelineMarker
   )
   return Windows.HRESULT is abstract;
   
   function put_Marker
   (
      This       : access ITimelineMarkerRoutedEventArgs_Interface
      ; value : Windows.UI.Xaml.Media.ITimelineMarker
   )
   return Windows.HRESULT is abstract;
   
   IID_ITimelineMarkerRoutedEventArgs : aliased constant Windows.IID := (2084257523, 11400, 19868, (153, 182, 70, 205, 189, 72, 212, 193 ));
   
   ------------------------------------------------------------------------
   type IXamlLight_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IXamlLight : aliased constant Windows.IID := (214170655, 45863, 18968, (150, 72, 124, 132, 219, 38, 206, 34 ));
   
   ------------------------------------------------------------------------
   type IXamlLightOverrides_Interface is interface and Windows.IInspectable_Interface;
   
   function GetId
   (
      This       : access IXamlLightOverrides_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function OnConnected
   (
      This       : access IXamlLightOverrides_Interface
      ; newElement : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function OnDisconnected
   (
      This       : access IXamlLightOverrides_Interface
      ; oldElement : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   IID_IXamlLightOverrides : aliased constant Windows.IID := (2086835911, 371, 18657, (183, 61, 127, 162, 22, 169, 172, 40 ));
   
   ------------------------------------------------------------------------
   type IXamlLightProtected_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CompositionLight
   (
      This       : access IXamlLightProtected_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionLight
   )
   return Windows.HRESULT is abstract;
   
   function put_CompositionLight
   (
      This       : access IXamlLightProtected_Interface
      ; value : Windows.UI.Composition.ICompositionLight
   )
   return Windows.HRESULT is abstract;
   
   IID_IXamlLightProtected : aliased constant Windows.IID := (1590632971, 4690, 17360, (151, 41, 110, 166, 146, 4, 104, 56 ));
   
   ------------------------------------------------------------------------
   type IXamlLightStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function AddTargetElement
   (
      This       : access IXamlLightStatics_Interface
      ; lightId : Windows.String
      ; element : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function RemoveTargetElement
   (
      This       : access IXamlLightStatics_Interface
      ; lightId : Windows.String
      ; element : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function AddTargetBrush
   (
      This       : access IXamlLightStatics_Interface
      ; lightId : Windows.String
      ; brush : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function RemoveTargetBrush
   (
      This       : access IXamlLightStatics_Interface
      ; lightId : Windows.String
      ; brush : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   IID_IXamlLightStatics : aliased constant Windows.IID := (3052051817, 46344, 20124, (189, 39, 107, 4, 75, 95, 120, 160 ));
   
   ------------------------------------------------------------------------
   type IXamlLightFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IXamlLightFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.IXamlLight
   )
   return Windows.HRESULT is abstract;
   
   IID_IXamlLightFactory : aliased constant Windows.IID := (2279528296, 12373, 17336, (142, 246, 121, 141, 196, 194, 50, 154 ));
   
   ------------------------------------------------------------------------
   type IBitmapCache_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IBitmapCache : aliased constant Windows.IID := (2042765726, 17618, 17936, (151, 53, 155, 236, 131, 128, 158, 207 ));
   
   ------------------------------------------------------------------------
   type IMatrix3DProjection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProjectionMatrix
   (
      This       : access IMatrix3DProjection_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Media3D.Matrix3D
   )
   return Windows.HRESULT is abstract;
   
   function put_ProjectionMatrix
   (
      This       : access IMatrix3DProjection_Interface
      ; value : Windows.UI.Xaml.Media.Media3D.Matrix3D
   )
   return Windows.HRESULT is abstract;
   
   IID_IMatrix3DProjection : aliased constant Windows.IID := (1862525257, 49097, 19457, (181, 120, 80, 51, 140, 236, 151, 252 ));
   
   ------------------------------------------------------------------------
   type IMatrix3DProjectionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProjectionMatrixProperty
   (
      This       : access IMatrix3DProjectionStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IMatrix3DProjectionStatics : aliased constant Windows.IID := (2929547413, 16876, 20023, (171, 170, 105, 244, 29, 47, 135, 107 ));
   
   ------------------------------------------------------------------------
   type IPlaneProjection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LocalOffsetX
   (
      This       : access IPlaneProjection_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_LocalOffsetX
   (
      This       : access IPlaneProjection_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalOffsetY
   (
      This       : access IPlaneProjection_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_LocalOffsetY
   (
      This       : access IPlaneProjection_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalOffsetZ
   (
      This       : access IPlaneProjection_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_LocalOffsetZ
   (
      This       : access IPlaneProjection_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationX
   (
      This       : access IPlaneProjection_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_RotationX
   (
      This       : access IPlaneProjection_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationY
   (
      This       : access IPlaneProjection_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_RotationY
   (
      This       : access IPlaneProjection_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationZ
   (
      This       : access IPlaneProjection_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_RotationZ
   (
      This       : access IPlaneProjection_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_CenterOfRotationX
   (
      This       : access IPlaneProjection_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_CenterOfRotationX
   (
      This       : access IPlaneProjection_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_CenterOfRotationY
   (
      This       : access IPlaneProjection_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_CenterOfRotationY
   (
      This       : access IPlaneProjection_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_CenterOfRotationZ
   (
      This       : access IPlaneProjection_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_CenterOfRotationZ
   (
      This       : access IPlaneProjection_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_GlobalOffsetX
   (
      This       : access IPlaneProjection_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_GlobalOffsetX
   (
      This       : access IPlaneProjection_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_GlobalOffsetY
   (
      This       : access IPlaneProjection_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_GlobalOffsetY
   (
      This       : access IPlaneProjection_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_GlobalOffsetZ
   (
      This       : access IPlaneProjection_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_GlobalOffsetZ
   (
      This       : access IPlaneProjection_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ProjectionMatrix
   (
      This       : access IPlaneProjection_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Media3D.Matrix3D
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlaneProjection : aliased constant Windows.IID := (3875023866, 26406, 18074, (178, 89, 165, 24, 131, 71, 202, 143 ));
   
   ------------------------------------------------------------------------
   type IPlaneProjectionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LocalOffsetXProperty
   (
      This       : access IPlaneProjectionStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalOffsetYProperty
   (
      This       : access IPlaneProjectionStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalOffsetZProperty
   (
      This       : access IPlaneProjectionStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationXProperty
   (
      This       : access IPlaneProjectionStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationYProperty
   (
      This       : access IPlaneProjectionStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationZProperty
   (
      This       : access IPlaneProjectionStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CenterOfRotationXProperty
   (
      This       : access IPlaneProjectionStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CenterOfRotationYProperty
   (
      This       : access IPlaneProjectionStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CenterOfRotationZProperty
   (
      This       : access IPlaneProjectionStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_GlobalOffsetXProperty
   (
      This       : access IPlaneProjectionStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_GlobalOffsetYProperty
   (
      This       : access IPlaneProjectionStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_GlobalOffsetZProperty
   (
      This       : access IPlaneProjectionStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ProjectionMatrixProperty
   (
      This       : access IPlaneProjectionStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlaneProjectionStatics : aliased constant Windows.IID := (2912001127, 15324, 18517, (137, 105, 209, 249, 163, 173, 194, 125 ));
   
   ------------------------------------------------------------------------
   type IRectangleGeometry_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Rect
   (
      This       : access IRectangleGeometry_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function put_Rect
   (
      This       : access IRectangleGeometry_Interface
      ; value : Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   IID_IRectangleGeometry : aliased constant Windows.IID := (2723815256, 50549, 16790, (145, 207, 159, 223, 177, 4, 69, 195 ));
   
   ------------------------------------------------------------------------
   type IRectangleGeometryStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RectProperty
   (
      This       : access IRectangleGeometryStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IRectangleGeometryStatics : aliased constant Windows.IID := (931106234, 30978, 18659, (131, 190, 124, 128, 2, 166, 101, 60 ));
   
   ------------------------------------------------------------------------
   type ISolidColorBrush_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Color
   (
      This       : access ISolidColorBrush_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_Color
   (
      This       : access ISolidColorBrush_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   IID_ISolidColorBrush : aliased constant Windows.IID := (2642741328, 26355, 18655, (154, 143, 130, 75, 213, 224, 112, 175 ));
   
   ------------------------------------------------------------------------
   type ISolidColorBrushStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ColorProperty
   (
      This       : access ISolidColorBrushStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ISolidColorBrushStatics : aliased constant Windows.IID := (3785776890, 11043, 16826, (185, 186, 112, 148, 236, 142, 78, 159 ));
   
   ------------------------------------------------------------------------
   type ISolidColorBrushFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithColor
   (
      This       : access ISolidColorBrushFactory_Interface
      ; color : Windows.UI.Color
      ; RetVal : access Windows.UI.Xaml.Media.ISolidColorBrush
   )
   return Windows.HRESULT is abstract;
   
   IID_ISolidColorBrushFactory : aliased constant Windows.IID := (3644182028, 34549, 19878, (138, 39, 177, 97, 158, 247, 249, 43 ));
   
   ------------------------------------------------------------------------
   type ITransform_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ITransform : aliased constant Windows.IID := (1308049528, 49110, 20177, (150, 130, 210, 253, 139, 242, 254, 111 ));
   
   ------------------------------------------------------------------------
   type ITransformFactory_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ITransformFactory : aliased constant Windows.IID := (445995622, 31988, 17184, (180, 22, 97, 129, 25, 47, 204, 109 ));
   
   ------------------------------------------------------------------------
   type ICompositeTransform_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CenterX
   (
      This       : access ICompositeTransform_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_CenterX
   (
      This       : access ICompositeTransform_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_CenterY
   (
      This       : access ICompositeTransform_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_CenterY
   (
      This       : access ICompositeTransform_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ScaleX
   (
      This       : access ICompositeTransform_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_ScaleX
   (
      This       : access ICompositeTransform_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ScaleY
   (
      This       : access ICompositeTransform_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_ScaleY
   (
      This       : access ICompositeTransform_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_SkewX
   (
      This       : access ICompositeTransform_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_SkewX
   (
      This       : access ICompositeTransform_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_SkewY
   (
      This       : access ICompositeTransform_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_SkewY
   (
      This       : access ICompositeTransform_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Rotation
   (
      This       : access ICompositeTransform_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Rotation
   (
      This       : access ICompositeTransform_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_TranslateX
   (
      This       : access ICompositeTransform_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_TranslateX
   (
      This       : access ICompositeTransform_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_TranslateY
   (
      This       : access ICompositeTransform_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_TranslateY
   (
      This       : access ICompositeTransform_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_ICompositeTransform : aliased constant Windows.IID := (3366205531, 62026, 18177, (162, 101, 167, 136, 70, 241, 66, 185 ));
   
   ------------------------------------------------------------------------
   type ICompositeTransformStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CenterXProperty
   (
      This       : access ICompositeTransformStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CenterYProperty
   (
      This       : access ICompositeTransformStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ScaleXProperty
   (
      This       : access ICompositeTransformStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ScaleYProperty
   (
      This       : access ICompositeTransformStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SkewXProperty
   (
      This       : access ICompositeTransformStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SkewYProperty
   (
      This       : access ICompositeTransformStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationProperty
   (
      This       : access ICompositeTransformStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TranslateXProperty
   (
      This       : access ICompositeTransformStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TranslateYProperty
   (
      This       : access ICompositeTransformStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ICompositeTransformStatics : aliased constant Windows.IID := (790170632, 33382, 18799, (150, 83, 161, 139, 212, 248, 54, 170 ));
   
   ------------------------------------------------------------------------
   type IMatrixTransform_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Matrix
   (
      This       : access IMatrixTransform_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Matrix
   )
   return Windows.HRESULT is abstract;
   
   function put_Matrix
   (
      This       : access IMatrixTransform_Interface
      ; value : Windows.UI.Xaml.Media.Matrix
   )
   return Windows.HRESULT is abstract;
   
   IID_IMatrixTransform : aliased constant Windows.IID := (3992835409, 24557, 17916, (174, 98, 146, 164, 182, 207, 151, 7 ));
   
   ------------------------------------------------------------------------
   type IMatrixTransformStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MatrixProperty
   (
      This       : access IMatrixTransformStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IMatrixTransformStatics : aliased constant Windows.IID := (1138765383, 5560, 18264, (187, 151, 125, 82, 66, 10, 204, 91 ));
   
   ------------------------------------------------------------------------
   type IRotateTransform_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CenterX
   (
      This       : access IRotateTransform_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_CenterX
   (
      This       : access IRotateTransform_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_CenterY
   (
      This       : access IRotateTransform_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_CenterY
   (
      This       : access IRotateTransform_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Angle
   (
      This       : access IRotateTransform_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Angle
   (
      This       : access IRotateTransform_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IRotateTransform : aliased constant Windows.IID := (1754180025, 7758, 17814, (134, 227, 66, 139, 39, 51, 79, 175 ));
   
   ------------------------------------------------------------------------
   type IRotateTransformStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CenterXProperty
   (
      This       : access IRotateTransformStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CenterYProperty
   (
      This       : access IRotateTransformStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_AngleProperty
   (
      This       : access IRotateTransformStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IRotateTransformStatics : aliased constant Windows.IID := (2704403338, 20899, 16822, (185, 211, 161, 14, 66, 144, 84, 171 ));
   
   ------------------------------------------------------------------------
   type IScaleTransform_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CenterX
   (
      This       : access IScaleTransform_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_CenterX
   (
      This       : access IScaleTransform_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_CenterY
   (
      This       : access IScaleTransform_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_CenterY
   (
      This       : access IScaleTransform_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ScaleX
   (
      This       : access IScaleTransform_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_ScaleX
   (
      This       : access IScaleTransform_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ScaleY
   (
      This       : access IScaleTransform_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_ScaleY
   (
      This       : access IScaleTransform_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IScaleTransform : aliased constant Windows.IID := (3983012237, 37742, 17323, (146, 154, 233, 205, 10, 81, 30, 82 ));
   
   ------------------------------------------------------------------------
   type IScaleTransformStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CenterXProperty
   (
      This       : access IScaleTransformStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CenterYProperty
   (
      This       : access IScaleTransformStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ScaleXProperty
   (
      This       : access IScaleTransformStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ScaleYProperty
   (
      This       : access IScaleTransformStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IScaleTransformStatics : aliased constant Windows.IID := (2643736308, 16551, 18141, (151, 90, 7, 211, 55, 205, 133, 46 ));
   
   ------------------------------------------------------------------------
   type ISkewTransform_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CenterX
   (
      This       : access ISkewTransform_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_CenterX
   (
      This       : access ISkewTransform_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_CenterY
   (
      This       : access ISkewTransform_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_CenterY
   (
      This       : access ISkewTransform_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_AngleX
   (
      This       : access ISkewTransform_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_AngleX
   (
      This       : access ISkewTransform_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_AngleY
   (
      This       : access ISkewTransform_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_AngleY
   (
      This       : access ISkewTransform_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_ISkewTransform : aliased constant Windows.IID := (1317681941, 31247, 17943, (158, 152, 30, 101, 189, 201, 33, 21 ));
   
   ------------------------------------------------------------------------
   type ISkewTransformStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CenterXProperty
   (
      This       : access ISkewTransformStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CenterYProperty
   (
      This       : access ISkewTransformStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_AngleXProperty
   (
      This       : access ISkewTransformStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_AngleYProperty
   (
      This       : access ISkewTransformStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ISkewTransformStatics : aliased constant Windows.IID := (3973127539, 22036, 19249, (182, 175, 190, 174, 16, 16, 86, 36 ));
   
   ------------------------------------------------------------------------
   type ITransformGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Children
   (
      This       : access ITransformGroup_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IVector_Transform
   )
   return Windows.HRESULT is abstract;
   
   function put_Children
   (
      This       : access ITransformGroup_Interface
      ; value : Windows.UI.Xaml.Media.IVector_Transform
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access ITransformGroup_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Matrix
   )
   return Windows.HRESULT is abstract;
   
   IID_ITransformGroup : aliased constant Windows.IID := (1665240268, 36141, 18231, (185, 81, 42, 252, 225, 221, 196, 196 ));
   
   ------------------------------------------------------------------------
   type ITransformGroupStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChildrenProperty
   (
      This       : access ITransformGroupStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ITransformGroupStatics : aliased constant Windows.IID := (623980330, 53163, 19236, (151, 19, 91, 222, 173, 25, 41, 192 ));
   
   ------------------------------------------------------------------------
   type ITranslateTransform_Interface is interface and Windows.IInspectable_Interface;
   
   function get_X
   (
      This       : access ITranslateTransform_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_X
   (
      This       : access ITranslateTransform_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Y
   (
      This       : access ITranslateTransform_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Y
   (
      This       : access ITranslateTransform_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_ITranslateTransform : aliased constant Windows.IID := (3379925084, 15414, 16937, (129, 123, 23, 143, 100, 192, 225, 19 ));
   
   ------------------------------------------------------------------------
   type ITranslateTransformStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_XProperty
   (
      This       : access ITranslateTransformStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_YProperty
   (
      This       : access ITranslateTransformStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ITranslateTransformStatics : aliased constant Windows.IID := (4095322769, 57410, 16657, (156, 47, 210, 1, 48, 65, 35, 221 ));
   
   ------------------------------------------------------------------------
   type IVector_Geometry_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_Geometry_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Media.IGeometry
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_Geometry_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_Geometry_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IGeometry
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_Geometry_Interface
      ; value : Windows.UI.Xaml.Media.IGeometry
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_Geometry_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.IGeometry
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_Geometry_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.IGeometry
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_Geometry_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_Geometry_Interface
      ; value : Windows.UI.Xaml.Media.IGeometry
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_Geometry_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_Geometry_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_Geometry_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Media.IGeometry_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_Geometry_Interface
      ; items : Windows.UI.Xaml.Media.IGeometry_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_Geometry : aliased constant Windows.IID := (2227612730, 33287, 21913, (149, 131, 96, 106, 194, 19, 157, 221 ));
   
   ------------------------------------------------------------------------
   type IIterable_Geometry_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_Geometry_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IGeometry
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_Geometry : aliased constant Windows.IID := (892600377, 3580, 21172, (135, 72, 13, 154, 117, 93, 184, 168 ));
   
   ------------------------------------------------------------------------
   type IVector_GradientStop_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_GradientStop_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Media.IGradientStop
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_GradientStop_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_GradientStop_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IGradientStop
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_GradientStop_Interface
      ; value : Windows.UI.Xaml.Media.IGradientStop
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_GradientStop_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.IGradientStop
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_GradientStop_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.IGradientStop
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_GradientStop_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_GradientStop_Interface
      ; value : Windows.UI.Xaml.Media.IGradientStop
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_GradientStop_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_GradientStop_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_GradientStop_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Media.IGradientStop_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_GradientStop_Interface
      ; items : Windows.UI.Xaml.Media.IGradientStop_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_GradientStop : aliased constant Windows.IID := (859975076, 9459, 23378, (158, 141, 17, 221, 113, 240, 139, 177 ));
   
   ------------------------------------------------------------------------
   type IIterable_GradientStop_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_GradientStop_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IGradientStop
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_GradientStop : aliased constant Windows.IID := (2433072019, 44070, 23470, (140, 30, 223, 142, 207, 0, 222, 230 ));
   
   ------------------------------------------------------------------------
   type ILoadedImageSourceLoadCompletedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access ILoadedImageSourceLoadCompletedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Media.LoadedImageSourceLoadStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_ILoadedImageSourceLoadCompletedEventArgs : aliased constant Windows.IID := (449186590, 30775, 17545, (179, 229, 208, 213, 173, 10, 86, 196 ));
   
   ------------------------------------------------------------------------
   type ILoadedImageSurface_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DecodedPhysicalSize
   (
      This       : access ILoadedImageSurface_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_DecodedSize
   (
      This       : access ILoadedImageSurface_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_NaturalSize
   (
      This       : access ILoadedImageSurface_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function add_LoadCompleted
   (
      This       : access ILoadedImageSurface_Interface
      ; value : TypedEventHandler_ILoadedImageSurface_add_LoadCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LoadCompleted
   (
      This       : access ILoadedImageSurface_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_ILoadedImageSurface : aliased constant Windows.IID := (84706067, 26423, 17850, (133, 49, 51, 9, 79, 235, 239, 85 ));
   
   ------------------------------------------------------------------------
   type ILoadedImageSurfaceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function StartLoadFromUriWithSize
   (
      This       : access ILoadedImageSurfaceStatics_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; desiredMaxSize : Windows.Foundation.Size
      ; RetVal : access Windows.UI.Xaml.Media.ILoadedImageSurface
   )
   return Windows.HRESULT is abstract;
   
   function StartLoadFromUri
   (
      This       : access ILoadedImageSurfaceStatics_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.UI.Xaml.Media.ILoadedImageSurface
   )
   return Windows.HRESULT is abstract;
   
   function StartLoadFromStreamWithSize
   (
      This       : access ILoadedImageSurfaceStatics_Interface
      ; stream : Windows.Storage.Streams.IRandomAccessStream
      ; desiredMaxSize : Windows.Foundation.Size
      ; RetVal : access Windows.UI.Xaml.Media.ILoadedImageSurface
   )
   return Windows.HRESULT is abstract;
   
   function StartLoadFromStream
   (
      This       : access ILoadedImageSurfaceStatics_Interface
      ; stream : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.UI.Xaml.Media.ILoadedImageSurface
   )
   return Windows.HRESULT is abstract;
   
   IID_ILoadedImageSurfaceStatics : aliased constant Windows.IID := (582544886, 33965, 16555, (147, 125, 72, 113, 97, 62, 118, 93 ));
   
   ------------------------------------------------------------------------
   type IVector_PathFigure_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_PathFigure_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Media.IPathFigure
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_PathFigure_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_PathFigure_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IPathFigure
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_PathFigure_Interface
      ; value : Windows.UI.Xaml.Media.IPathFigure
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_PathFigure_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.IPathFigure
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_PathFigure_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.IPathFigure
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_PathFigure_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_PathFigure_Interface
      ; value : Windows.UI.Xaml.Media.IPathFigure
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_PathFigure_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_PathFigure_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_PathFigure_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Media.IPathFigure_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_PathFigure_Interface
      ; items : Windows.UI.Xaml.Media.IPathFigure_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_PathFigure : aliased constant Windows.IID := (3727283205, 9949, 24178, (139, 203, 73, 81, 153, 212, 229, 181 ));
   
   ------------------------------------------------------------------------
   type IIterable_PathFigure_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_PathFigure_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IPathFigure
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_PathFigure : aliased constant Windows.IID := (3441280033, 55013, 23359, (168, 199, 153, 56, 242, 139, 41, 149 ));
   
   ------------------------------------------------------------------------
   type IVector_PathSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_PathSegment_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Media.IPathSegment
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_PathSegment_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_PathSegment_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IPathSegment
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_PathSegment_Interface
      ; value : Windows.UI.Xaml.Media.IPathSegment
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_PathSegment_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.IPathSegment
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_PathSegment_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.IPathSegment
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_PathSegment_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_PathSegment_Interface
      ; value : Windows.UI.Xaml.Media.IPathSegment
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_PathSegment_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_PathSegment_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_PathSegment_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Media.IPathSegment_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_PathSegment_Interface
      ; items : Windows.UI.Xaml.Media.IPathSegment_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_PathSegment : aliased constant Windows.IID := (301847814, 45597, 22093, (182, 168, 255, 153, 16, 87, 184, 243 ));
   
   ------------------------------------------------------------------------
   type IIterable_PathSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_PathSegment_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IPathSegment
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_PathSegment : aliased constant Windows.IID := (937610017, 47561, 20486, (190, 215, 76, 50, 137, 129, 181, 81 ));
   
   ------------------------------------------------------------------------
   type IGradientStop_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Color
   (
      This       : access IGradientStop_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_Color
   (
      This       : access IGradientStop_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Offset
   (
      This       : access IGradientStop_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Offset
   (
      This       : access IGradientStop_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IGradientStop : aliased constant Windows.IID := (1717519614, 11865, 19530, (171, 83, 7, 106, 16, 12, 205, 129 ));
   
   ------------------------------------------------------------------------
   type IGradientStopStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ColorProperty
   (
      This       : access IGradientStopStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_OffsetProperty
   (
      This       : access IGradientStopStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IGradientStopStatics : aliased constant Windows.IID := (1613393269, 24979, 20453, (142, 130, 199, 198, 246, 254, 186, 253 ));
   
   ------------------------------------------------------------------------
   type IPathFigure_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Segments
   (
      This       : access IPathFigure_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IVector_PathSegment
   )
   return Windows.HRESULT is abstract;
   
   function put_Segments
   (
      This       : access IPathFigure_Interface
      ; value : Windows.UI.Xaml.Media.IVector_PathSegment
   )
   return Windows.HRESULT is abstract;
   
   function get_StartPoint
   (
      This       : access IPathFigure_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_StartPoint
   (
      This       : access IPathFigure_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_IsClosed
   (
      This       : access IPathFigure_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsClosed
   (
      This       : access IPathFigure_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsFilled
   (
      This       : access IPathFigure_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsFilled
   (
      This       : access IPathFigure_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IPathFigure : aliased constant Windows.IID := (1570069644, 24489, 19930, (163, 204, 16, 252, 220, 170, 32, 215 ));
   
   ------------------------------------------------------------------------
   type IPathFigureStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SegmentsProperty
   (
      This       : access IPathFigureStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_StartPointProperty
   (
      This       : access IPathFigureStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsClosedProperty
   (
      This       : access IPathFigureStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsFilledProperty
   (
      This       : access IPathFigureStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IPathFigureStatics : aliased constant Windows.IID := (3053818329, 9109, 17175, (149, 82, 58, 88, 82, 111, 140, 123 ));
   
   ------------------------------------------------------------------------
   type IArcSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Point
   (
      This       : access IArcSegment_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_Point
   (
      This       : access IArcSegment_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IArcSegment_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function put_Size
   (
      This       : access IArcSegment_Interface
      ; value : Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationAngle
   (
      This       : access IArcSegment_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_RotationAngle
   (
      This       : access IArcSegment_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_IsLargeArc
   (
      This       : access IArcSegment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsLargeArc
   (
      This       : access IArcSegment_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SweepDirection
   (
      This       : access IArcSegment_Interface
      ; RetVal : access Windows.UI.Xaml.Media.SweepDirection
   )
   return Windows.HRESULT is abstract;
   
   function put_SweepDirection
   (
      This       : access IArcSegment_Interface
      ; value : Windows.UI.Xaml.Media.SweepDirection
   )
   return Windows.HRESULT is abstract;
   
   IID_IArcSegment : aliased constant Windows.IID := (127143007, 25595, 17513, (145, 190, 241, 9, 124, 22, 128, 82 ));
   
   ------------------------------------------------------------------------
   type IArcSegmentStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PointProperty
   (
      This       : access IArcSegmentStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SizeProperty
   (
      This       : access IArcSegmentStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationAngleProperty
   (
      This       : access IArcSegmentStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsLargeArcProperty
   (
      This       : access IArcSegmentStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SweepDirectionProperty
   (
      This       : access IArcSegmentStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IArcSegmentStatics : aliased constant Windows.IID := (2184482670, 35433, 16900, (156, 18, 114, 7, 223, 49, 118, 67 ));
   
   ------------------------------------------------------------------------
   type IBezierSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Point1
   (
      This       : access IBezierSegment_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_Point1
   (
      This       : access IBezierSegment_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Point2
   (
      This       : access IBezierSegment_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_Point2
   (
      This       : access IBezierSegment_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Point3
   (
      This       : access IBezierSegment_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_Point3
   (
      This       : access IBezierSegment_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   IID_IBezierSegment : aliased constant Windows.IID := (2940975598, 35204, 18871, (129, 223, 63, 53, 153, 75, 149, 235 ));
   
   ------------------------------------------------------------------------
   type IBezierSegmentStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Point1Property
   (
      This       : access IBezierSegmentStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_Point2Property
   (
      This       : access IBezierSegmentStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_Point3Property
   (
      This       : access IBezierSegmentStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IBezierSegmentStatics : aliased constant Windows.IID := (3223878572, 5136, 17712, (132, 82, 28, 157, 10, 209, 243, 65 ));
   
   ------------------------------------------------------------------------
   type IEllipseGeometry_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Center
   (
      This       : access IEllipseGeometry_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_Center
   (
      This       : access IEllipseGeometry_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_RadiusX
   (
      This       : access IEllipseGeometry_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_RadiusX
   (
      This       : access IEllipseGeometry_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_RadiusY
   (
      This       : access IEllipseGeometry_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_RadiusY
   (
      This       : access IEllipseGeometry_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IEllipseGeometry : aliased constant Windows.IID := (3572898746, 20130, 16598, (170, 108, 141, 56, 170, 135, 101, 31 ));
   
   ------------------------------------------------------------------------
   type IEllipseGeometryStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CenterProperty
   (
      This       : access IEllipseGeometryStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RadiusXProperty
   (
      This       : access IEllipseGeometryStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RadiusYProperty
   (
      This       : access IEllipseGeometryStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IEllipseGeometryStatics : aliased constant Windows.IID := (390388551, 63029, 19222, (174, 230, 224, 82, 166, 93, 239, 178 ));
   
   ------------------------------------------------------------------------
   type IGeometryGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FillRule
   (
      This       : access IGeometryGroup_Interface
      ; RetVal : access Windows.UI.Xaml.Media.FillRule
   )
   return Windows.HRESULT is abstract;
   
   function put_FillRule
   (
      This       : access IGeometryGroup_Interface
      ; value : Windows.UI.Xaml.Media.FillRule
   )
   return Windows.HRESULT is abstract;
   
   function get_Children
   (
      This       : access IGeometryGroup_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IVector_Geometry
   )
   return Windows.HRESULT is abstract;
   
   function put_Children
   (
      This       : access IGeometryGroup_Interface
      ; value : Windows.UI.Xaml.Media.IVector_Geometry
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeometryGroup : aliased constant Windows.IID := (1428314721, 34423, 19596, (142, 70, 238, 61, 195, 85, 17, 75 ));
   
   ------------------------------------------------------------------------
   type IGeometryGroupStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FillRuleProperty
   (
      This       : access IGeometryGroupStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ChildrenProperty
   (
      This       : access IGeometryGroupStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeometryGroupStatics : aliased constant Windows.IID := (1456035316, 33942, 19382, (171, 240, 97, 123, 31, 231, 139, 69 ));
   
   ------------------------------------------------------------------------
   type IGradientBrush_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SpreadMethod
   (
      This       : access IGradientBrush_Interface
      ; RetVal : access Windows.UI.Xaml.Media.GradientSpreadMethod
   )
   return Windows.HRESULT is abstract;
   
   function put_SpreadMethod
   (
      This       : access IGradientBrush_Interface
      ; value : Windows.UI.Xaml.Media.GradientSpreadMethod
   )
   return Windows.HRESULT is abstract;
   
   function get_MappingMode
   (
      This       : access IGradientBrush_Interface
      ; RetVal : access Windows.UI.Xaml.Media.BrushMappingMode
   )
   return Windows.HRESULT is abstract;
   
   function put_MappingMode
   (
      This       : access IGradientBrush_Interface
      ; value : Windows.UI.Xaml.Media.BrushMappingMode
   )
   return Windows.HRESULT is abstract;
   
   function get_ColorInterpolationMode
   (
      This       : access IGradientBrush_Interface
      ; RetVal : access Windows.UI.Xaml.Media.ColorInterpolationMode
   )
   return Windows.HRESULT is abstract;
   
   function put_ColorInterpolationMode
   (
      This       : access IGradientBrush_Interface
      ; value : Windows.UI.Xaml.Media.ColorInterpolationMode
   )
   return Windows.HRESULT is abstract;
   
   function get_GradientStops
   (
      This       : access IGradientBrush_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IVector_GradientStop
   )
   return Windows.HRESULT is abstract;
   
   function put_GradientStops
   (
      This       : access IGradientBrush_Interface
      ; value : Windows.UI.Xaml.Media.IVector_GradientStop
   )
   return Windows.HRESULT is abstract;
   
   IID_IGradientBrush : aliased constant Windows.IID := (560391839, 37722, 16785, (142, 60, 28, 141, 253, 252, 220, 120 ));
   
   ------------------------------------------------------------------------
   type IGradientBrushStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SpreadMethodProperty
   (
      This       : access IGradientBrushStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_MappingModeProperty
   (
      This       : access IGradientBrushStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ColorInterpolationModeProperty
   (
      This       : access IGradientBrushStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_GradientStopsProperty
   (
      This       : access IGradientBrushStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IGradientBrushStatics : aliased constant Windows.IID := (2518049273, 35764, 20076, (185, 35, 181, 215, 135, 224, 241, 169 ));
   
   ------------------------------------------------------------------------
   type IGradientBrushFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IGradientBrushFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.IGradientBrush
   )
   return Windows.HRESULT is abstract;
   
   IID_IGradientBrushFactory : aliased constant Windows.IID := (3980884426, 17853, 16689, (182, 37, 190, 134, 224, 124, 97, 18 ));
   
   ------------------------------------------------------------------------
   type ILineGeometry_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StartPoint
   (
      This       : access ILineGeometry_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_StartPoint
   (
      This       : access ILineGeometry_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_EndPoint
   (
      This       : access ILineGeometry_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_EndPoint
   (
      This       : access ILineGeometry_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   IID_ILineGeometry : aliased constant Windows.IID := (820892834, 36805, 16559, (167, 162, 194, 127, 231, 170, 19, 99 ));
   
   ------------------------------------------------------------------------
   type ILineGeometryStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StartPointProperty
   (
      This       : access ILineGeometryStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_EndPointProperty
   (
      This       : access ILineGeometryStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ILineGeometryStatics : aliased constant Windows.IID := (1468720995, 21858, 20196, (135, 3, 234, 64, 54, 216, 145, 227 ));
   
   ------------------------------------------------------------------------
   type ILineSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Point
   (
      This       : access ILineSegment_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_Point
   (
      This       : access ILineSegment_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   IID_ILineSegment : aliased constant Windows.IID := (4016713253, 16368, 17440, (164, 17, 113, 130, 164, 206, 203, 21 ));
   
   ------------------------------------------------------------------------
   type ILineSegmentStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PointProperty
   (
      This       : access ILineSegmentStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ILineSegmentStatics : aliased constant Windows.IID := (2680860993, 1216, 19195, (135, 179, 232, 0, 185, 105, 184, 148 ));
   
   ------------------------------------------------------------------------
   type IPathGeometry_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FillRule
   (
      This       : access IPathGeometry_Interface
      ; RetVal : access Windows.UI.Xaml.Media.FillRule
   )
   return Windows.HRESULT is abstract;
   
   function put_FillRule
   (
      This       : access IPathGeometry_Interface
      ; value : Windows.UI.Xaml.Media.FillRule
   )
   return Windows.HRESULT is abstract;
   
   function get_Figures
   (
      This       : access IPathGeometry_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IVector_PathFigure
   )
   return Windows.HRESULT is abstract;
   
   function put_Figures
   (
      This       : access IPathGeometry_Interface
      ; value : Windows.UI.Xaml.Media.IVector_PathFigure
   )
   return Windows.HRESULT is abstract;
   
   IID_IPathGeometry : aliased constant Windows.IID := (136027640, 47846, 19403, (129, 60, 189, 224, 228, 109, 200, 183 ));
   
   ------------------------------------------------------------------------
   type IPathGeometryStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FillRuleProperty
   (
      This       : access IPathGeometryStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FiguresProperty
   (
      This       : access IPathGeometryStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IPathGeometryStatics : aliased constant Windows.IID := (3655699386, 11450, 18241, (143, 141, 49, 152, 207, 81, 134, 185 ));
   
   ------------------------------------------------------------------------
   type IPolyBezierSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Points
   (
      This       : access IPolyBezierSegment_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IVector_Point
   )
   return Windows.HRESULT is abstract;
   
   function put_Points
   (
      This       : access IPolyBezierSegment_Interface
      ; value : Windows.UI.Xaml.Media.IVector_Point
   )
   return Windows.HRESULT is abstract;
   
   IID_IPolyBezierSegment : aliased constant Windows.IID := (914379377, 14532, 19407, (150, 205, 2, 138, 109, 56, 175, 37 ));
   
   ------------------------------------------------------------------------
   type IPolyBezierSegmentStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PointsProperty
   (
      This       : access IPolyBezierSegmentStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IPolyBezierSegmentStatics : aliased constant Windows.IID := (496084698, 5266, 19148, (189, 102, 164, 150, 243, 216, 41, 214 ));
   
   ------------------------------------------------------------------------
   type IPolyLineSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Points
   (
      This       : access IPolyLineSegment_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IVector_Point
   )
   return Windows.HRESULT is abstract;
   
   function put_Points
   (
      This       : access IPolyLineSegment_Interface
      ; value : Windows.UI.Xaml.Media.IVector_Point
   )
   return Windows.HRESULT is abstract;
   
   IID_IPolyLineSegment : aliased constant Windows.IID := (1262059399, 41702, 18333, (189, 200, 111, 68, 100, 100, 104, 135 ));
   
   ------------------------------------------------------------------------
   type IPolyLineSegmentStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PointsProperty
   (
      This       : access IPolyLineSegmentStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IPolyLineSegmentStatics : aliased constant Windows.IID := (3595185287, 13297, 20080, (164, 127, 180, 152, 30, 246, 72, 162 ));
   
   ------------------------------------------------------------------------
   type IPolyQuadraticBezierSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Points
   (
      This       : access IPolyQuadraticBezierSegment_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IVector_Point
   )
   return Windows.HRESULT is abstract;
   
   function put_Points
   (
      This       : access IPolyQuadraticBezierSegment_Interface
      ; value : Windows.UI.Xaml.Media.IVector_Point
   )
   return Windows.HRESULT is abstract;
   
   IID_IPolyQuadraticBezierSegment : aliased constant Windows.IID := (3713854845, 59099, 19606, (182, 161, 63, 206, 150, 233, 135, 166 ));
   
   ------------------------------------------------------------------------
   type IPolyQuadraticBezierSegmentStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PointsProperty
   (
      This       : access IPolyQuadraticBezierSegmentStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IPolyQuadraticBezierSegmentStatics : aliased constant Windows.IID := (4260752245, 31445, 19593, (129, 105, 140, 151, 134, 171, 217, 235 ));
   
   ------------------------------------------------------------------------
   type IQuadraticBezierSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Point1
   (
      This       : access IQuadraticBezierSegment_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_Point1
   (
      This       : access IQuadraticBezierSegment_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Point2
   (
      This       : access IQuadraticBezierSegment_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_Point2
   (
      This       : access IQuadraticBezierSegment_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   IID_IQuadraticBezierSegment : aliased constant Windows.IID := (743479899, 48920, 17754, (160, 120, 145, 75, 82, 50, 216, 175 ));
   
   ------------------------------------------------------------------------
   type IQuadraticBezierSegmentStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Point1Property
   (
      This       : access IQuadraticBezierSegmentStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_Point2Property
   (
      This       : access IQuadraticBezierSegmentStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IQuadraticBezierSegmentStatics : aliased constant Windows.IID := (1774682744, 15371, 19279, (183, 162, 240, 3, 222, 212, 27, 176 ));
   
   ------------------------------------------------------------------------
   type ITileBrush_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AlignmentX
   (
      This       : access ITileBrush_Interface
      ; RetVal : access Windows.UI.Xaml.Media.AlignmentX
   )
   return Windows.HRESULT is abstract;
   
   function put_AlignmentX
   (
      This       : access ITileBrush_Interface
      ; value : Windows.UI.Xaml.Media.AlignmentX
   )
   return Windows.HRESULT is abstract;
   
   function get_AlignmentY
   (
      This       : access ITileBrush_Interface
      ; RetVal : access Windows.UI.Xaml.Media.AlignmentY
   )
   return Windows.HRESULT is abstract;
   
   function put_AlignmentY
   (
      This       : access ITileBrush_Interface
      ; value : Windows.UI.Xaml.Media.AlignmentY
   )
   return Windows.HRESULT is abstract;
   
   function get_Stretch
   (
      This       : access ITileBrush_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Stretch
   )
   return Windows.HRESULT is abstract;
   
   function put_Stretch
   (
      This       : access ITileBrush_Interface
      ; value : Windows.UI.Xaml.Media.Stretch
   )
   return Windows.HRESULT is abstract;
   
   IID_ITileBrush : aliased constant Windows.IID := (3254898438, 52612, 18597, (150, 7, 102, 77, 115, 97, 205, 97 ));
   
   ------------------------------------------------------------------------
   type ITileBrushStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AlignmentXProperty
   (
      This       : access ITileBrushStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_AlignmentYProperty
   (
      This       : access ITileBrushStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_StretchProperty
   (
      This       : access ITileBrushStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ITileBrushStatics : aliased constant Windows.IID := (882360923, 46434, 20072, (132, 53, 35, 153, 246, 235, 148, 213 ));
   
   ------------------------------------------------------------------------
   type ITileBrushFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access ITileBrushFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.ITileBrush
   )
   return Windows.HRESULT is abstract;
   
   IID_ITileBrushFactory : aliased constant Windows.IID := (2853543804, 60778, 20403, (176, 20, 181, 199, 227, 121, 164, 222 ));
   
   ------------------------------------------------------------------------
   type IXamlCompositionBrushBase_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FallbackColor
   (
      This       : access IXamlCompositionBrushBase_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_FallbackColor
   (
      This       : access IXamlCompositionBrushBase_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   IID_IXamlCompositionBrushBase : aliased constant Windows.IID := (65286873, 45916, 19065, (129, 28, 197, 101, 32, 4, 218, 14 ));
   
   ------------------------------------------------------------------------
   type IXamlCompositionBrushBaseOverrides_Interface is interface and Windows.IInspectable_Interface;
   
   function OnConnected
   (
      This       : access IXamlCompositionBrushBaseOverrides_Interface
   )
   return Windows.HRESULT is abstract;
   
   function OnDisconnected
   (
      This       : access IXamlCompositionBrushBaseOverrides_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IXamlCompositionBrushBaseOverrides : aliased constant Windows.IID := (3515951089, 14516, 20129, (143, 51, 132, 150, 41, 164, 201, 193 ));
   
   ------------------------------------------------------------------------
   type IXamlCompositionBrushBaseProtected_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CompositionBrush
   (
      This       : access IXamlCompositionBrushBaseProtected_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_CompositionBrush
   (
      This       : access IXamlCompositionBrushBaseProtected_Interface
      ; value : Windows.UI.Composition.ICompositionBrush
   )
   return Windows.HRESULT is abstract;
   
   IID_IXamlCompositionBrushBaseProtected : aliased constant Windows.IID := (353629144, 1111, 19996, (173, 119, 17, 193, 217, 135, 151, 67 ));
   
   ------------------------------------------------------------------------
   type IXamlCompositionBrushBaseStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FallbackColorProperty
   (
      This       : access IXamlCompositionBrushBaseStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IXamlCompositionBrushBaseStatics : aliased constant Windows.IID := (1339333382, 1562, 17439, (185, 122, 173, 251, 212, 26, 230, 129 ));
   
   ------------------------------------------------------------------------
   type IXamlCompositionBrushBaseFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IXamlCompositionBrushBaseFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.IXamlCompositionBrushBase
   )
   return Windows.HRESULT is abstract;
   
   IID_IXamlCompositionBrushBaseFactory : aliased constant Windows.IID := (961480739, 9297, 20184, (189, 36, 72, 129, 73, 179, 66, 141 ));
   
   ------------------------------------------------------------------------
   type IImageBrush_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ImageSource
   (
      This       : access IImageBrush_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IImageSource
   )
   return Windows.HRESULT is abstract;
   
   function put_ImageSource
   (
      This       : access IImageBrush_Interface
      ; value : Windows.UI.Xaml.Media.IImageSource
   )
   return Windows.HRESULT is abstract;
   
   function add_ImageFailed
   (
      This       : access IImageBrush_Interface
      ; value : Windows.UI.Xaml.ExceptionRoutedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ImageFailed
   (
      This       : access IImageBrush_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ImageOpened
   (
      This       : access IImageBrush_Interface
      ; value : Windows.UI.Xaml.RoutedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ImageOpened
   (
      This       : access IImageBrush_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IImageBrush : aliased constant Windows.IID := (2681279351, 49450, 17555, (191, 125, 243, 168, 173, 116, 181, 84 ));
   
   ------------------------------------------------------------------------
   type IImageBrushStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ImageSourceProperty
   (
      This       : access IImageBrushStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IImageBrushStatics : aliased constant Windows.IID := (307605938, 56600, 17125, (137, 44, 234, 227, 12, 48, 91, 140 ));
   
   ------------------------------------------------------------------------
   type ILinearGradientBrush_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StartPoint
   (
      This       : access ILinearGradientBrush_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_StartPoint
   (
      This       : access ILinearGradientBrush_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_EndPoint
   (
      This       : access ILinearGradientBrush_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_EndPoint
   (
      This       : access ILinearGradientBrush_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   IID_ILinearGradientBrush : aliased constant Windows.IID := (2392248683, 48004, 19567, (157, 191, 157, 108, 92, 109, 156, 57 ));
   
   ------------------------------------------------------------------------
   type ILinearGradientBrushStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StartPointProperty
   (
      This       : access ILinearGradientBrushStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_EndPointProperty
   (
      This       : access ILinearGradientBrushStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ILinearGradientBrushStatics : aliased constant Windows.IID := (2063000836, 11715, 16611, (190, 11, 179, 20, 193, 60, 185, 145 ));
   
   ------------------------------------------------------------------------
   type ILinearGradientBrushFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithGradientStopCollectionAndAngle
   (
      This       : access ILinearGradientBrushFactory_Interface
      ; gradientStopCollection : Windows.UI.Xaml.Media.IVector_GradientStop
      ; angle : Windows.Double
      ; RetVal : access Windows.UI.Xaml.Media.ILinearGradientBrush
   )
   return Windows.HRESULT is abstract;
   
   IID_ILinearGradientBrushFactory : aliased constant Windows.IID := (182486556, 7802, 20461, (152, 87, 234, 140, 170, 121, 132, 144 ));
   
   ------------------------------------------------------------------------
   type ICompositionSurface_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   type IIterator_IXamlLight_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IXamlLight_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IXamlLight
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IXamlLight_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IXamlLight_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IXamlLight_Interface
      ; items : Windows.UI.Xaml.Media.IXamlLight_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IXamlLight : aliased constant Windows.IID := (2937800980, 41961, 24436, (176, 77, 224, 134, 206, 35, 171, 166 ));
   
   ------------------------------------------------------------------------
   type IIterable_IXamlLight_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IXamlLight_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IIterator_IXamlLight
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IXamlLight : aliased constant Windows.IID := (52600493, 11170, 20737, (147, 36, 162, 100, 157, 183, 230, 29 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IXamlLight_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IXamlLight_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Media.IXamlLight
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IXamlLight_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IXamlLight_Interface
      ; value : Windows.UI.Xaml.Media.IXamlLight
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IXamlLight_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Media.IXamlLight_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IXamlLight : aliased constant Windows.IID := (2034444552, 57429, 23571, (188, 0, 37, 87, 150, 213, 159, 91 ));
   
   ------------------------------------------------------------------------
   type IVector_IXamlLight_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IXamlLight_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Media.IXamlLight
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IXamlLight_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IXamlLight_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IVectorView_IXamlLight
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IXamlLight_Interface
      ; value : Windows.UI.Xaml.Media.IXamlLight
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IXamlLight_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.IXamlLight
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IXamlLight_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.IXamlLight
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IXamlLight_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IXamlLight_Interface
      ; value : Windows.UI.Xaml.Media.IXamlLight
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IXamlLight_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IXamlLight_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IXamlLight_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Media.IXamlLight_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IXamlLight_Interface
      ; items : Windows.UI.Xaml.Media.IXamlLight_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_IXamlLight : aliased constant Windows.IID := (2285867263, 36670, 24018, (148, 124, 215, 179, 5, 218, 165, 4 ));
   
   ------------------------------------------------------------------------
   type IIterator_IBrush_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IBrush_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IBrush_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IBrush_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IBrush_Interface
      ; items : Windows.UI.Xaml.Media.IBrush_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IBrush : aliased constant Windows.IID := (1565021140, 16195, 23226, (160, 116, 242, 27, 48, 146, 123, 246 ));
   
   ------------------------------------------------------------------------
   type IIterable_IBrush_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IBrush_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IIterator_IBrush
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IBrush : aliased constant Windows.IID := (2961085141, 1715, 24018, (141, 73, 52, 159, 251, 216, 70, 52 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IBrush_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IBrush_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IBrush_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IBrush_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IBrush_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Media.IBrush_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IBrush : aliased constant Windows.IID := (742798179, 61266, 24021, (186, 144, 65, 93, 137, 51, 190, 201 ));
   
   ------------------------------------------------------------------------
   type IVector_IBrush_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IBrush_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IBrush_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IBrush_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IVectorView_IBrush
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IBrush_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IBrush_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IBrush_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IBrush_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IBrush_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IBrush_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IBrush_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IBrush_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Media.IBrush_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IBrush_Interface
      ; items : Windows.UI.Xaml.Media.IBrush_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_IBrush : aliased constant Windows.IID := (2832041188, 16095, 20850, (143, 119, 16, 233, 16, 229, 220, 93 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type RateChangedRoutedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Media.IRateChangedRoutedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access RateChangedRoutedEventHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access RateChangedRoutedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Media.IRateChangedRoutedEventArgs
   )
   return Windows.HRESULT;
   
   IID_RateChangedRoutedEventHandler : aliased constant Windows.IID := (149529175, 44549, 18587, (136, 57, 40, 198, 34, 93, 35, 73 ));
   
   ------------------------------------------------------------------------
   type TimelineMarkerRoutedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Media.ITimelineMarkerRoutedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TimelineMarkerRoutedEventHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TimelineMarkerRoutedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Media.ITimelineMarkerRoutedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TimelineMarkerRoutedEventHandler : aliased constant Windows.IID := (1927477916, 28138, 19646, (161, 89, 6, 206, 149, 251, 236, 237 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ILoadedImageSurface_add_LoadCompleted_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Media.ILoadedImageSurface ; args : Windows.UI.Xaml.Media.ILoadedImageSourceLoadCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ILoadedImageSurface_add_LoadCompleted_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ILoadedImageSurface_add_LoadCompleted_Interface
      ; sender : Windows.UI.Xaml.Media.ILoadedImageSurface
      ; args : Windows.UI.Xaml.Media.ILoadedImageSourceLoadCompletedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ILoadedImageSurface_add_LoadCompleted : aliased constant Windows.IID := (178308206, 7606, 22608, (174, 23, 236, 49, 14, 163, 253, 45 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype VisualTreeHelper is Windows.UI.Xaml.Media.IVisualTreeHelper;
   subtype PartialMediaFailureDetectedEventArgs is Windows.UI.Xaml.Media.IPartialMediaFailureDetectedEventArgs;
   
   function CreatePartialMediaFailureDetectedEventArgs return Windows.UI.Xaml.Media.IPartialMediaFailureDetectedEventArgs;
   
   subtype MatrixHelper is Windows.UI.Xaml.Media.IMatrixHelper;
   subtype BrushCollection is Windows.UI.Xaml.Media.IVector_Brush;
   
   function CreateBrushCollection return Windows.UI.Xaml.Media.IVector_Brush;
   
   subtype CompositionTarget is Windows.UI.Xaml.Media.ICompositionTarget;
   subtype DoubleCollection is Windows.UI.Xaml.Media.IVector_Double;
   
   function CreateDoubleCollection return Windows.UI.Xaml.Media.IVector_Double;
   
   subtype FontFamily is Windows.UI.Xaml.Media.IFontFamily;
   
   subtype MediaTransportControlsThumbnailRequestedEventArgs is Windows.UI.Xaml.Media.IMediaTransportControlsThumbnailRequestedEventArgs;
   subtype PointCollection is Windows.UI.Xaml.Media.IVector_Point;
   
   function CreatePointCollection return Windows.UI.Xaml.Media.IVector_Point;
   
   subtype RenderingEventArgs is Windows.UI.Xaml.Media.IRenderingEventArgs;
   subtype TimelineMarkerCollection is Windows.UI.Xaml.Media.IVector_TimelineMarker;
   
   function CreateTimelineMarkerCollection return Windows.UI.Xaml.Media.IVector_TimelineMarker;
   
   subtype TransformCollection is Windows.UI.Xaml.Media.IVector_Transform;
   
   function CreateTransformCollection return Windows.UI.Xaml.Media.IVector_Transform;
   
   subtype Brush is Windows.UI.Xaml.Media.IBrush;
   
   type IBrush_Interface_Impl is new IBrush_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IBrush := null;
      m_IBrush : IBrush := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IBrush_Impl is access all IBrush_Interface_Impl'Class;
   type IBrush_Impl_Ptr is access all IBrush_Impl;
   
   function QueryInterface
   (
      This       : access IBrush_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IBrush_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IBrush_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IBrush_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IBrush_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IBrush_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_Opacity
   (
      This       : access IBrush_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_Opacity
   (
      This       : access IBrush_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_Transform
   (
      This       : access IBrush_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.ITransform
   )
   return Windows.HRESULT;
   
   function put_Transform
   (
      This       : access IBrush_Interface_Impl
      ; value : Windows.UI.Xaml.Media.ITransform
   )
   return Windows.HRESULT;
   
   function get_RelativeTransform
   (
      This       : access IBrush_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.ITransform
   )
   return Windows.HRESULT;
   
   function put_RelativeTransform
   (
      This       : access IBrush_Interface_Impl
      ; value : Windows.UI.Xaml.Media.ITransform
   )
   return Windows.HRESULT;
   
   subtype CacheMode is Windows.UI.Xaml.Media.ICacheMode;
   
   type ICacheMode_Interface_Impl is new ICacheMode_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased ICacheMode := null;
      m_ICacheMode : ICacheMode := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type ICacheMode_Impl is access all ICacheMode_Interface_Impl'Class;
   type ICacheMode_Impl_Ptr is access all ICacheMode_Impl;
   
   function QueryInterface
   (
      This       : access ICacheMode_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access ICacheMode_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access ICacheMode_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access ICacheMode_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access ICacheMode_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access ICacheMode_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   subtype GeneralTransform is Windows.UI.Xaml.Media.IGeneralTransform;
   
   type IGeneralTransformOverrides_Interface_Impl is new IGeneralTransformOverrides_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IGeneralTransformOverrides := null;
      m_IGeneralTransform : IGeneralTransform := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IGeneralTransformOverrides_Impl is access all IGeneralTransformOverrides_Interface_Impl'Class;
   type IGeneralTransformOverrides_Impl_Ptr is access all IGeneralTransformOverrides_Impl;
   
   function QueryInterface
   (
      This       : access IGeneralTransformOverrides_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IGeneralTransformOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IGeneralTransformOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IGeneralTransformOverrides_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IGeneralTransformOverrides_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IGeneralTransformOverrides_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_InverseCore
   (
      This       : access IGeneralTransformOverrides_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IGeneralTransform
   )
   return Windows.HRESULT;
   
   function TryTransformCore
   (
      This       : access IGeneralTransformOverrides_Interface_Impl
      ; inPoint : Windows.Foundation.Point
      ; outPoint : access Windows.Foundation.Point
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function TransformBoundsCore
   (
      This       : access IGeneralTransformOverrides_Interface_Impl
      ; rect : Windows.Foundation.Rect
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT;
   
   type IGeneralTransform_Interface_Impl is new IGeneralTransform_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IGeneralTransform := null;
      m_IGeneralTransform : IGeneralTransform := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IGeneralTransform_Impl is access all IGeneralTransform_Interface_Impl'Class;
   type IGeneralTransform_Impl_Ptr is access all IGeneralTransform_Impl;
   
   function QueryInterface
   (
      This       : access IGeneralTransform_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IGeneralTransform_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IGeneralTransform_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IGeneralTransform_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IGeneralTransform_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IGeneralTransform_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_Inverse
   (
      This       : access IGeneralTransform_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IGeneralTransform
   )
   return Windows.HRESULT;
   
   function TransformPoint
   (
      This       : access IGeneralTransform_Interface_Impl
      ; point : Windows.Foundation.Point
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT;
   
   function TryTransform
   (
      This       : access IGeneralTransform_Interface_Impl
      ; inPoint : Windows.Foundation.Point
      ; outPoint : access Windows.Foundation.Point
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function TransformBounds
   (
      This       : access IGeneralTransform_Interface_Impl
      ; rect : Windows.Foundation.Rect
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT;
   
   subtype Geometry is Windows.UI.Xaml.Media.IGeometry;
   
   subtype ImageSource is Windows.UI.Xaml.Media.IImageSource;
   
   subtype PathSegment is Windows.UI.Xaml.Media.IPathSegment;
   
   subtype Projection is Windows.UI.Xaml.Media.IProjection;
   
   type IProjection_Interface_Impl is new IProjection_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IProjection := null;
      m_IProjection : IProjection := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IProjection_Impl is access all IProjection_Interface_Impl'Class;
   type IProjection_Impl_Ptr is access all IProjection_Impl;
   
   function QueryInterface
   (
      This       : access IProjection_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IProjection_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IProjection_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IProjection_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IProjection_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IProjection_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   subtype RateChangedRoutedEventArgs is Windows.UI.Xaml.Media.IRateChangedRoutedEventArgs;
   
   function CreateRateChangedRoutedEventArgs return Windows.UI.Xaml.Media.IRateChangedRoutedEventArgs;
   
   subtype TimelineMarker is Windows.UI.Xaml.Media.ITimelineMarker;
   
   function CreateTimelineMarker return Windows.UI.Xaml.Media.ITimelineMarker;
   
   subtype TimelineMarkerRoutedEventArgs is Windows.UI.Xaml.Media.ITimelineMarkerRoutedEventArgs;
   
   function CreateTimelineMarkerRoutedEventArgs return Windows.UI.Xaml.Media.ITimelineMarkerRoutedEventArgs;
   
   subtype XamlLight is Windows.UI.Xaml.Media.IXamlLight;
   
   type IXamlLightOverrides_Interface_Impl is new IXamlLightOverrides_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IXamlLightOverrides := null;
      m_IXamlLight : IXamlLight := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IXamlLightOverrides_Impl is access all IXamlLightOverrides_Interface_Impl'Class;
   type IXamlLightOverrides_Impl_Ptr is access all IXamlLightOverrides_Impl;
   
   function QueryInterface
   (
      This       : access IXamlLightOverrides_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IXamlLightOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IXamlLightOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IXamlLightOverrides_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IXamlLightOverrides_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IXamlLightOverrides_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function GetId
   (
      This       : access IXamlLightOverrides_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function OnConnected
   (
      This       : access IXamlLightOverrides_Interface_Impl
      ; newElement : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT;
   
   function OnDisconnected
   (
      This       : access IXamlLightOverrides_Interface_Impl
      ; oldElement : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT;
   
   type IXamlLight_Interface_Impl is new IXamlLight_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IXamlLight := null;
      m_IXamlLight : IXamlLight := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IXamlLight_Impl is access all IXamlLight_Interface_Impl'Class;
   type IXamlLight_Impl_Ptr is access all IXamlLight_Impl;
   
   function QueryInterface
   (
      This       : access IXamlLight_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IXamlLight_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IXamlLight_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IXamlLight_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IXamlLight_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IXamlLight_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   subtype BitmapCache is Windows.UI.Xaml.Media.IBitmapCache;
   
   function CreateBitmapCache return Windows.UI.Xaml.Media.IBitmapCache;
   
   subtype Matrix3DProjection is Windows.UI.Xaml.Media.IMatrix3DProjection;
   
   function CreateMatrix3DProjection return Windows.UI.Xaml.Media.IMatrix3DProjection;
   
   subtype PlaneProjection is Windows.UI.Xaml.Media.IPlaneProjection;
   
   function CreatePlaneProjection return Windows.UI.Xaml.Media.IPlaneProjection;
   
   subtype RectangleGeometry is Windows.UI.Xaml.Media.IRectangleGeometry;
   
   function CreateRectangleGeometry return Windows.UI.Xaml.Media.IRectangleGeometry;
   
   subtype SolidColorBrush is Windows.UI.Xaml.Media.ISolidColorBrush;
   
   function CreateInstanceWithColor
   (
      color : Windows.UI.Color
   )
   return Windows.UI.Xaml.Media.ISolidColorBrush;
   
   subtype Transform is Windows.UI.Xaml.Media.ITransform;
   
   subtype CompositeTransform is Windows.UI.Xaml.Media.ICompositeTransform;
   
   function CreateCompositeTransform return Windows.UI.Xaml.Media.ICompositeTransform;
   
   subtype MatrixTransform is Windows.UI.Xaml.Media.IMatrixTransform;
   
   function CreateMatrixTransform return Windows.UI.Xaml.Media.IMatrixTransform;
   
   subtype RotateTransform is Windows.UI.Xaml.Media.IRotateTransform;
   
   function CreateRotateTransform return Windows.UI.Xaml.Media.IRotateTransform;
   
   subtype ScaleTransform is Windows.UI.Xaml.Media.IScaleTransform;
   
   function CreateScaleTransform return Windows.UI.Xaml.Media.IScaleTransform;
   
   subtype SkewTransform is Windows.UI.Xaml.Media.ISkewTransform;
   
   function CreateSkewTransform return Windows.UI.Xaml.Media.ISkewTransform;
   
   subtype TransformGroup is Windows.UI.Xaml.Media.ITransformGroup;
   
   function CreateTransformGroup return Windows.UI.Xaml.Media.ITransformGroup;
   
   subtype TranslateTransform is Windows.UI.Xaml.Media.ITranslateTransform;
   
   function CreateTranslateTransform return Windows.UI.Xaml.Media.ITranslateTransform;
   
   subtype GeometryCollection is Windows.UI.Xaml.Media.IVector_Geometry;
   
   function CreateGeometryCollection return Windows.UI.Xaml.Media.IVector_Geometry;
   
   subtype GradientStopCollection is Windows.UI.Xaml.Media.IVector_GradientStop;
   
   function CreateGradientStopCollection return Windows.UI.Xaml.Media.IVector_GradientStop;
   
   subtype LoadedImageSourceLoadCompletedEventArgs is Windows.UI.Xaml.Media.ILoadedImageSourceLoadCompletedEventArgs;
   subtype LoadedImageSurface is Windows.UI.Xaml.Media.ILoadedImageSurface;
   subtype PathFigureCollection is Windows.UI.Xaml.Media.IVector_PathFigure;
   
   function CreatePathFigureCollection return Windows.UI.Xaml.Media.IVector_PathFigure;
   
   subtype PathSegmentCollection is Windows.UI.Xaml.Media.IVector_PathSegment;
   
   function CreatePathSegmentCollection return Windows.UI.Xaml.Media.IVector_PathSegment;
   
   subtype GradientStop is Windows.UI.Xaml.Media.IGradientStop;
   
   function CreateGradientStop return Windows.UI.Xaml.Media.IGradientStop;
   
   subtype PathFigure is Windows.UI.Xaml.Media.IPathFigure;
   
   function CreatePathFigure return Windows.UI.Xaml.Media.IPathFigure;
   
   subtype ArcSegment is Windows.UI.Xaml.Media.IArcSegment;
   
   function CreateArcSegment return Windows.UI.Xaml.Media.IArcSegment;
   
   subtype BezierSegment is Windows.UI.Xaml.Media.IBezierSegment;
   
   function CreateBezierSegment return Windows.UI.Xaml.Media.IBezierSegment;
   
   subtype EllipseGeometry is Windows.UI.Xaml.Media.IEllipseGeometry;
   
   function CreateEllipseGeometry return Windows.UI.Xaml.Media.IEllipseGeometry;
   
   subtype GeometryGroup is Windows.UI.Xaml.Media.IGeometryGroup;
   
   function CreateGeometryGroup return Windows.UI.Xaml.Media.IGeometryGroup;
   
   subtype GradientBrush is Windows.UI.Xaml.Media.IGradientBrush;
   
   type IGradientBrush_Interface_Impl is new IGradientBrush_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IGradientBrush := null;
      m_IGradientBrush : IGradientBrush := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IGradientBrush_Impl is access all IGradientBrush_Interface_Impl'Class;
   type IGradientBrush_Impl_Ptr is access all IGradientBrush_Impl;
   
   function QueryInterface
   (
      This       : access IGradientBrush_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IGradientBrush_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IGradientBrush_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IGradientBrush_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IGradientBrush_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IGradientBrush_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_SpreadMethod
   (
      This       : access IGradientBrush_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.GradientSpreadMethod
   )
   return Windows.HRESULT;
   
   function put_SpreadMethod
   (
      This       : access IGradientBrush_Interface_Impl
      ; value : Windows.UI.Xaml.Media.GradientSpreadMethod
   )
   return Windows.HRESULT;
   
   function get_MappingMode
   (
      This       : access IGradientBrush_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.BrushMappingMode
   )
   return Windows.HRESULT;
   
   function put_MappingMode
   (
      This       : access IGradientBrush_Interface_Impl
      ; value : Windows.UI.Xaml.Media.BrushMappingMode
   )
   return Windows.HRESULT;
   
   function get_ColorInterpolationMode
   (
      This       : access IGradientBrush_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.ColorInterpolationMode
   )
   return Windows.HRESULT;
   
   function put_ColorInterpolationMode
   (
      This       : access IGradientBrush_Interface_Impl
      ; value : Windows.UI.Xaml.Media.ColorInterpolationMode
   )
   return Windows.HRESULT;
   
   function get_GradientStops
   (
      This       : access IGradientBrush_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IVector_GradientStop
   )
   return Windows.HRESULT;
   
   function put_GradientStops
   (
      This       : access IGradientBrush_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IVector_GradientStop
   )
   return Windows.HRESULT;
   
   subtype LineGeometry is Windows.UI.Xaml.Media.ILineGeometry;
   
   function CreateLineGeometry return Windows.UI.Xaml.Media.ILineGeometry;
   
   subtype LineSegment is Windows.UI.Xaml.Media.ILineSegment;
   
   function CreateLineSegment return Windows.UI.Xaml.Media.ILineSegment;
   
   subtype PathGeometry is Windows.UI.Xaml.Media.IPathGeometry;
   
   function CreatePathGeometry return Windows.UI.Xaml.Media.IPathGeometry;
   
   subtype PolyBezierSegment is Windows.UI.Xaml.Media.IPolyBezierSegment;
   
   function CreatePolyBezierSegment return Windows.UI.Xaml.Media.IPolyBezierSegment;
   
   subtype PolyLineSegment is Windows.UI.Xaml.Media.IPolyLineSegment;
   
   function CreatePolyLineSegment return Windows.UI.Xaml.Media.IPolyLineSegment;
   
   subtype PolyQuadraticBezierSegment is Windows.UI.Xaml.Media.IPolyQuadraticBezierSegment;
   
   function CreatePolyQuadraticBezierSegment return Windows.UI.Xaml.Media.IPolyQuadraticBezierSegment;
   
   subtype QuadraticBezierSegment is Windows.UI.Xaml.Media.IQuadraticBezierSegment;
   
   function CreateQuadraticBezierSegment return Windows.UI.Xaml.Media.IQuadraticBezierSegment;
   
   subtype TileBrush is Windows.UI.Xaml.Media.ITileBrush;
   
   type ITileBrush_Interface_Impl is new ITileBrush_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased ITileBrush := null;
      m_ITileBrush : ITileBrush := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type ITileBrush_Impl is access all ITileBrush_Interface_Impl'Class;
   type ITileBrush_Impl_Ptr is access all ITileBrush_Impl;
   
   function QueryInterface
   (
      This       : access ITileBrush_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access ITileBrush_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access ITileBrush_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access ITileBrush_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access ITileBrush_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access ITileBrush_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_AlignmentX
   (
      This       : access ITileBrush_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.AlignmentX
   )
   return Windows.HRESULT;
   
   function put_AlignmentX
   (
      This       : access ITileBrush_Interface_Impl
      ; value : Windows.UI.Xaml.Media.AlignmentX
   )
   return Windows.HRESULT;
   
   function get_AlignmentY
   (
      This       : access ITileBrush_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.AlignmentY
   )
   return Windows.HRESULT;
   
   function put_AlignmentY
   (
      This       : access ITileBrush_Interface_Impl
      ; value : Windows.UI.Xaml.Media.AlignmentY
   )
   return Windows.HRESULT;
   
   function get_Stretch
   (
      This       : access ITileBrush_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.Stretch
   )
   return Windows.HRESULT;
   
   function put_Stretch
   (
      This       : access ITileBrush_Interface_Impl
      ; value : Windows.UI.Xaml.Media.Stretch
   )
   return Windows.HRESULT;
   
   subtype XamlCompositionBrushBase is Windows.UI.Xaml.Media.IXamlCompositionBrushBase;
   
   type IXamlCompositionBrushBaseOverrides_Interface_Impl is new IXamlCompositionBrushBaseOverrides_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IXamlCompositionBrushBaseOverrides := null;
      m_IXamlCompositionBrushBase : IXamlCompositionBrushBase := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IXamlCompositionBrushBaseOverrides_Impl is access all IXamlCompositionBrushBaseOverrides_Interface_Impl'Class;
   type IXamlCompositionBrushBaseOverrides_Impl_Ptr is access all IXamlCompositionBrushBaseOverrides_Impl;
   
   function QueryInterface
   (
      This       : access IXamlCompositionBrushBaseOverrides_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IXamlCompositionBrushBaseOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IXamlCompositionBrushBaseOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IXamlCompositionBrushBaseOverrides_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IXamlCompositionBrushBaseOverrides_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IXamlCompositionBrushBaseOverrides_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function OnConnected
   (
      This       : access IXamlCompositionBrushBaseOverrides_Interface_Impl
   )
   return Windows.HRESULT;
   
   function OnDisconnected
   (
      This       : access IXamlCompositionBrushBaseOverrides_Interface_Impl
   )
   return Windows.HRESULT;
   
   type IXamlCompositionBrushBase_Interface_Impl is new IXamlCompositionBrushBase_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IXamlCompositionBrushBase := null;
      m_IXamlCompositionBrushBase : IXamlCompositionBrushBase := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IXamlCompositionBrushBase_Impl is access all IXamlCompositionBrushBase_Interface_Impl'Class;
   type IXamlCompositionBrushBase_Impl_Ptr is access all IXamlCompositionBrushBase_Impl;
   
   function QueryInterface
   (
      This       : access IXamlCompositionBrushBase_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IXamlCompositionBrushBase_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IXamlCompositionBrushBase_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IXamlCompositionBrushBase_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IXamlCompositionBrushBase_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IXamlCompositionBrushBase_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_FallbackColor
   (
      This       : access IXamlCompositionBrushBase_Interface_Impl
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT;
   
   function put_FallbackColor
   (
      This       : access IXamlCompositionBrushBase_Interface_Impl
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT;
   
   subtype AcrylicBrush is Windows.UI.Xaml.Media.IAcrylicBrush;
   
   type IAcrylicBrush_Interface_Impl is new IAcrylicBrush_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IAcrylicBrush := null;
      m_IAcrylicBrush : IAcrylicBrush := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IAcrylicBrush_Impl is access all IAcrylicBrush_Interface_Impl'Class;
   type IAcrylicBrush_Impl_Ptr is access all IAcrylicBrush_Impl;
   
   function QueryInterface
   (
      This       : access IAcrylicBrush_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IAcrylicBrush_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IAcrylicBrush_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IAcrylicBrush_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IAcrylicBrush_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IAcrylicBrush_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_BackgroundSource
   (
      This       : access IAcrylicBrush_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.AcrylicBackgroundSource
   )
   return Windows.HRESULT;
   
   function put_BackgroundSource
   (
      This       : access IAcrylicBrush_Interface_Impl
      ; value : Windows.UI.Xaml.Media.AcrylicBackgroundSource
   )
   return Windows.HRESULT;
   
   function get_TintColor
   (
      This       : access IAcrylicBrush_Interface_Impl
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT;
   
   function put_TintColor
   (
      This       : access IAcrylicBrush_Interface_Impl
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT;
   
   function get_TintOpacity
   (
      This       : access IAcrylicBrush_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_TintOpacity
   (
      This       : access IAcrylicBrush_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_TintTransitionDuration
   (
      This       : access IAcrylicBrush_Interface_Impl
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT;
   
   function put_TintTransitionDuration
   (
      This       : access IAcrylicBrush_Interface_Impl
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT;
   
   function get_AlwaysUseFallback
   (
      This       : access IAcrylicBrush_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function put_AlwaysUseFallback
   (
      This       : access IAcrylicBrush_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT;
   
   subtype RevealBrush is Windows.UI.Xaml.Media.IRevealBrush;
   
   type IRevealBrush_Interface_Impl is new IRevealBrush_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IRevealBrush := null;
      m_IRevealBrush : IRevealBrush := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IRevealBrush_Impl is access all IRevealBrush_Interface_Impl'Class;
   type IRevealBrush_Impl_Ptr is access all IRevealBrush_Impl;
   
   function QueryInterface
   (
      This       : access IRevealBrush_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IRevealBrush_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IRevealBrush_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IRevealBrush_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IRevealBrush_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IRevealBrush_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_Color
   (
      This       : access IRevealBrush_Interface_Impl
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT;
   
   function put_Color
   (
      This       : access IRevealBrush_Interface_Impl
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT;
   
   function get_TargetTheme
   (
      This       : access IRevealBrush_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.ApplicationTheme
   )
   return Windows.HRESULT;
   
   function put_TargetTheme
   (
      This       : access IRevealBrush_Interface_Impl
      ; value : Windows.UI.Xaml.ApplicationTheme
   )
   return Windows.HRESULT;
   
   function get_AlwaysUseFallback
   (
      This       : access IRevealBrush_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function put_AlwaysUseFallback
   (
      This       : access IRevealBrush_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT;
   
   subtype RevealBorderBrush is Windows.UI.Xaml.Media.IRevealBorderBrush;
   
   type IRevealBorderBrush_Interface_Impl is new IRevealBorderBrush_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IRevealBorderBrush := null;
      m_IRevealBorderBrush : IRevealBorderBrush := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IRevealBorderBrush_Impl is access all IRevealBorderBrush_Interface_Impl'Class;
   type IRevealBorderBrush_Impl_Ptr is access all IRevealBorderBrush_Impl;
   
   function QueryInterface
   (
      This       : access IRevealBorderBrush_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IRevealBorderBrush_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IRevealBorderBrush_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IRevealBorderBrush_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IRevealBorderBrush_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IRevealBorderBrush_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   subtype RevealBackgroundBrush is Windows.UI.Xaml.Media.IRevealBackgroundBrush;
   
   type IRevealBackgroundBrush_Interface_Impl is new IRevealBackgroundBrush_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IRevealBackgroundBrush := null;
      m_IRevealBackgroundBrush : IRevealBackgroundBrush := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IRevealBackgroundBrush_Impl is access all IRevealBackgroundBrush_Interface_Impl'Class;
   type IRevealBackgroundBrush_Impl_Ptr is access all IRevealBackgroundBrush_Impl;
   
   function QueryInterface
   (
      This       : access IRevealBackgroundBrush_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IRevealBackgroundBrush_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IRevealBackgroundBrush_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IRevealBackgroundBrush_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IRevealBackgroundBrush_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IRevealBackgroundBrush_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   subtype ImageBrush is Windows.UI.Xaml.Media.IImageBrush;
   
   function CreateImageBrush return Windows.UI.Xaml.Media.IImageBrush;
   
   subtype LinearGradientBrush is Windows.UI.Xaml.Media.ILinearGradientBrush;
   
   function CreateInstanceWithGradientStopCollectionAndAngle
   (
      gradientStopCollection : Windows.UI.Xaml.Media.IVector_GradientStop
      ; angle : Windows.Double
   )
   return Windows.UI.Xaml.Media.ILinearGradientBrush;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function FindElementsInHostCoordinatesPoint
   (
      intersectingPoint : Windows.Foundation.Point
      ; subtree : Windows.UI.Xaml.IUIElement
   )
   return Windows.UI.Xaml.IIterable_IUIElement;
   
   function FindElementsInHostCoordinatesRect
   (
      intersectingRect : Windows.Foundation.Rect
      ; subtree : Windows.UI.Xaml.IUIElement
   )
   return Windows.UI.Xaml.IIterable_IUIElement;
   
   function FindAllElementsInHostCoordinatesPoint
   (
      intersectingPoint : Windows.Foundation.Point
      ; subtree : Windows.UI.Xaml.IUIElement
      ; includeAllElements : Windows.Boolean
   )
   return Windows.UI.Xaml.IIterable_IUIElement;
   
   function FindAllElementsInHostCoordinatesRect
   (
      intersectingRect : Windows.Foundation.Rect
      ; subtree : Windows.UI.Xaml.IUIElement
      ; includeAllElements : Windows.Boolean
   )
   return Windows.UI.Xaml.IIterable_IUIElement;
   
   function GetChild
   (
      reference : Windows.UI.Xaml.IDependencyObject
      ; childIndex : Windows.Int32
   )
   return Windows.UI.Xaml.IDependencyObject;
   
   function GetChildrenCount
   (
      reference : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Int32;
   
   function GetParent
   (
      reference : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.IDependencyObject;
   
   procedure DisconnectChildrenRecursive
   (
      element : Windows.UI.Xaml.IUIElement
   )
   ;
   
   function GetOpenPopups
   (
      window : Windows.UI.Xaml.IWindow
   )
   return Windows.UI.Xaml.Controls.Primitives.IVectorView_IPopup;
   
   function get_Identity
   return Windows.UI.Xaml.Media.Matrix;
   
   function FromElements
   (
      m11 : Windows.Double
      ; m12 : Windows.Double
      ; m21 : Windows.Double
      ; m22 : Windows.Double
      ; offsetX : Windows.Double
      ; offsetY : Windows.Double
   )
   return Windows.UI.Xaml.Media.Matrix;
   
   function GetIsIdentity
   (
      target : Windows.UI.Xaml.Media.Matrix
   )
   return Windows.Boolean;
   
   function Transform_x
   (
      target : Windows.UI.Xaml.Media.Matrix
      ; point : Windows.Foundation.Point
   )
   return Windows.Foundation.Point;
   
   function add_Rendering
   (
      value : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_Rendering
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_SurfaceContentsLost
   (
      value : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_SurfaceContentsLost
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function CreateInstanceWithName
   (
      familyName : Windows.String
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.IFontFamily;
   
   function get_XamlAutoFontFamily
   return Windows.UI.Xaml.Media.IFontFamily;
   
   function get_OpacityProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TransformProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RelativeTransformProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.IBrush;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.ICacheMode;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.IGeneralTransform;
   
   function get_Empty
   return Windows.UI.Xaml.Media.IGeometry;
   
   function get_StandardFlatteningTolerance
   return Windows.Double;
   
   function get_TransformProperty_IGeometry
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.IProjection;
   
   function get_TimeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TypeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TextProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   procedure AddTargetElement
   (
      lightId : Windows.String
      ; element : Windows.UI.Xaml.IUIElement
   )
   ;
   
   procedure RemoveTargetElement
   (
      lightId : Windows.String
      ; element : Windows.UI.Xaml.IUIElement
   )
   ;
   
   procedure AddTargetBrush
   (
      lightId : Windows.String
      ; brush : Windows.UI.Xaml.Media.IBrush
   )
   ;
   
   procedure RemoveTargetBrush
   (
      lightId : Windows.String
      ; brush : Windows.UI.Xaml.Media.IBrush
   )
   ;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.IXamlLight;
   
   function get_ProjectionMatrixProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_LocalOffsetXProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_LocalOffsetYProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_LocalOffsetZProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RotationXProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RotationYProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RotationZProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CenterOfRotationXProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CenterOfRotationYProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CenterOfRotationZProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_GlobalOffsetXProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_GlobalOffsetYProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_GlobalOffsetZProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ProjectionMatrixProperty_IPlaneProjection
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RectProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ColorProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CenterXProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CenterYProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ScaleXProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ScaleYProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SkewXProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SkewYProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RotationProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TranslateXProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TranslateYProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_MatrixProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CenterXProperty_IRotateTransform
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CenterYProperty_IRotateTransform
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_AngleProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CenterXProperty_IScaleTransform
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CenterYProperty_IScaleTransform
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ScaleXProperty_IScaleTransform
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ScaleYProperty_IScaleTransform
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CenterXProperty_ISkewTransform
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CenterYProperty_ISkewTransform
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_AngleXProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_AngleYProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ChildrenProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_XProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_YProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function StartLoadFromUriWithSize
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; desiredMaxSize : Windows.Foundation.Size
   )
   return Windows.UI.Xaml.Media.ILoadedImageSurface;
   
   function StartLoadFromUri
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.UI.Xaml.Media.ILoadedImageSurface;
   
   function StartLoadFromStreamWithSize
   (
      stream : Windows.Storage.Streams.IRandomAccessStream
      ; desiredMaxSize : Windows.Foundation.Size
   )
   return Windows.UI.Xaml.Media.ILoadedImageSurface;
   
   function StartLoadFromStream
   (
      stream : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.UI.Xaml.Media.ILoadedImageSurface;
   
   function get_ColorProperty_IGradientStop
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_OffsetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SegmentsProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_StartPointProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsClosedProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsFilledProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PointProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SizeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RotationAngleProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsLargeArcProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SweepDirectionProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_Point1Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_Point2Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_Point3Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CenterProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RadiusXProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RadiusYProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FillRuleProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ChildrenProperty_IGeometryGroup
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SpreadMethodProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_MappingModeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ColorInterpolationModeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_GradientStopsProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.IGradientBrush;
   
   function get_StartPointProperty_ILineGeometry
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_EndPointProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PointProperty_ILineSegment
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FillRuleProperty_IPathGeometry
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FiguresProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PointsProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PointsProperty_IPolyLineSegment
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PointsProperty_IPolyQuadraticBezierSegment
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_Point1Property_IQuadraticBezierSegment
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_Point2Property_IQuadraticBezierSegment
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_AlignmentXProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_AlignmentYProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_StretchProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.ITileBrush;
   
   function get_FallbackColorProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.IXamlCompositionBrushBase;
   
   function get_BackgroundSourceProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TintColorProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TintOpacityProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TintTransitionDurationProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_AlwaysUseFallbackProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.IAcrylicBrush;
   
   function get_ColorProperty_IRevealBrush
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TargetThemeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_AlwaysUseFallbackProperty_IRevealBrush
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_StateProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   procedure SetState
   (
      element : Windows.UI.Xaml.IUIElement
      ; value : Windows.UI.Xaml.Media.RevealBrushState
   )
   ;
   
   function GetState
   (
      element : Windows.UI.Xaml.IUIElement
   )
   return Windows.UI.Xaml.Media.RevealBrushState;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.IRevealBrush;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.IRevealBorderBrush;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.IRevealBackgroundBrush;
   
   function get_ImageSourceProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_StartPointProperty_ILinearGradientBrush
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_EndPointProperty_ILinearGradientBrush
   return Windows.UI.Xaml.IDependencyProperty;

end;
