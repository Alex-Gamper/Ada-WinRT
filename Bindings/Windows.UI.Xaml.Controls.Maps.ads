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
with Windows.Foundation;
limited with Windows.Devices.Geolocation;
with Windows.Foundation.Collections;
limited with Windows.Storage.Streams;
limited with Windows.Services.Maps;
with Windows.Foundation.Numerics;
limited with Windows.Services.Maps.LocalSearch;
--------------------------------------------------------------------------------
package Windows.UI.Xaml.Controls.Maps is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type MapAnimationKind is (
      Default,
      None,
      Linear,
      Bow
   );
   for MapAnimationKind use (
      Default => 0,
      None => 1,
      Linear => 2,
      Bow => 3
   );
   for MapAnimationKind'Size use 32;
   
   type MapAnimationKind_Ptr is access MapAnimationKind;
   
   type MapCameraChangeReason is (
      System,
      UserInteraction,
      Programmatic
   );
   for MapCameraChangeReason use (
      System => 0,
      UserInteraction => 1,
      Programmatic => 2
   );
   for MapCameraChangeReason'Size use 32;
   
   type MapCameraChangeReason_Ptr is access MapCameraChangeReason;
   
   type MapColorScheme is (
      Light,
      Dark
   );
   for MapColorScheme use (
      Light => 0,
      Dark => 1
   );
   for MapColorScheme'Size use 32;
   
   type MapColorScheme_Ptr is access MapColorScheme;
   
   type MapElementCollisionBehavior is (
      Hide,
      RemainVisible
   );
   for MapElementCollisionBehavior use (
      Hide => 0,
      RemainVisible => 1
   );
   for MapElementCollisionBehavior'Size use 32;
   
   type MapElementCollisionBehavior_Ptr is access MapElementCollisionBehavior;
   
   
   type MapInteractionMode is new Windows.Int32;
   
   type MapInteractionMode_Ptr is access MapInteractionMode;
   
   type MapLoadingStatus is (
      Loading,
      Loaded,
      DataUnavailable
   );
   for MapLoadingStatus use (
      Loading => 0,
      Loaded => 1,
      DataUnavailable => 2
   );
   for MapLoadingStatus'Size use 32;
   
   type MapLoadingStatus_Ptr is access MapLoadingStatus;
   
   type MapModel3DShadingOption is (
      Default,
      Flat,
      Smooth
   );
   for MapModel3DShadingOption use (
      Default => 0,
      Flat => 1,
      Smooth => 2
   );
   for MapModel3DShadingOption'Size use 32;
   
   type MapModel3DShadingOption_Ptr is access MapModel3DShadingOption;
   
   type MapPanInteractionMode is (
      Auto,
      Disabled
   );
   for MapPanInteractionMode use (
      Auto => 0,
      Disabled => 1
   );
   for MapPanInteractionMode'Size use 32;
   
   type MapPanInteractionMode_Ptr is access MapPanInteractionMode;
   
   type MapProjection is (
      WebMercator,
      Globe
   );
   for MapProjection use (
      WebMercator => 0,
      Globe => 1
   );
   for MapProjection'Size use 32;
   
   type MapProjection_Ptr is access MapProjection;
   
   type MapStyle is (
      None,
      Road,
      Aerial,
      AerialWithRoads,
      Terrain,
      Aerial3D,
      Aerial3DWithRoads,
      Custom
   );
   for MapStyle use (
      None => 0,
      Road => 1,
      Aerial => 2,
      AerialWithRoads => 3,
      Terrain => 4,
      Aerial3D => 5,
      Aerial3DWithRoads => 6,
      Custom => 7
   );
   for MapStyle'Size use 32;
   
   type MapStyle_Ptr is access MapStyle;
   
   type MapTileLayer is (
      LabelOverlay,
      RoadOverlay,
      AreaOverlay,
      BackgroundOverlay,
      BackgroundReplacement
   );
   for MapTileLayer use (
      LabelOverlay => 0,
      RoadOverlay => 1,
      AreaOverlay => 2,
      BackgroundOverlay => 3,
      BackgroundReplacement => 4
   );
   for MapTileLayer'Size use 32;
   
   type MapTileLayer_Ptr is access MapTileLayer;
   
   type MapVisibleRegionKind is (
      Near,
      Full
   );
   for MapVisibleRegionKind use (
      Near => 0,
      Full => 1
   );
   for MapVisibleRegionKind'Size use 32;
   
   type MapVisibleRegionKind_Ptr is access MapVisibleRegionKind;
   
   type MapWatermarkMode is (
      Automatic,
      On
   );
   for MapWatermarkMode use (
      Automatic => 0,
      On => 1
   );
   for MapWatermarkMode'Size use 32;
   
   type MapWatermarkMode_Ptr is access MapWatermarkMode;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type MapZoomLevelRange is record
      Min : Windows.Double;
      Max : Windows.Double;
   end record;
   pragma Convention (C_Pass_By_Copy , MapZoomLevelRange);
   
   type MapZoomLevelRange_Ptr is access MapZoomLevelRange;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IMapModel3D_Interface;
   type AsyncOperationCompletedHandler_IMapModel3D is access all AsyncOperationCompletedHandler_IMapModel3D_Interface'Class;
   type AsyncOperationCompletedHandler_IMapModel3D_Ptr is access all AsyncOperationCompletedHandler_IMapModel3D;
   type TypedEventHandler_IMapScene_add_TargetCameraChanged_Interface;
   type TypedEventHandler_IMapScene_add_TargetCameraChanged is access all TypedEventHandler_IMapScene_add_TargetCameraChanged_Interface'Class;
   type TypedEventHandler_IMapScene_add_TargetCameraChanged_Ptr is access all TypedEventHandler_IMapScene_add_TargetCameraChanged;
   type AsyncOperationCompletedHandler_IStreetsidePanorama_Interface;
   type AsyncOperationCompletedHandler_IStreetsidePanorama is access all AsyncOperationCompletedHandler_IStreetsidePanorama_Interface'Class;
   type AsyncOperationCompletedHandler_IStreetsidePanorama_Ptr is access all AsyncOperationCompletedHandler_IStreetsidePanorama;
   type TypedEventHandler_ICustomMapTileDataSource_add_BitmapRequested_Interface;
   type TypedEventHandler_ICustomMapTileDataSource_add_BitmapRequested is access all TypedEventHandler_ICustomMapTileDataSource_add_BitmapRequested_Interface'Class;
   type TypedEventHandler_ICustomMapTileDataSource_add_BitmapRequested_Ptr is access all TypedEventHandler_ICustomMapTileDataSource_add_BitmapRequested;
   type TypedEventHandler_IHttpMapTileDataSource_add_UriRequested_Interface;
   type TypedEventHandler_IHttpMapTileDataSource_add_UriRequested is access all TypedEventHandler_IHttpMapTileDataSource_add_UriRequested_Interface'Class;
   type TypedEventHandler_IHttpMapTileDataSource_add_UriRequested_Ptr is access all TypedEventHandler_IHttpMapTileDataSource_add_UriRequested;
   type TypedEventHandler_ILocalMapTileDataSource_add_UriRequested_Interface;
   type TypedEventHandler_ILocalMapTileDataSource_add_UriRequested is access all TypedEventHandler_ILocalMapTileDataSource_add_UriRequested_Interface'Class;
   type TypedEventHandler_ILocalMapTileDataSource_add_UriRequested_Ptr is access all TypedEventHandler_ILocalMapTileDataSource_add_UriRequested;
   type TypedEventHandler_IMapElementsLayer_add_MapElementClick_Interface;
   type TypedEventHandler_IMapElementsLayer_add_MapElementClick is access all TypedEventHandler_IMapElementsLayer_add_MapElementClick_Interface'Class;
   type TypedEventHandler_IMapElementsLayer_add_MapElementClick_Ptr is access all TypedEventHandler_IMapElementsLayer_add_MapElementClick;
   type TypedEventHandler_IMapElementsLayer_add_MapElementPointerEntered_Interface;
   type TypedEventHandler_IMapElementsLayer_add_MapElementPointerEntered is access all TypedEventHandler_IMapElementsLayer_add_MapElementPointerEntered_Interface'Class;
   type TypedEventHandler_IMapElementsLayer_add_MapElementPointerEntered_Ptr is access all TypedEventHandler_IMapElementsLayer_add_MapElementPointerEntered;
   type TypedEventHandler_IMapElementsLayer_add_MapElementPointerExited_Interface;
   type TypedEventHandler_IMapElementsLayer_add_MapElementPointerExited is access all TypedEventHandler_IMapElementsLayer_add_MapElementPointerExited_Interface'Class;
   type TypedEventHandler_IMapElementsLayer_add_MapElementPointerExited_Ptr is access all TypedEventHandler_IMapElementsLayer_add_MapElementPointerExited;
   type TypedEventHandler_IMapElementsLayer_add_MapContextRequested_Interface;
   type TypedEventHandler_IMapElementsLayer_add_MapContextRequested is access all TypedEventHandler_IMapElementsLayer_add_MapContextRequested_Interface'Class;
   type TypedEventHandler_IMapElementsLayer_add_MapContextRequested_Ptr is access all TypedEventHandler_IMapElementsLayer_add_MapContextRequested;
   type TypedEventHandler_IMapControl_add_CenterChanged_Interface;
   type TypedEventHandler_IMapControl_add_CenterChanged is access all TypedEventHandler_IMapControl_add_CenterChanged_Interface'Class;
   type TypedEventHandler_IMapControl_add_CenterChanged_Ptr is access all TypedEventHandler_IMapControl_add_CenterChanged;
   type TypedEventHandler_IMapControl_add_HeadingChanged_Interface;
   type TypedEventHandler_IMapControl_add_HeadingChanged is access all TypedEventHandler_IMapControl_add_HeadingChanged_Interface'Class;
   type TypedEventHandler_IMapControl_add_HeadingChanged_Ptr is access all TypedEventHandler_IMapControl_add_HeadingChanged;
   type TypedEventHandler_IMapControl_add_LoadingStatusChanged_Interface;
   type TypedEventHandler_IMapControl_add_LoadingStatusChanged is access all TypedEventHandler_IMapControl_add_LoadingStatusChanged_Interface'Class;
   type TypedEventHandler_IMapControl_add_LoadingStatusChanged_Ptr is access all TypedEventHandler_IMapControl_add_LoadingStatusChanged;
   type TypedEventHandler_IMapControl_add_MapDoubleTapped_Interface;
   type TypedEventHandler_IMapControl_add_MapDoubleTapped is access all TypedEventHandler_IMapControl_add_MapDoubleTapped_Interface'Class;
   type TypedEventHandler_IMapControl_add_MapDoubleTapped_Ptr is access all TypedEventHandler_IMapControl_add_MapDoubleTapped;
   type TypedEventHandler_IMapControl_add_MapHolding_Interface;
   type TypedEventHandler_IMapControl_add_MapHolding is access all TypedEventHandler_IMapControl_add_MapHolding_Interface'Class;
   type TypedEventHandler_IMapControl_add_MapHolding_Ptr is access all TypedEventHandler_IMapControl_add_MapHolding;
   type TypedEventHandler_IMapControl_add_MapTapped_Interface;
   type TypedEventHandler_IMapControl_add_MapTapped is access all TypedEventHandler_IMapControl_add_MapTapped_Interface'Class;
   type TypedEventHandler_IMapControl_add_MapTapped_Ptr is access all TypedEventHandler_IMapControl_add_MapTapped;
   type TypedEventHandler_IMapControl_add_PitchChanged_Interface;
   type TypedEventHandler_IMapControl_add_PitchChanged is access all TypedEventHandler_IMapControl_add_PitchChanged_Interface'Class;
   type TypedEventHandler_IMapControl_add_PitchChanged_Ptr is access all TypedEventHandler_IMapControl_add_PitchChanged;
   type TypedEventHandler_IMapControl_add_TransformOriginChanged_Interface;
   type TypedEventHandler_IMapControl_add_TransformOriginChanged is access all TypedEventHandler_IMapControl_add_TransformOriginChanged_Interface'Class;
   type TypedEventHandler_IMapControl_add_TransformOriginChanged_Ptr is access all TypedEventHandler_IMapControl_add_TransformOriginChanged;
   type TypedEventHandler_IMapControl_add_ZoomLevelChanged_Interface;
   type TypedEventHandler_IMapControl_add_ZoomLevelChanged is access all TypedEventHandler_IMapControl_add_ZoomLevelChanged_Interface'Class;
   type TypedEventHandler_IMapControl_add_ZoomLevelChanged_Ptr is access all TypedEventHandler_IMapControl_add_ZoomLevelChanged;
   type TypedEventHandler_IMapControl2_add_MapElementClick_Interface;
   type TypedEventHandler_IMapControl2_add_MapElementClick is access all TypedEventHandler_IMapControl2_add_MapElementClick_Interface'Class;
   type TypedEventHandler_IMapControl2_add_MapElementClick_Ptr is access all TypedEventHandler_IMapControl2_add_MapElementClick;
   type TypedEventHandler_IMapControl2_add_MapElementPointerEntered_Interface;
   type TypedEventHandler_IMapControl2_add_MapElementPointerEntered is access all TypedEventHandler_IMapControl2_add_MapElementPointerEntered_Interface'Class;
   type TypedEventHandler_IMapControl2_add_MapElementPointerEntered_Ptr is access all TypedEventHandler_IMapControl2_add_MapElementPointerEntered;
   type TypedEventHandler_IMapControl2_add_MapElementPointerExited_Interface;
   type TypedEventHandler_IMapControl2_add_MapElementPointerExited is access all TypedEventHandler_IMapControl2_add_MapElementPointerExited_Interface'Class;
   type TypedEventHandler_IMapControl2_add_MapElementPointerExited_Ptr is access all TypedEventHandler_IMapControl2_add_MapElementPointerExited;
   type TypedEventHandler_IMapControl2_add_ActualCameraChanged_Interface;
   type TypedEventHandler_IMapControl2_add_ActualCameraChanged is access all TypedEventHandler_IMapControl2_add_ActualCameraChanged_Interface'Class;
   type TypedEventHandler_IMapControl2_add_ActualCameraChanged_Ptr is access all TypedEventHandler_IMapControl2_add_ActualCameraChanged;
   type TypedEventHandler_IMapControl2_add_ActualCameraChanging_Interface;
   type TypedEventHandler_IMapControl2_add_ActualCameraChanging is access all TypedEventHandler_IMapControl2_add_ActualCameraChanging_Interface'Class;
   type TypedEventHandler_IMapControl2_add_ActualCameraChanging_Ptr is access all TypedEventHandler_IMapControl2_add_ActualCameraChanging;
   type TypedEventHandler_IMapControl2_add_TargetCameraChanged_Interface;
   type TypedEventHandler_IMapControl2_add_TargetCameraChanged is access all TypedEventHandler_IMapControl2_add_TargetCameraChanged_Interface'Class;
   type TypedEventHandler_IMapControl2_add_TargetCameraChanged_Ptr is access all TypedEventHandler_IMapControl2_add_TargetCameraChanged;
   type TypedEventHandler_IMapControl2_add_CustomExperienceChanged_Interface;
   type TypedEventHandler_IMapControl2_add_CustomExperienceChanged is access all TypedEventHandler_IMapControl2_add_CustomExperienceChanged_Interface'Class;
   type TypedEventHandler_IMapControl2_add_CustomExperienceChanged_Ptr is access all TypedEventHandler_IMapControl2_add_CustomExperienceChanged;
   type TypedEventHandler_IMapControl3_add_MapRightTapped_Interface;
   type TypedEventHandler_IMapControl3_add_MapRightTapped is access all TypedEventHandler_IMapControl3_add_MapRightTapped_Interface'Class;
   type TypedEventHandler_IMapControl3_add_MapRightTapped_Ptr is access all TypedEventHandler_IMapControl3_add_MapRightTapped;
   type TypedEventHandler_IMapControl5_add_MapContextRequested_Interface;
   type TypedEventHandler_IMapControl5_add_MapContextRequested is access all TypedEventHandler_IMapControl5_add_MapContextRequested_Interface'Class;
   type TypedEventHandler_IMapControl5_add_MapContextRequested_Ptr is access all TypedEventHandler_IMapControl5_add_MapContextRequested;
   type TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkClick_Interface;
   type TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkClick is access all TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkClick_Interface'Class;
   type TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkClick_Ptr is access all TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkClick;
   type TypedEventHandler_IMapControlDataHelper_add_TransitFeatureClick_Interface;
   type TypedEventHandler_IMapControlDataHelper_add_TransitFeatureClick is access all TypedEventHandler_IMapControlDataHelper_add_TransitFeatureClick_Interface'Class;
   type TypedEventHandler_IMapControlDataHelper_add_TransitFeatureClick_Ptr is access all TypedEventHandler_IMapControlDataHelper_add_TransitFeatureClick;
   type TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkRightTapped_Interface;
   type TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkRightTapped is access all TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkRightTapped_Interface'Class;
   type TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkRightTapped_Ptr is access all TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkRightTapped;
   type TypedEventHandler_IMapControlDataHelper_add_TransitFeatureRightTapped_Interface;
   type TypedEventHandler_IMapControlDataHelper_add_TransitFeatureRightTapped is access all TypedEventHandler_IMapControlDataHelper_add_TransitFeatureRightTapped_Interface'Class;
   type TypedEventHandler_IMapControlDataHelper_add_TransitFeatureRightTapped_Ptr is access all TypedEventHandler_IMapControlDataHelper_add_TransitFeatureRightTapped;
   type TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerEntered_Interface;
   type TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerEntered is access all TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerEntered_Interface'Class;
   type TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerEntered_Ptr is access all TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerEntered;
   type TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerEntered_Interface;
   type TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerEntered is access all TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerEntered_Interface'Class;
   type TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerEntered_Ptr is access all TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerEntered;
   type TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerExited_Interface;
   type TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerExited is access all TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerExited_Interface'Class;
   type TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerExited_Ptr is access all TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerExited;
   type TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerExited_Interface;
   type TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerExited is access all TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerExited_Interface'Class;
   type TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerExited_Ptr is access all TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerExited;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IMapStyleSheetEntriesStatics_Interface;
   type IMapStyleSheetEntriesStatics is access all IMapStyleSheetEntriesStatics_Interface'Class;
   type IMapStyleSheetEntriesStatics_Ptr is access all IMapStyleSheetEntriesStatics;
   type IMapStyleSheetEntryStatesStatics_Interface;
   type IMapStyleSheetEntryStatesStatics is access all IMapStyleSheetEntryStatesStatics_Interface'Class;
   type IMapStyleSheetEntryStatesStatics_Ptr is access all IMapStyleSheetEntryStatesStatics;
   type IMapActualCameraChangedEventArgs_Interface;
   type IMapActualCameraChangedEventArgs is access all IMapActualCameraChangedEventArgs_Interface'Class;
   type IMapActualCameraChangedEventArgs_Ptr is access all IMapActualCameraChangedEventArgs;
   type IMapActualCameraChangedEventArgs2_Interface;
   type IMapActualCameraChangedEventArgs2 is access all IMapActualCameraChangedEventArgs2_Interface'Class;
   type IMapActualCameraChangedEventArgs2_Ptr is access all IMapActualCameraChangedEventArgs2;
   type IMapActualCameraChangingEventArgs_Interface;
   type IMapActualCameraChangingEventArgs is access all IMapActualCameraChangingEventArgs_Interface'Class;
   type IMapActualCameraChangingEventArgs_Ptr is access all IMapActualCameraChangingEventArgs;
   type IMapActualCameraChangingEventArgs2_Interface;
   type IMapActualCameraChangingEventArgs2 is access all IMapActualCameraChangingEventArgs2_Interface'Class;
   type IMapActualCameraChangingEventArgs2_Ptr is access all IMapActualCameraChangingEventArgs2;
   type IMapContextRequestedEventArgs_Interface;
   type IMapContextRequestedEventArgs is access all IMapContextRequestedEventArgs_Interface'Class;
   type IMapContextRequestedEventArgs_Ptr is access all IMapContextRequestedEventArgs;
   type IMapCustomExperienceChangedEventArgs_Interface;
   type IMapCustomExperienceChangedEventArgs is access all IMapCustomExperienceChangedEventArgs_Interface'Class;
   type IMapCustomExperienceChangedEventArgs_Ptr is access all IMapCustomExperienceChangedEventArgs;
   type IMapElementClickEventArgs_Interface;
   type IMapElementClickEventArgs is access all IMapElementClickEventArgs_Interface'Class;
   type IMapElementClickEventArgs_Ptr is access all IMapElementClickEventArgs;
   type IMapElementPointerEnteredEventArgs_Interface;
   type IMapElementPointerEnteredEventArgs is access all IMapElementPointerEnteredEventArgs_Interface'Class;
   type IMapElementPointerEnteredEventArgs_Ptr is access all IMapElementPointerEnteredEventArgs;
   type IMapElementPointerExitedEventArgs_Interface;
   type IMapElementPointerExitedEventArgs is access all IMapElementPointerExitedEventArgs_Interface'Class;
   type IMapElementPointerExitedEventArgs_Ptr is access all IMapElementPointerExitedEventArgs;
   type IMapElementsLayerClickEventArgs_Interface;
   type IMapElementsLayerClickEventArgs is access all IMapElementsLayerClickEventArgs_Interface'Class;
   type IMapElementsLayerClickEventArgs_Ptr is access all IMapElementsLayerClickEventArgs;
   type IMapElementsLayerContextRequestedEventArgs_Interface;
   type IMapElementsLayerContextRequestedEventArgs is access all IMapElementsLayerContextRequestedEventArgs_Interface'Class;
   type IMapElementsLayerContextRequestedEventArgs_Ptr is access all IMapElementsLayerContextRequestedEventArgs;
   type IMapElementsLayerPointerEnteredEventArgs_Interface;
   type IMapElementsLayerPointerEnteredEventArgs is access all IMapElementsLayerPointerEnteredEventArgs_Interface'Class;
   type IMapElementsLayerPointerEnteredEventArgs_Ptr is access all IMapElementsLayerPointerEnteredEventArgs;
   type IMapElementsLayerPointerExitedEventArgs_Interface;
   type IMapElementsLayerPointerExitedEventArgs is access all IMapElementsLayerPointerExitedEventArgs_Interface'Class;
   type IMapElementsLayerPointerExitedEventArgs_Ptr is access all IMapElementsLayerPointerExitedEventArgs;
   type IMapRightTappedEventArgs_Interface;
   type IMapRightTappedEventArgs is access all IMapRightTappedEventArgs_Interface'Class;
   type IMapRightTappedEventArgs_Ptr is access all IMapRightTappedEventArgs;
   type IMapTargetCameraChangedEventArgs_Interface;
   type IMapTargetCameraChangedEventArgs is access all IMapTargetCameraChangedEventArgs_Interface'Class;
   type IMapTargetCameraChangedEventArgs_Ptr is access all IMapTargetCameraChangedEventArgs;
   type IMapTargetCameraChangedEventArgs2_Interface;
   type IMapTargetCameraChangedEventArgs2 is access all IMapTargetCameraChangedEventArgs2_Interface'Class;
   type IMapTargetCameraChangedEventArgs2_Ptr is access all IMapTargetCameraChangedEventArgs2;
   type IMapTileBitmapRequest_Interface;
   type IMapTileBitmapRequest is access all IMapTileBitmapRequest_Interface'Class;
   type IMapTileBitmapRequest_Ptr is access all IMapTileBitmapRequest;
   type IMapTileBitmapRequestDeferral_Interface;
   type IMapTileBitmapRequestDeferral is access all IMapTileBitmapRequestDeferral_Interface'Class;
   type IMapTileBitmapRequestDeferral_Ptr is access all IMapTileBitmapRequestDeferral;
   type IMapTileBitmapRequestedEventArgs_Interface;
   type IMapTileBitmapRequestedEventArgs is access all IMapTileBitmapRequestedEventArgs_Interface'Class;
   type IMapTileBitmapRequestedEventArgs_Ptr is access all IMapTileBitmapRequestedEventArgs;
   type IMapTileUriRequest_Interface;
   type IMapTileUriRequest is access all IMapTileUriRequest_Interface'Class;
   type IMapTileUriRequest_Ptr is access all IMapTileUriRequest;
   type IMapTileUriRequestDeferral_Interface;
   type IMapTileUriRequestDeferral is access all IMapTileUriRequestDeferral_Interface'Class;
   type IMapTileUriRequestDeferral_Ptr is access all IMapTileUriRequestDeferral;
   type IMapTileUriRequestedEventArgs_Interface;
   type IMapTileUriRequestedEventArgs is access all IMapTileUriRequestedEventArgs_Interface'Class;
   type IMapTileUriRequestedEventArgs_Ptr is access all IMapTileUriRequestedEventArgs;
   type IMapCamera_Interface;
   type IMapCamera is access all IMapCamera_Interface'Class;
   type IMapCamera_Ptr is access all IMapCamera;
   type IMapCameraFactory_Interface;
   type IMapCameraFactory is access all IMapCameraFactory_Interface'Class;
   type IMapCameraFactory_Ptr is access all IMapCameraFactory;
   type IMapCustomExperience_Interface;
   type IMapCustomExperience is access all IMapCustomExperience_Interface'Class;
   type IMapCustomExperience_Ptr is access all IMapCustomExperience;
   type IMapCustomExperienceFactory_Interface;
   type IMapCustomExperienceFactory is access all IMapCustomExperienceFactory_Interface'Class;
   type IMapCustomExperienceFactory_Ptr is access all IMapCustomExperienceFactory;
   type IMapElement_Interface;
   type IMapElement is access all IMapElement_Interface'Class;
   type IMapElement_Ptr is access all IMapElement;
   type IMapElementStatics_Interface;
   type IMapElementStatics is access all IMapElementStatics_Interface'Class;
   type IMapElementStatics_Ptr is access all IMapElementStatics;
   type IMapElementFactory_Interface;
   type IMapElementFactory is access all IMapElementFactory_Interface'Class;
   type IMapElementFactory_Ptr is access all IMapElementFactory;
   type IMapElement2_Interface;
   type IMapElement2 is access all IMapElement2_Interface'Class;
   type IMapElement2_Ptr is access all IMapElement2;
   type IMapElementStatics2_Interface;
   type IMapElementStatics2 is access all IMapElementStatics2_Interface'Class;
   type IMapElementStatics2_Ptr is access all IMapElementStatics2;
   type IMapElement3_Interface;
   type IMapElement3 is access all IMapElement3_Interface'Class;
   type IMapElement3_Ptr is access all IMapElement3;
   type IMapElementStatics3_Interface;
   type IMapElementStatics3 is access all IMapElementStatics3_Interface'Class;
   type IMapElementStatics3_Ptr is access all IMapElementStatics3;
   type IMapElement4_Interface;
   type IMapElement4 is access all IMapElement4_Interface'Class;
   type IMapElement4_Ptr is access all IMapElement4;
   type IMapElementStatics4_Interface;
   type IMapElementStatics4 is access all IMapElementStatics4_Interface'Class;
   type IMapElementStatics4_Ptr is access all IMapElementStatics4;
   type IMapInputEventArgs_Interface;
   type IMapInputEventArgs is access all IMapInputEventArgs_Interface'Class;
   type IMapInputEventArgs_Ptr is access all IMapInputEventArgs;
   type IMapItemsControl_Interface;
   type IMapItemsControl is access all IMapItemsControl_Interface'Class;
   type IMapItemsControl_Ptr is access all IMapItemsControl;
   type IMapItemsControlStatics_Interface;
   type IMapItemsControlStatics is access all IMapItemsControlStatics_Interface'Class;
   type IMapItemsControlStatics_Ptr is access all IMapItemsControlStatics;
   type IMapLayer_Interface;
   type IMapLayer is access all IMapLayer_Interface'Class;
   type IMapLayer_Ptr is access all IMapLayer;
   type IMapLayerStatics_Interface;
   type IMapLayerStatics is access all IMapLayerStatics_Interface'Class;
   type IMapLayerStatics_Ptr is access all IMapLayerStatics;
   type IMapLayerFactory_Interface;
   type IMapLayerFactory is access all IMapLayerFactory_Interface'Class;
   type IMapLayerFactory_Ptr is access all IMapLayerFactory;
   type IMapModel3D_Interface;
   type IMapModel3D is access all IMapModel3D_Interface'Class;
   type IMapModel3D_Ptr is access all IMapModel3D;
   type IMapModel3DStatics_Interface;
   type IMapModel3DStatics is access all IMapModel3DStatics_Interface'Class;
   type IMapModel3DStatics_Ptr is access all IMapModel3DStatics;
   type IMapModel3DFactory_Interface;
   type IMapModel3DFactory is access all IMapModel3DFactory_Interface'Class;
   type IMapModel3DFactory_Ptr is access all IMapModel3DFactory;
   type IMapRouteView_Interface;
   type IMapRouteView is access all IMapRouteView_Interface'Class;
   type IMapRouteView_Ptr is access all IMapRouteView;
   type IMapRouteViewFactory_Interface;
   type IMapRouteViewFactory is access all IMapRouteViewFactory_Interface'Class;
   type IMapRouteViewFactory_Ptr is access all IMapRouteViewFactory;
   type IMapScene_Interface;
   type IMapScene is access all IMapScene_Interface'Class;
   type IMapScene_Ptr is access all IMapScene;
   type IMapSceneStatics_Interface;
   type IMapSceneStatics is access all IMapSceneStatics_Interface'Class;
   type IMapSceneStatics_Ptr is access all IMapSceneStatics;
   type IMapStyleSheet_Interface;
   type IMapStyleSheet is access all IMapStyleSheet_Interface'Class;
   type IMapStyleSheet_Ptr is access all IMapStyleSheet;
   type IMapStyleSheetStatics_Interface;
   type IMapStyleSheetStatics is access all IMapStyleSheetStatics_Interface'Class;
   type IMapStyleSheetStatics_Ptr is access all IMapStyleSheetStatics;
   type IMapTileDataSource_Interface;
   type IMapTileDataSource is access all IMapTileDataSource_Interface'Class;
   type IMapTileDataSource_Ptr is access all IMapTileDataSource;
   type IMapTileDataSourceFactory_Interface;
   type IMapTileDataSourceFactory is access all IMapTileDataSourceFactory_Interface'Class;
   type IMapTileDataSourceFactory_Ptr is access all IMapTileDataSourceFactory;
   type IMapTileSource_Interface;
   type IMapTileSource is access all IMapTileSource_Interface'Class;
   type IMapTileSource_Ptr is access all IMapTileSource;
   type IMapTileSourceStatics_Interface;
   type IMapTileSourceStatics is access all IMapTileSourceStatics_Interface'Class;
   type IMapTileSourceStatics_Ptr is access all IMapTileSourceStatics;
   type IMapTileSourceFactory_Interface;
   type IMapTileSourceFactory is access all IMapTileSourceFactory_Interface'Class;
   type IMapTileSourceFactory_Ptr is access all IMapTileSourceFactory;
   type IStreetsidePanorama_Interface;
   type IStreetsidePanorama is access all IStreetsidePanorama_Interface'Class;
   type IStreetsidePanorama_Ptr is access all IStreetsidePanorama;
   type IStreetsidePanoramaStatics_Interface;
   type IStreetsidePanoramaStatics is access all IStreetsidePanoramaStatics_Interface'Class;
   type IStreetsidePanoramaStatics_Ptr is access all IStreetsidePanoramaStatics;
   type ICustomMapTileDataSource_Interface;
   type ICustomMapTileDataSource is access all ICustomMapTileDataSource_Interface'Class;
   type ICustomMapTileDataSource_Ptr is access all ICustomMapTileDataSource;
   type ICustomMapTileDataSourceFactory_Interface;
   type ICustomMapTileDataSourceFactory is access all ICustomMapTileDataSourceFactory_Interface'Class;
   type ICustomMapTileDataSourceFactory_Ptr is access all ICustomMapTileDataSourceFactory;
   type IHttpMapTileDataSource_Interface;
   type IHttpMapTileDataSource is access all IHttpMapTileDataSource_Interface'Class;
   type IHttpMapTileDataSource_Ptr is access all IHttpMapTileDataSource;
   type IHttpMapTileDataSourceFactory_Interface;
   type IHttpMapTileDataSourceFactory is access all IHttpMapTileDataSourceFactory_Interface'Class;
   type IHttpMapTileDataSourceFactory_Ptr is access all IHttpMapTileDataSourceFactory;
   type ILocalMapTileDataSource_Interface;
   type ILocalMapTileDataSource is access all ILocalMapTileDataSource_Interface'Class;
   type ILocalMapTileDataSource_Ptr is access all ILocalMapTileDataSource;
   type ILocalMapTileDataSourceFactory_Interface;
   type ILocalMapTileDataSourceFactory is access all ILocalMapTileDataSourceFactory_Interface'Class;
   type ILocalMapTileDataSourceFactory_Ptr is access all ILocalMapTileDataSourceFactory;
   type IMapBillboard_Interface;
   type IMapBillboard is access all IMapBillboard_Interface'Class;
   type IMapBillboard_Ptr is access all IMapBillboard;
   type IMapBillboardStatics_Interface;
   type IMapBillboardStatics is access all IMapBillboardStatics_Interface'Class;
   type IMapBillboardStatics_Ptr is access all IMapBillboardStatics;
   type IMapBillboardFactory_Interface;
   type IMapBillboardFactory is access all IMapBillboardFactory_Interface'Class;
   type IMapBillboardFactory_Ptr is access all IMapBillboardFactory;
   type IMapElement3D_Interface;
   type IMapElement3D is access all IMapElement3D_Interface'Class;
   type IMapElement3D_Ptr is access all IMapElement3D;
   type IMapElement3DStatics_Interface;
   type IMapElement3DStatics is access all IMapElement3DStatics_Interface'Class;
   type IMapElement3DStatics_Ptr is access all IMapElement3DStatics;
   type IMapElementsLayer_Interface;
   type IMapElementsLayer is access all IMapElementsLayer_Interface'Class;
   type IMapElementsLayer_Ptr is access all IMapElementsLayer;
   type IMapElementsLayerStatics_Interface;
   type IMapElementsLayerStatics is access all IMapElementsLayerStatics_Interface'Class;
   type IMapElementsLayerStatics_Ptr is access all IMapElementsLayerStatics;
   type IMapIcon_Interface;
   type IMapIcon is access all IMapIcon_Interface'Class;
   type IMapIcon_Ptr is access all IMapIcon;
   type IMapIconStatics_Interface;
   type IMapIconStatics is access all IMapIconStatics_Interface'Class;
   type IMapIconStatics_Ptr is access all IMapIconStatics;
   type IMapIcon2_Interface;
   type IMapIcon2 is access all IMapIcon2_Interface'Class;
   type IMapIcon2_Ptr is access all IMapIcon2;
   type IMapIconStatics2_Interface;
   type IMapIconStatics2 is access all IMapIconStatics2_Interface'Class;
   type IMapIconStatics2_Ptr is access all IMapIconStatics2;
   type IMapPolygon_Interface;
   type IMapPolygon is access all IMapPolygon_Interface'Class;
   type IMapPolygon_Ptr is access all IMapPolygon;
   type IMapPolygonStatics_Interface;
   type IMapPolygonStatics is access all IMapPolygonStatics_Interface'Class;
   type IMapPolygonStatics_Ptr is access all IMapPolygonStatics;
   type IMapPolygon2_Interface;
   type IMapPolygon2 is access all IMapPolygon2_Interface'Class;
   type IMapPolygon2_Ptr is access all IMapPolygon2;
   type IMapPolyline_Interface;
   type IMapPolyline is access all IMapPolyline_Interface'Class;
   type IMapPolyline_Ptr is access all IMapPolyline;
   type IMapPolylineStatics_Interface;
   type IMapPolylineStatics is access all IMapPolylineStatics_Interface'Class;
   type IMapPolylineStatics_Ptr is access all IMapPolylineStatics;
   type IStreetsideExperience_Interface;
   type IStreetsideExperience is access all IStreetsideExperience_Interface'Class;
   type IStreetsideExperience_Ptr is access all IStreetsideExperience;
   type IStreetsideExperienceFactory_Interface;
   type IStreetsideExperienceFactory is access all IStreetsideExperienceFactory_Interface'Class;
   type IStreetsideExperienceFactory_Ptr is access all IStreetsideExperienceFactory;
   type IMapControl_Interface;
   type IMapControl is access all IMapControl_Interface'Class;
   type IMapControl_Ptr is access all IMapControl;
   type IMapControlStatics_Interface;
   type IMapControlStatics is access all IMapControlStatics_Interface'Class;
   type IMapControlStatics_Ptr is access all IMapControlStatics;
   type IMapControl2_Interface;
   type IMapControl2 is access all IMapControl2_Interface'Class;
   type IMapControl2_Ptr is access all IMapControl2;
   type IMapControlStatics2_Interface;
   type IMapControlStatics2 is access all IMapControlStatics2_Interface'Class;
   type IMapControlStatics2_Ptr is access all IMapControlStatics2;
   type IMapControl3_Interface;
   type IMapControl3 is access all IMapControl3_Interface'Class;
   type IMapControl3_Ptr is access all IMapControl3;
   type IMapControl4_Interface;
   type IMapControl4 is access all IMapControl4_Interface'Class;
   type IMapControl4_Ptr is access all IMapControl4;
   type IMapControlStatics4_Interface;
   type IMapControlStatics4 is access all IMapControlStatics4_Interface'Class;
   type IMapControlStatics4_Ptr is access all IMapControlStatics4;
   type IMapControl5_Interface;
   type IMapControl5 is access all IMapControl5_Interface'Class;
   type IMapControl5_Ptr is access all IMapControl5;
   type IMapControlStatics5_Interface;
   type IMapControlStatics5 is access all IMapControlStatics5_Interface'Class;
   type IMapControlStatics5_Ptr is access all IMapControlStatics5;
   type IMapControl6_Interface;
   type IMapControl6 is access all IMapControl6_Interface'Class;
   type IMapControl6_Ptr is access all IMapControl6;
   type IMapControlStatics6_Interface;
   type IMapControlStatics6 is access all IMapControlStatics6_Interface'Class;
   type IMapControlStatics6_Ptr is access all IMapControlStatics6;
   type IMapControl7_Interface;
   type IMapControl7 is access all IMapControl7_Interface'Class;
   type IMapControl7_Ptr is access all IMapControl7;
   type IMapControlStatics7_Interface;
   type IMapControlStatics7 is access all IMapControlStatics7_Interface'Class;
   type IMapControlStatics7_Ptr is access all IMapControlStatics7;
   type IMapControlDataHelper_Interface;
   type IMapControlDataHelper is access all IMapControlDataHelper_Interface'Class;
   type IMapControlDataHelper_Ptr is access all IMapControlDataHelper;
   type IMapControlDataHelper2_Interface;
   type IMapControlDataHelper2 is access all IMapControlDataHelper2_Interface'Class;
   type IMapControlDataHelper2_Ptr is access all IMapControlDataHelper2;
   type IMapControlDataHelperStatics_Interface;
   type IMapControlDataHelperStatics is access all IMapControlDataHelperStatics_Interface'Class;
   type IMapControlDataHelperStatics_Ptr is access all IMapControlDataHelperStatics;
   type IMapControlDataHelperFactory_Interface;
   type IMapControlDataHelperFactory is access all IMapControlDataHelperFactory_Interface'Class;
   type IMapControlDataHelperFactory_Ptr is access all IMapControlDataHelperFactory;
   type IMapControlBusinessLandmarkClickEventArgs_Interface;
   type IMapControlBusinessLandmarkClickEventArgs is access all IMapControlBusinessLandmarkClickEventArgs_Interface'Class;
   type IMapControlBusinessLandmarkClickEventArgs_Ptr is access all IMapControlBusinessLandmarkClickEventArgs;
   type IMapControlTransitFeatureClickEventArgs_Interface;
   type IMapControlTransitFeatureClickEventArgs is access all IMapControlTransitFeatureClickEventArgs_Interface'Class;
   type IMapControlTransitFeatureClickEventArgs_Ptr is access all IMapControlTransitFeatureClickEventArgs;
   type IMapControlBusinessLandmarkRightTappedEventArgs_Interface;
   type IMapControlBusinessLandmarkRightTappedEventArgs is access all IMapControlBusinessLandmarkRightTappedEventArgs_Interface'Class;
   type IMapControlBusinessLandmarkRightTappedEventArgs_Ptr is access all IMapControlBusinessLandmarkRightTappedEventArgs;
   type IMapControlTransitFeatureRightTappedEventArgs_Interface;
   type IMapControlTransitFeatureRightTappedEventArgs is access all IMapControlTransitFeatureRightTappedEventArgs_Interface'Class;
   type IMapControlTransitFeatureRightTappedEventArgs_Ptr is access all IMapControlTransitFeatureRightTappedEventArgs;
   type IMapControlBusinessLandmarkPointerEnteredEventArgs_Interface;
   type IMapControlBusinessLandmarkPointerEnteredEventArgs is access all IMapControlBusinessLandmarkPointerEnteredEventArgs_Interface'Class;
   type IMapControlBusinessLandmarkPointerEnteredEventArgs_Ptr is access all IMapControlBusinessLandmarkPointerEnteredEventArgs;
   type IMapControlTransitFeaturePointerEnteredEventArgs_Interface;
   type IMapControlTransitFeaturePointerEnteredEventArgs is access all IMapControlTransitFeaturePointerEnteredEventArgs_Interface'Class;
   type IMapControlTransitFeaturePointerEnteredEventArgs_Ptr is access all IMapControlTransitFeaturePointerEnteredEventArgs;
   type IMapControlBusinessLandmarkPointerExitedEventArgs_Interface;
   type IMapControlBusinessLandmarkPointerExitedEventArgs is access all IMapControlBusinessLandmarkPointerExitedEventArgs_Interface'Class;
   type IMapControlBusinessLandmarkPointerExitedEventArgs_Ptr is access all IMapControlBusinessLandmarkPointerExitedEventArgs;
   type IMapControlTransitFeaturePointerExitedEventArgs_Interface;
   type IMapControlTransitFeaturePointerExitedEventArgs is access all IMapControlTransitFeaturePointerExitedEventArgs_Interface'Class;
   type IMapControlTransitFeaturePointerExitedEventArgs_Ptr is access all IMapControlTransitFeaturePointerExitedEventArgs;
   type IIterator_IMapElement_Interface;
   type IIterator_IMapElement is access all IIterator_IMapElement_Interface'Class;
   type IIterator_IMapElement_Ptr is access all IIterator_IMapElement;
   type IIterable_IMapElement_Interface;
   type IIterable_IMapElement is access all IIterable_IMapElement_Interface'Class;
   type IIterable_IMapElement_Ptr is access all IIterable_IMapElement;
   type IVectorView_IMapElement_Interface;
   type IVectorView_IMapElement is access all IVectorView_IMapElement_Interface'Class;
   type IVectorView_IMapElement_Ptr is access all IVectorView_IMapElement;
   type IVector_IMapElement_Interface;
   type IVector_IMapElement is access all IVector_IMapElement_Interface'Class;
   type IVector_IMapElement_Ptr is access all IVector_IMapElement;
   type IAsyncOperation_IMapModel3D_Interface;
   type IAsyncOperation_IMapModel3D is access all IAsyncOperation_IMapModel3D_Interface'Class;
   type IAsyncOperation_IMapModel3D_Ptr is access all IAsyncOperation_IMapModel3D;
   type IIterator_IMapStyleSheet_Interface;
   type IIterator_IMapStyleSheet is access all IIterator_IMapStyleSheet_Interface'Class;
   type IIterator_IMapStyleSheet_Ptr is access all IIterator_IMapStyleSheet;
   type IIterable_IMapStyleSheet_Interface;
   type IIterable_IMapStyleSheet is access all IIterable_IMapStyleSheet_Interface'Class;
   type IIterable_IMapStyleSheet_Ptr is access all IIterable_IMapStyleSheet;
   type IAsyncOperation_IStreetsidePanorama_Interface;
   type IAsyncOperation_IStreetsidePanorama is access all IAsyncOperation_IStreetsidePanorama_Interface'Class;
   type IAsyncOperation_IStreetsidePanorama_Ptr is access all IAsyncOperation_IStreetsidePanorama;
   type IIterator_IMapRouteView_Interface;
   type IIterator_IMapRouteView is access all IIterator_IMapRouteView_Interface'Class;
   type IIterator_IMapRouteView_Ptr is access all IIterator_IMapRouteView;
   type IIterable_IMapRouteView_Interface;
   type IIterable_IMapRouteView is access all IIterable_IMapRouteView_Interface'Class;
   type IIterable_IMapRouteView_Ptr is access all IIterable_IMapRouteView;
   type IVectorView_IMapRouteView_Interface;
   type IVectorView_IMapRouteView is access all IVectorView_IMapRouteView_Interface'Class;
   type IVectorView_IMapRouteView_Ptr is access all IVectorView_IMapRouteView;
   type IVector_IMapRouteView_Interface;
   type IVector_IMapRouteView is access all IVector_IMapRouteView_Interface'Class;
   type IVector_IMapRouteView_Ptr is access all IVector_IMapRouteView;
   type IIterator_IMapTileSource_Interface;
   type IIterator_IMapTileSource is access all IIterator_IMapTileSource_Interface'Class;
   type IIterator_IMapTileSource_Ptr is access all IIterator_IMapTileSource;
   type IIterable_IMapTileSource_Interface;
   type IIterable_IMapTileSource is access all IIterable_IMapTileSource_Interface'Class;
   type IIterable_IMapTileSource_Ptr is access all IIterable_IMapTileSource;
   type IVectorView_IMapTileSource_Interface;
   type IVectorView_IMapTileSource is access all IVectorView_IMapTileSource_Interface'Class;
   type IVectorView_IMapTileSource_Ptr is access all IVectorView_IMapTileSource;
   type IVector_IMapTileSource_Interface;
   type IVector_IMapTileSource is access all IVector_IMapTileSource_Interface'Class;
   type IVector_IMapTileSource_Ptr is access all IVector_IMapTileSource;
   type IIterator_IMapLayer_Interface;
   type IIterator_IMapLayer is access all IIterator_IMapLayer_Interface'Class;
   type IIterator_IMapLayer_Ptr is access all IIterator_IMapLayer;
   type IIterable_IMapLayer_Interface;
   type IIterable_IMapLayer is access all IIterable_IMapLayer_Interface'Class;
   type IIterable_IMapLayer_Ptr is access all IIterable_IMapLayer;
   type IVectorView_IMapLayer_Interface;
   type IVectorView_IMapLayer is access all IVectorView_IMapLayer_Interface'Class;
   type IVectorView_IMapLayer_Ptr is access all IVectorView_IMapLayer;
   type IVector_IMapLayer_Interface;
   type IVector_IMapLayer is access all IVector_IMapLayer_Interface'Class;
   type IVector_IMapLayer_Ptr is access all IVector_IMapLayer;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IMapStyleSheetEntriesStatics : aliased constant Windows.IID := (3378733893, 61210, 16804, (167, 87, 189, 79, 67, 225, 228, 209 ));
   
   type IMapStyleSheetEntriesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Area
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Airport
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Cemetery
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Continent
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Education
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IndigenousPeoplesReserve
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Island
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Medical
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Military
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Nautical
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Neighborhood
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Runway
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Sand
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ShoppingCenter
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Stadium
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Vegetation
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Forest
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_GolfCourse
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Park
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PlayingField
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Reserve
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Point
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NaturalPoint
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Peak
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VolcanicPeak
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WaterPoint
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PointOfInterest
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Business
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FoodPoint
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PopulatedPlace
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Capital
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AdminDistrictCapital
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CountryRegionCapital
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RoadShield
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RoadExit
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Transit
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Political
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CountryRegion
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AdminDistrict
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_District
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Structure
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Building
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EducationBuilding
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MedicalBuilding
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TransitBuilding
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Transportation
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Road
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ControlledAccessHighway
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HighSpeedRamp
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Highway
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MajorRoad
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ArterialRoad
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Street
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Ramp
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UnpavedStreet
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TollRoad
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Railway
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Trail
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WaterRoute
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Water
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_River
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RouteLine
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WalkingRoute
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DrivingRoute
   (
      This       : access IMapStyleSheetEntriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapStyleSheetEntryStatesStatics : aliased constant Windows.IID := (598496562, 34413, 19450, (180, 129, 57, 190, 161, 222, 53, 6 ));
   
   type IMapStyleSheetEntryStatesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Disabled
   (
      This       : access IMapStyleSheetEntryStatesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Hover
   (
      This       : access IMapStyleSheetEntryStatesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Selected
   (
      This       : access IMapStyleSheetEntryStatesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapActualCameraChangedEventArgs : aliased constant Windows.IID := (3667951834, 47092, 16940, (166, 24, 187, 170, 124, 29, 129, 76 ));
   
   type IMapActualCameraChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Camera
   (
      This       : access IMapActualCameraChangedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapCamera
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapActualCameraChangedEventArgs2 : aliased constant Windows.IID := (2074396645, 4316, 17754, (157, 4, 29, 114, 251, 109, 155, 147 ));
   
   type IMapActualCameraChangedEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChangeReason
   (
      This       : access IMapActualCameraChangedEventArgs2_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.MapCameraChangeReason
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapActualCameraChangingEventArgs : aliased constant Windows.IID := (1796062934, 37879, 18050, (141, 229, 164, 122, 28, 199, 169, 69 ));
   
   type IMapActualCameraChangingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Camera
   (
      This       : access IMapActualCameraChangingEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapCamera
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapActualCameraChangingEventArgs2 : aliased constant Windows.IID := (4068898967, 16556, 20106, (169, 39, 81, 15, 56, 70, 164, 126 ));
   
   type IMapActualCameraChangingEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChangeReason
   (
      This       : access IMapActualCameraChangingEventArgs2_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.MapCameraChangeReason
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapContextRequestedEventArgs : aliased constant Windows.IID := (4258378787, 51553, 19954, (187, 87, 130, 238, 15, 11, 181, 145 ));
   
   type IMapContextRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access IMapContextRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Location
   (
      This       : access IMapContextRequestedEventArgs_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_MapElements
   (
      This       : access IMapContextRequestedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IVectorView_IMapElement -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapCustomExperienceChangedEventArgs : aliased constant Windows.IID := (3118922651, 36801, 16450, (172, 52, 166, 27, 56, 187, 117, 20 ));
   
   type IMapCustomExperienceChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IMapElementClickEventArgs : aliased constant Windows.IID := (1075218961, 53376, 17689, (153, 161, 49, 73, 251, 137, 153, 208 ));
   
   type IMapElementClickEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access IMapElementClickEventArgs_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Location
   (
      This       : access IMapElementClickEventArgs_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_MapElements
   (
      This       : access IMapElementClickEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IVector_IMapElement -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapElementPointerEnteredEventArgs : aliased constant Windows.IID := (2877676878, 37335, 19249, (143, 10, 211, 144, 199, 211, 162, 239 ));
   
   type IMapElementPointerEnteredEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access IMapElementPointerEnteredEventArgs_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Location
   (
      This       : access IMapElementPointerEnteredEventArgs_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_MapElement
   (
      This       : access IMapElementPointerEnteredEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapElement
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapElementPointerExitedEventArgs : aliased constant Windows.IID := (3248773881, 24777, 18041, (145, 25, 32, 171, 199, 93, 147, 31 ));
   
   type IMapElementPointerExitedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access IMapElementPointerExitedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Location
   (
      This       : access IMapElementPointerExitedEventArgs_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_MapElement
   (
      This       : access IMapElementPointerExitedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapElement
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapElementsLayerClickEventArgs : aliased constant Windows.IID := (749195110, 44827, 19461, (140, 133, 247, 74, 227, 212, 103, 127 ));
   
   type IMapElementsLayerClickEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access IMapElementsLayerClickEventArgs_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Location
   (
      This       : access IMapElementsLayerClickEventArgs_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_MapElements
   (
      This       : access IMapElementsLayerClickEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IVector_IMapElement -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapElementsLayerContextRequestedEventArgs : aliased constant Windows.IID := (3662008499, 31246, 18264, (128, 139, 58, 99, 118, 39, 235, 13 ));
   
   type IMapElementsLayerContextRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access IMapElementsLayerContextRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Location
   (
      This       : access IMapElementsLayerContextRequestedEventArgs_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_MapElements
   (
      This       : access IMapElementsLayerContextRequestedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IVectorView_IMapElement -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapElementsLayerPointerEnteredEventArgs : aliased constant Windows.IID := (1971306546, 18068, 17412, (140, 137, 52, 139, 107, 118, 197, 230 ));
   
   type IMapElementsLayerPointerEnteredEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access IMapElementsLayerPointerEnteredEventArgs_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Location
   (
      This       : access IMapElementsLayerPointerEnteredEventArgs_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_MapElement
   (
      This       : access IMapElementsLayerPointerEnteredEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapElement
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapElementsLayerPointerExitedEventArgs : aliased constant Windows.IID := (2465449645, 1005, 19513, (175, 32, 42, 7, 238, 28, 206, 166 ));
   
   type IMapElementsLayerPointerExitedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access IMapElementsLayerPointerExitedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Location
   (
      This       : access IMapElementsLayerPointerExitedEventArgs_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_MapElement
   (
      This       : access IMapElementsLayerPointerExitedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapElement
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapRightTappedEventArgs : aliased constant Windows.IID := (546582897, 28648, 16550, (173, 14, 41, 115, 121, 181, 117, 167 ));
   
   type IMapRightTappedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access IMapRightTappedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Location
   (
      This       : access IMapRightTappedEventArgs_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapTargetCameraChangedEventArgs : aliased constant Windows.IID := (3689940082, 59731, 20392, (151, 208, 234, 134, 53, 144, 87, 207 ));
   
   type IMapTargetCameraChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Camera
   (
      This       : access IMapTargetCameraChangedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapCamera
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapTargetCameraChangedEventArgs2 : aliased constant Windows.IID := (2545988402, 62134, 17931, (141, 145, 172, 2, 10, 35, 131, 221 ));
   
   type IMapTargetCameraChangedEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChangeReason
   (
      This       : access IMapTargetCameraChangedEventArgs2_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.MapCameraChangeReason
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapTileBitmapRequest : aliased constant Windows.IID := (1181958076, 55453, 18219, (181, 246, 215, 6, 107, 5, 132, 244 ));
   
   type IMapTileBitmapRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PixelData
   (
      This       : access IMapTileBitmapRequest_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function put_PixelData
   (
      This       : access IMapTileBitmapRequest_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IMapTileBitmapRequest_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapTileBitmapRequestDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapTileBitmapRequestDeferral : aliased constant Windows.IID := (4265018690, 42156, 20218, (150, 101, 4, 144, 176, 202, 253, 210 ));
   
   type IMapTileBitmapRequestDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IMapTileBitmapRequestDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapTileBitmapRequestedEventArgs : aliased constant Windows.IID := (863987997, 39682, 19106, (139, 30, 204, 77, 145, 113, 155, 243 ));
   
   type IMapTileBitmapRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_X
   (
      This       : access IMapTileBitmapRequestedEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Y
   (
      This       : access IMapTileBitmapRequestedEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ZoomLevel
   (
      This       : access IMapTileBitmapRequestedEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Request
   (
      This       : access IMapTileBitmapRequestedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapTileBitmapRequest
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapTileUriRequest : aliased constant Windows.IID := (390079285, 12583, 17848, (135, 167, 153, 248, 125, 78, 39, 69 ));
   
   type IMapTileUriRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uri
   (
      This       : access IMapTileUriRequest_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_Uri
   (
      This       : access IMapTileUriRequest_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IMapTileUriRequest_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapTileUriRequestDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapTileUriRequestDeferral : aliased constant Windows.IID := (3239554528, 48958, 19537, (143, 170, 75, 89, 60, 246, 142, 178 ));
   
   type IMapTileUriRequestDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IMapTileUriRequestDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapTileUriRequestedEventArgs : aliased constant Windows.IID := (3524557635, 7103, 19352, (141, 211, 183, 131, 78, 64, 126, 13 ));
   
   type IMapTileUriRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_X
   (
      This       : access IMapTileUriRequestedEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Y
   (
      This       : access IMapTileUriRequestedEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ZoomLevel
   (
      This       : access IMapTileUriRequestedEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Request
   (
      This       : access IMapTileUriRequestedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapTileUriRequest
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapCamera : aliased constant Windows.IID := (1403434531, 49400, 19851, (173, 30, 165, 149, 152, 234, 132, 11 ));
   
   type IMapCamera_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Location
   (
      This       : access IMapCamera_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function put_Location
   (
      This       : access IMapCamera_Interface
      ; value : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_Heading
   (
      This       : access IMapCamera_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Heading
   (
      This       : access IMapCamera_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Pitch
   (
      This       : access IMapCamera_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Pitch
   (
      This       : access IMapCamera_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Roll
   (
      This       : access IMapCamera_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Roll
   (
      This       : access IMapCamera_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_FieldOfView
   (
      This       : access IMapCamera_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_FieldOfView
   (
      This       : access IMapCamera_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapCameraFactory : aliased constant Windows.IID := (3929739030, 33711, 19150, (142, 113, 16, 173, 159, 30, 158, 127 ));
   
   type IMapCameraFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithLocation
   (
      This       : access IMapCameraFactory_Interface
      ; location : Windows.Devices.Geolocation.IGeopoint
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapCamera
   )
   return Windows.HRESULT is abstract;
   
   function CreateInstanceWithLocationAndHeading
   (
      This       : access IMapCameraFactory_Interface
      ; location : Windows.Devices.Geolocation.IGeopoint
      ; headingInDegrees : Windows.Double
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapCamera
   )
   return Windows.HRESULT is abstract;
   
   function CreateInstanceWithLocationHeadingAndPitch
   (
      This       : access IMapCameraFactory_Interface
      ; location : Windows.Devices.Geolocation.IGeopoint
      ; headingInDegrees : Windows.Double
      ; pitchInDegrees : Windows.Double
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapCamera
   )
   return Windows.HRESULT is abstract;
   
   function CreateInstanceWithLocationHeadingPitchRollAndFieldOfView
   (
      This       : access IMapCameraFactory_Interface
      ; location : Windows.Devices.Geolocation.IGeopoint
      ; headingInDegrees : Windows.Double
      ; pitchInDegrees : Windows.Double
      ; rollInDegrees : Windows.Double
      ; fieldOfViewInDegrees : Windows.Double
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapCamera
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapCustomExperience : aliased constant Windows.IID := (1683564646, 5283, 20063, (136, 131, 142, 156, 80, 14, 238, 222 ));
   
   type IMapCustomExperience_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IMapCustomExperienceFactory : aliased constant Windows.IID := (2051030965, 41393, 20095, (146, 30, 62, 107, 141, 142, 190, 214 ));
   
   type IMapCustomExperienceFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IMapCustomExperienceFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapCustomExperience
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapElement : aliased constant Windows.IID := (3592406239, 45637, 18418, (154, 194, 67, 192, 88, 177, 201, 3 ));
   
   type IMapElement_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ZIndex
   (
      This       : access IMapElement_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_ZIndex
   (
      This       : access IMapElement_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Visible
   (
      This       : access IMapElement_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Visible
   (
      This       : access IMapElement_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapElementStatics : aliased constant Windows.IID := (3905363186, 49135, 19273, (142, 153, 65, 181, 227, 120, 159, 210 ));
   
   type IMapElementStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ZIndexProperty
   (
      This       : access IMapElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_VisibleProperty
   (
      This       : access IMapElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapElementFactory : aliased constant Windows.IID := (1244712967, 3030, 18341, (134, 11, 126, 124, 245, 240, 197, 115 ));
   
   type IMapElementFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IMapElementFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapElement
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapElement2 : aliased constant Windows.IID := (1712976481, 64422, 18788, (167, 255, 241, 175, 99, 171, 156, 176 ));
   
   type IMapElement2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MapTabIndex
   (
      This       : access IMapElement2_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_MapTabIndex
   (
      This       : access IMapElement2_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapElementStatics2 : aliased constant Windows.IID := (2616667952, 33022, 20272, (188, 193, 250, 137, 64, 80, 246, 118 ));
   
   type IMapElementStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MapTabIndexProperty
   (
      This       : access IMapElementStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapElement3 : aliased constant Windows.IID := (334478425, 17901, 18612, (147, 173, 227, 247, 143, 140, 242, 24 ));
   
   type IMapElement3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MapStyleSheetEntry
   (
      This       : access IMapElement3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_MapStyleSheetEntry
   (
      This       : access IMapElement3_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MapStyleSheetEntryState
   (
      This       : access IMapElement3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_MapStyleSheetEntryState
   (
      This       : access IMapElement3_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Tag
   (
      This       : access IMapElement3_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_Tag
   (
      This       : access IMapElement3_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapElementStatics3 : aliased constant Windows.IID := (3776899375, 38722, 18858, (170, 216, 46, 70, 107, 255, 55, 150 ));
   
   type IMapElementStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MapStyleSheetEntryProperty
   (
      This       : access IMapElementStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_MapStyleSheetEntryStateProperty
   (
      This       : access IMapElementStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TagProperty
   (
      This       : access IMapElementStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapElement4 : aliased constant Windows.IID := (1683522486, 8129, 19691, (147, 189, 220, 44, 150, 0, 114, 233 ));
   
   type IMapElement4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsEnabled
   (
      This       : access IMapElement4_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsEnabled
   (
      This       : access IMapElement4_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapElementStatics4 : aliased constant Windows.IID := (2754178827, 57336, 18044, (147, 21, 111, 109, 185, 62, 226, 186 ));
   
   type IMapElementStatics4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsEnabledProperty
   (
      This       : access IMapElementStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapInputEventArgs : aliased constant Windows.IID := (2680488864, 43170, 17300, (146, 233, 34, 71, 118, 79, 47, 73 ));
   
   type IMapInputEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access IMapInputEventArgs_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Location
   (
      This       : access IMapInputEventArgs_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapItemsControl : aliased constant Windows.IID := (2495792339, 45877, 17093, (182, 96, 230, 160, 126, 195, 189, 220 ));
   
   type IMapItemsControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ItemsSource
   (
      This       : access IMapItemsControl_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_ItemsSource
   (
      This       : access IMapItemsControl_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_Items
   (
      This       : access IMapItemsControl_Interface
      ; RetVal : access Windows.UI.Xaml.IVector_IDependencyObject -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemTemplate
   (
      This       : access IMapItemsControl_Interface
      ; RetVal : access Windows.UI.Xaml.IDataTemplate
   )
   return Windows.HRESULT is abstract;
   
   function put_ItemTemplate
   (
      This       : access IMapItemsControl_Interface
      ; value : Windows.UI.Xaml.IDataTemplate
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapItemsControlStatics : aliased constant Windows.IID := (866671047, 30875, 16988, (138, 10, 50, 56, 88, 150, 203, 74 ));
   
   type IMapItemsControlStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ItemsSourceProperty
   (
      This       : access IMapItemsControlStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemsProperty
   (
      This       : access IMapItemsControlStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemTemplateProperty
   (
      This       : access IMapItemsControlStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapLayer : aliased constant Windows.IID := (1829763521, 41293, 20375, (143, 87, 70, 113, 91, 87, 104, 58 ));
   
   type IMapLayer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MapTabIndex
   (
      This       : access IMapLayer_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_MapTabIndex
   (
      This       : access IMapLayer_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Visible
   (
      This       : access IMapLayer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Visible
   (
      This       : access IMapLayer_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ZIndex
   (
      This       : access IMapLayer_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_ZIndex
   (
      This       : access IMapLayer_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapLayerStatics : aliased constant Windows.IID := (2628035179, 23993, 20236, (189, 213, 177, 191, 253, 204, 233, 70 ));
   
   type IMapLayerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MapTabIndexProperty
   (
      This       : access IMapLayerStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_VisibleProperty
   (
      This       : access IMapLayerStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ZIndexProperty
   (
      This       : access IMapLayerStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapLayerFactory : aliased constant Windows.IID := (3760857607, 57059, 18376, (152, 37, 189, 2, 156, 87, 82, 247 ));
   
   type IMapLayerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IMapLayerFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapLayer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapModel3D : aliased constant Windows.IID := (4173676961, 51751, 18792, (162, 191, 156, 32, 240, 106, 4, 104 ));
   
   type IMapModel3D_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IMapModel3DStatics : aliased constant Windows.IID := (1211409536, 36438, 19215, (135, 45, 126, 173, 16, 49, 135, 205 ));
   
   type IMapModel3DStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFrom3MFAsync
   (
      This       : access IMapModel3DStatics_Interface
      ; source : Windows.Storage.Streams.IRandomAccessStreamReference
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IAsyncOperation_IMapModel3D -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFrom3MFWithShadingOptionAsync
   (
      This       : access IMapModel3DStatics_Interface
      ; source : Windows.Storage.Streams.IRandomAccessStreamReference
      ; shadingOption : Windows.UI.Xaml.Controls.Maps.MapModel3DShadingOption
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IAsyncOperation_IMapModel3D -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapModel3DFactory : aliased constant Windows.IID := (3749645260, 22538, 18827, (147, 155, 1, 25, 169, 218, 219, 158 ));
   
   type IMapModel3DFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IMapModel3DFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapModel3D
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapRouteView : aliased constant Windows.IID := (1947119301, 47820, 16865, (166, 126, 221, 101, 19, 131, 32, 73 ));
   
   type IMapRouteView_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RouteColor
   (
      This       : access IMapRouteView_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_RouteColor
   (
      This       : access IMapRouteView_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_OutlineColor
   (
      This       : access IMapRouteView_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_OutlineColor
   (
      This       : access IMapRouteView_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Route
   (
      This       : access IMapRouteView_Interface
      ; RetVal : access Windows.Services.Maps.IMapRoute
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapRouteViewFactory : aliased constant Windows.IID := (4035161567, 102, 17960, (130, 254, 234, 120, 194, 60, 236, 30 ));
   
   type IMapRouteViewFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithMapRoute
   (
      This       : access IMapRouteViewFactory_Interface
      ; route : Windows.Services.Maps.IMapRoute
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapRouteView
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapScene : aliased constant Windows.IID := (2344226985, 20711, 18476, (151, 137, 198, 136, 177, 120, 172, 36 ));
   
   type IMapScene_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetCamera
   (
      This       : access IMapScene_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapCamera
   )
   return Windows.HRESULT is abstract;
   
   function add_TargetCameraChanged
   (
      This       : access IMapScene_Interface
      ; value : TypedEventHandler_IMapScene_add_TargetCameraChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_TargetCameraChanged
   (
      This       : access IMapScene_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapSceneStatics : aliased constant Windows.IID := (65318252, 34540, 17625, (149, 151, 251, 117, 183, 222, 186, 10 ));
   
   type IMapSceneStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromBoundingBox
   (
      This       : access IMapSceneStatics_Interface
      ; bounds : Windows.Devices.Geolocation.IGeoboundingBox
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapScene
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromBoundingBoxWithHeadingAndPitch
   (
      This       : access IMapSceneStatics_Interface
      ; bounds : Windows.Devices.Geolocation.IGeoboundingBox
      ; headingInDegrees : Windows.Double
      ; pitchInDegrees : Windows.Double
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapScene
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromCamera
   (
      This       : access IMapSceneStatics_Interface
      ; camera : Windows.UI.Xaml.Controls.Maps.IMapCamera
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapScene
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromLocation
   (
      This       : access IMapSceneStatics_Interface
      ; location : Windows.Devices.Geolocation.IGeopoint
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapScene
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromLocationWithHeadingAndPitch
   (
      This       : access IMapSceneStatics_Interface
      ; location : Windows.Devices.Geolocation.IGeopoint
      ; headingInDegrees : Windows.Double
      ; pitchInDegrees : Windows.Double
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapScene
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromLocationAndRadius
   (
      This       : access IMapSceneStatics_Interface
      ; location : Windows.Devices.Geolocation.IGeopoint
      ; radiusInMeters : Windows.Double
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapScene
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromLocationAndRadiusWithHeadingAndPitch
   (
      This       : access IMapSceneStatics_Interface
      ; location : Windows.Devices.Geolocation.IGeopoint
      ; radiusInMeters : Windows.Double
      ; headingInDegrees : Windows.Double
      ; pitchInDegrees : Windows.Double
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapScene
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromLocations
   (
      This       : access IMapSceneStatics_Interface
      ; locations : Windows.Devices.Geolocation.IIterable_IGeopoint
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapScene
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromLocationsWithHeadingAndPitch
   (
      This       : access IMapSceneStatics_Interface
      ; locations : Windows.Devices.Geolocation.IIterable_IGeopoint
      ; headingInDegrees : Windows.Double
      ; pitchInDegrees : Windows.Double
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapScene
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapStyleSheet : aliased constant Windows.IID := (2924786367, 35217, 17133, (141, 88, 32, 71, 61, 238, 222, 29 ));
   
   type IMapStyleSheet_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IMapStyleSheetStatics : aliased constant Windows.IID := (2881290413, 2588, 17205, (130, 244, 97, 217, 54, 170, 25, 125 ));
   
   type IMapStyleSheetStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Aerial
   (
      This       : access IMapStyleSheetStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapStyleSheet
   )
   return Windows.HRESULT is abstract;
   
   function AerialWithOverlay
   (
      This       : access IMapStyleSheetStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapStyleSheet
   )
   return Windows.HRESULT is abstract;
   
   function RoadLight
   (
      This       : access IMapStyleSheetStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapStyleSheet
   )
   return Windows.HRESULT is abstract;
   
   function RoadDark
   (
      This       : access IMapStyleSheetStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapStyleSheet
   )
   return Windows.HRESULT is abstract;
   
   function RoadHighContrastLight
   (
      This       : access IMapStyleSheetStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapStyleSheet
   )
   return Windows.HRESULT is abstract;
   
   function RoadHighContrastDark
   (
      This       : access IMapStyleSheetStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapStyleSheet
   )
   return Windows.HRESULT is abstract;
   
   function Combine
   (
      This       : access IMapStyleSheetStatics_Interface
      ; styleSheets : Windows.UI.Xaml.Controls.Maps.IIterable_IMapStyleSheet
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapStyleSheet
   )
   return Windows.HRESULT is abstract;
   
   function ParseFromJson
   (
      This       : access IMapStyleSheetStatics_Interface
      ; styleAsJson : Windows.String
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapStyleSheet
   )
   return Windows.HRESULT is abstract;
   
   function TryParseFromJson
   (
      This       : access IMapStyleSheetStatics_Interface
      ; styleAsJson : Windows.String
      ; styleSheet : access Windows.UI.Xaml.Controls.Maps.IMapStyleSheet
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapTileDataSource : aliased constant Windows.IID := (3225263966, 48671, 19561, (153, 105, 121, 70, 122, 81, 60, 56 ));
   
   type IMapTileDataSource_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IMapTileDataSourceFactory : aliased constant Windows.IID := (2744258493, 58438, 17992, (167, 77, 253, 44, 93, 85, 124, 6 ));
   
   type IMapTileDataSourceFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IMapTileDataSourceFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapTileDataSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapTileSource : aliased constant Windows.IID := (2292674126, 12255, 17767, (146, 85, 17, 0, 81, 156, 141, 98 ));
   
   type IMapTileSource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DataSource
   (
      This       : access IMapTileSource_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapTileDataSource
   )
   return Windows.HRESULT is abstract;
   
   function put_DataSource
   (
      This       : access IMapTileSource_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.IMapTileDataSource
   )
   return Windows.HRESULT is abstract;
   
   function get_Layer
   (
      This       : access IMapTileSource_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.MapTileLayer
   )
   return Windows.HRESULT is abstract;
   
   function put_Layer
   (
      This       : access IMapTileSource_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.MapTileLayer
   )
   return Windows.HRESULT is abstract;
   
   function get_ZoomLevelRange
   (
      This       : access IMapTileSource_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.MapZoomLevelRange
   )
   return Windows.HRESULT is abstract;
   
   function put_ZoomLevelRange
   (
      This       : access IMapTileSource_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.MapZoomLevelRange
   )
   return Windows.HRESULT is abstract;
   
   function get_Bounds
   (
      This       : access IMapTileSource_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeoboundingBox
   )
   return Windows.HRESULT is abstract;
   
   function put_Bounds
   (
      This       : access IMapTileSource_Interface
      ; value : Windows.Devices.Geolocation.IGeoboundingBox
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowOverstretch
   (
      This       : access IMapTileSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowOverstretch
   (
      This       : access IMapTileSource_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsFadingEnabled
   (
      This       : access IMapTileSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsFadingEnabled
   (
      This       : access IMapTileSource_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsTransparencyEnabled
   (
      This       : access IMapTileSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsTransparencyEnabled
   (
      This       : access IMapTileSource_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsRetryEnabled
   (
      This       : access IMapTileSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsRetryEnabled
   (
      This       : access IMapTileSource_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ZIndex
   (
      This       : access IMapTileSource_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_ZIndex
   (
      This       : access IMapTileSource_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_TilePixelSize
   (
      This       : access IMapTileSource_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_TilePixelSize
   (
      This       : access IMapTileSource_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Visible
   (
      This       : access IMapTileSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Visible
   (
      This       : access IMapTileSource_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapTileSourceStatics : aliased constant Windows.IID := (2482817340, 28725, 17923, (153, 177, 230, 89, 146, 27, 96, 147 ));
   
   type IMapTileSourceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DataSourceProperty
   (
      This       : access IMapTileSourceStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_LayerProperty
   (
      This       : access IMapTileSourceStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ZoomLevelRangeProperty
   (
      This       : access IMapTileSourceStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_BoundsProperty
   (
      This       : access IMapTileSourceStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowOverstretchProperty
   (
      This       : access IMapTileSourceStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsFadingEnabledProperty
   (
      This       : access IMapTileSourceStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsTransparencyEnabledProperty
   (
      This       : access IMapTileSourceStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsRetryEnabledProperty
   (
      This       : access IMapTileSourceStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ZIndexProperty
   (
      This       : access IMapTileSourceStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TilePixelSizeProperty
   (
      This       : access IMapTileSourceStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_VisibleProperty
   (
      This       : access IMapTileSourceStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapTileSourceFactory : aliased constant Windows.IID := (3447685407, 30714, 18475, (157, 52, 113, 211, 29, 70, 92, 72 ));
   
   type IMapTileSourceFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IMapTileSourceFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapTileSource
   )
   return Windows.HRESULT is abstract;
   
   function CreateInstanceWithDataSource
   (
      This       : access IMapTileSourceFactory_Interface
      ; dataSource : Windows.UI.Xaml.Controls.Maps.IMapTileDataSource
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapTileSource
   )
   return Windows.HRESULT is abstract;
   
   function CreateInstanceWithDataSourceAndZoomRange
   (
      This       : access IMapTileSourceFactory_Interface
      ; dataSource : Windows.UI.Xaml.Controls.Maps.IMapTileDataSource
      ; zoomLevelRange : Windows.UI.Xaml.Controls.Maps.MapZoomLevelRange
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapTileSource
   )
   return Windows.HRESULT is abstract;
   
   function CreateInstanceWithDataSourceZoomRangeAndBounds
   (
      This       : access IMapTileSourceFactory_Interface
      ; dataSource : Windows.UI.Xaml.Controls.Maps.IMapTileDataSource
      ; zoomLevelRange : Windows.UI.Xaml.Controls.Maps.MapZoomLevelRange
      ; bounds : Windows.Devices.Geolocation.IGeoboundingBox
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapTileSource
   )
   return Windows.HRESULT is abstract;
   
   function CreateInstanceWithDataSourceZoomRangeBoundsAndTileSize
   (
      This       : access IMapTileSourceFactory_Interface
      ; dataSource : Windows.UI.Xaml.Controls.Maps.IMapTileDataSource
      ; zoomLevelRange : Windows.UI.Xaml.Controls.Maps.MapZoomLevelRange
      ; bounds : Windows.Devices.Geolocation.IGeoboundingBox
      ; tileSizeInPixels : Windows.Int32
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapTileSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStreetsidePanorama : aliased constant Windows.IID := (1876955096, 44384, 18020, (181, 57, 177, 6, 159, 22, 197, 175 ));
   
   type IStreetsidePanorama_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Location
   (
      This       : access IStreetsidePanorama_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStreetsidePanoramaStatics : aliased constant Windows.IID := (3551821673, 21683, 20165, (178, 160, 79, 130, 4, 87, 101, 7 ));
   
   type IStreetsidePanoramaStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FindNearbyWithLocationAsync
   (
      This       : access IStreetsidePanoramaStatics_Interface
      ; location : Windows.Devices.Geolocation.IGeopoint
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IAsyncOperation_IStreetsidePanorama -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindNearbyWithLocationAndRadiusAsync
   (
      This       : access IStreetsidePanoramaStatics_Interface
      ; location : Windows.Devices.Geolocation.IGeopoint
      ; radiusInMeters : Windows.Double
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IAsyncOperation_IStreetsidePanorama -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICustomMapTileDataSource : aliased constant Windows.IID := (1708800074, 11697, 19425, (177, 85, 61, 12, 158, 207, 71, 153 ));
   
   type ICustomMapTileDataSource_Interface is interface and Windows.IInspectable_Interface;
   
   function add_BitmapRequested
   (
      This       : access ICustomMapTileDataSource_Interface
      ; value : TypedEventHandler_ICustomMapTileDataSource_add_BitmapRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BitmapRequested
   (
      This       : access ICustomMapTileDataSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICustomMapTileDataSourceFactory : aliased constant Windows.IID := (3360127303, 51541, 20258, (148, 68, 161, 216, 215, 68, 175, 17 ));
   
   type ICustomMapTileDataSourceFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access ICustomMapTileDataSourceFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.ICustomMapTileDataSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpMapTileDataSource : aliased constant Windows.IID := (2634271580, 64889, 18325, (135, 190, 126, 84, 202, 11, 55, 208 ));
   
   type IHttpMapTileDataSource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UriFormatString
   (
      This       : access IHttpMapTileDataSource_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_UriFormatString
   (
      This       : access IHttpMapTileDataSource_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AdditionalRequestHeaders
   (
      This       : access IHttpMapTileDataSource_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowCaching
   (
      This       : access IHttpMapTileDataSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowCaching
   (
      This       : access IHttpMapTileDataSource_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_UriRequested
   (
      This       : access IHttpMapTileDataSource_Interface
      ; value : TypedEventHandler_IHttpMapTileDataSource_add_UriRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_UriRequested
   (
      This       : access IHttpMapTileDataSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpMapTileDataSourceFactory : aliased constant Windows.IID := (1404350727, 34012, 17041, (137, 248, 109, 11, 182, 18, 160, 85 ));
   
   type IHttpMapTileDataSourceFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IHttpMapTileDataSourceFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IHttpMapTileDataSource
   )
   return Windows.HRESULT is abstract;
   
   function CreateInstanceWithUriFormatString
   (
      This       : access IHttpMapTileDataSourceFactory_Interface
      ; uriFormatString : Windows.String
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IHttpMapTileDataSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILocalMapTileDataSource : aliased constant Windows.IID := (1633834933, 37128, 20242, (139, 244, 187, 60, 143, 98, 116, 229 ));
   
   type ILocalMapTileDataSource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UriFormatString
   (
      This       : access ILocalMapTileDataSource_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_UriFormatString
   (
      This       : access ILocalMapTileDataSource_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function add_UriRequested
   (
      This       : access ILocalMapTileDataSource_Interface
      ; value : TypedEventHandler_ILocalMapTileDataSource_add_UriRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_UriRequested
   (
      This       : access ILocalMapTileDataSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILocalMapTileDataSourceFactory : aliased constant Windows.IID := (3318737404, 29356, 18489, (138, 13, 1, 31, 36, 105, 60, 121 ));
   
   type ILocalMapTileDataSourceFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access ILocalMapTileDataSourceFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.ILocalMapTileDataSource
   )
   return Windows.HRESULT is abstract;
   
   function CreateInstanceWithUriFormatString
   (
      This       : access ILocalMapTileDataSourceFactory_Interface
      ; uriFormatString : Windows.String
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.ILocalMapTileDataSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapBillboard : aliased constant Windows.IID := (378807709, 2786, 20290, (160, 46, 41, 44, 168, 53, 211, 157 ));
   
   type IMapBillboard_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Location
   (
      This       : access IMapBillboard_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function put_Location
   (
      This       : access IMapBillboard_Interface
      ; value : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_NormalizedAnchorPoint
   (
      This       : access IMapBillboard_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_NormalizedAnchorPoint
   (
      This       : access IMapBillboard_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Image
   (
      This       : access IMapBillboard_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function put_Image
   (
      This       : access IMapBillboard_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_CollisionBehaviorDesired
   (
      This       : access IMapBillboard_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.MapElementCollisionBehavior
   )
   return Windows.HRESULT is abstract;
   
   function put_CollisionBehaviorDesired
   (
      This       : access IMapBillboard_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.MapElementCollisionBehavior
   )
   return Windows.HRESULT is abstract;
   
   function get_ReferenceCamera
   (
      This       : access IMapBillboard_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapCamera
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapBillboardStatics : aliased constant Windows.IID := (4260903422, 57847, 20400, (136, 135, 125, 166, 140, 100, 115, 51 ));
   
   type IMapBillboardStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LocationProperty
   (
      This       : access IMapBillboardStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_NormalizedAnchorPointProperty
   (
      This       : access IMapBillboardStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CollisionBehaviorDesiredProperty
   (
      This       : access IMapBillboardStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapBillboardFactory : aliased constant Windows.IID := (3192235205, 36617, 19334, (174, 40, 120, 55, 64, 235, 139, 49 ));
   
   type IMapBillboardFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceFromCamera
   (
      This       : access IMapBillboardFactory_Interface
      ; camera : Windows.UI.Xaml.Controls.Maps.IMapCamera
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapBillboard
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapElement3D : aliased constant Windows.IID := (2189097173, 14403, 18658, (189, 0, 15, 6, 68, 251, 230, 165 ));
   
   type IMapElement3D_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Location
   (
      This       : access IMapElement3D_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function put_Location
   (
      This       : access IMapElement3D_Interface
      ; value : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_Model
   (
      This       : access IMapElement3D_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapModel3D
   )
   return Windows.HRESULT is abstract;
   
   function put_Model
   (
      This       : access IMapElement3D_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.IMapModel3D
   )
   return Windows.HRESULT is abstract;
   
   function get_Heading
   (
      This       : access IMapElement3D_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Heading
   (
      This       : access IMapElement3D_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Pitch
   (
      This       : access IMapElement3D_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Pitch
   (
      This       : access IMapElement3D_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Roll
   (
      This       : access IMapElement3D_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Roll
   (
      This       : access IMapElement3D_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Scale
   (
      This       : access IMapElement3D_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function put_Scale
   (
      This       : access IMapElement3D_Interface
      ; value : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapElement3DStatics : aliased constant Windows.IID := (1630011674, 17679, 17450, (185, 217, 170, 129, 92, 113, 144, 122 ));
   
   type IMapElement3DStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LocationProperty
   (
      This       : access IMapElement3DStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_HeadingProperty
   (
      This       : access IMapElement3DStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_PitchProperty
   (
      This       : access IMapElement3DStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RollProperty
   (
      This       : access IMapElement3DStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ScaleProperty
   (
      This       : access IMapElement3DStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapElementsLayer : aliased constant Windows.IID := (3732498586, 495, 18164, (172, 96, 124, 32, 11, 85, 38, 16 ));
   
   type IMapElementsLayer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MapElements
   (
      This       : access IMapElementsLayer_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IVector_IMapElement -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MapElements
   (
      This       : access IMapElementsLayer_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.IVector_IMapElement
   )
   return Windows.HRESULT is abstract;
   
   function add_MapElementClick
   (
      This       : access IMapElementsLayer_Interface
      ; value : TypedEventHandler_IMapElementsLayer_add_MapElementClick
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MapElementClick
   (
      This       : access IMapElementsLayer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_MapElementPointerEntered
   (
      This       : access IMapElementsLayer_Interface
      ; value : TypedEventHandler_IMapElementsLayer_add_MapElementPointerEntered
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MapElementPointerEntered
   (
      This       : access IMapElementsLayer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_MapElementPointerExited
   (
      This       : access IMapElementsLayer_Interface
      ; value : TypedEventHandler_IMapElementsLayer_add_MapElementPointerExited
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MapElementPointerExited
   (
      This       : access IMapElementsLayer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_MapContextRequested
   (
      This       : access IMapElementsLayer_Interface
      ; value : TypedEventHandler_IMapElementsLayer_add_MapContextRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MapContextRequested
   (
      This       : access IMapElementsLayer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapElementsLayerStatics : aliased constant Windows.IID := (872437543, 62729, 19752, (145, 128, 145, 28, 3, 65, 29, 116 ));
   
   type IMapElementsLayerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MapElementsProperty
   (
      This       : access IMapElementsLayerStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapIcon : aliased constant Windows.IID := (3523831922, 9177, 18987, (139, 224, 105, 243, 168, 84, 130, 171 ));
   
   type IMapIcon_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Location
   (
      This       : access IMapIcon_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function put_Location
   (
      This       : access IMapIcon_Interface
      ; value : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_Title
   (
      This       : access IMapIcon_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access IMapIcon_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NormalizedAnchorPoint
   (
      This       : access IMapIcon_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_NormalizedAnchorPoint
   (
      This       : access IMapIcon_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Image
   (
      This       : access IMapIcon_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function put_Image
   (
      This       : access IMapIcon_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapIconStatics : aliased constant Windows.IID := (3703348822, 4496, 19293, (158, 86, 229, 182, 114, 74, 163, 40 ));
   
   type IMapIconStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LocationProperty
   (
      This       : access IMapIconStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TitleProperty
   (
      This       : access IMapIconStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_NormalizedAnchorPointProperty
   (
      This       : access IMapIconStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapIcon2 : aliased constant Windows.IID := (1628591289, 55466, 19389, (163, 22, 186, 223, 6, 145, 29, 99 ));
   
   type IMapIcon2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CollisionBehaviorDesired
   (
      This       : access IMapIcon2_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.MapElementCollisionBehavior
   )
   return Windows.HRESULT is abstract;
   
   function put_CollisionBehaviorDesired
   (
      This       : access IMapIcon2_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.MapElementCollisionBehavior
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapIconStatics2 : aliased constant Windows.IID := (4283183210, 53110, 18091, (161, 47, 182, 3, 185, 134, 198, 150 ));
   
   type IMapIconStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CollisionBehaviorDesiredProperty
   (
      This       : access IMapIconStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapPolygon : aliased constant Windows.IID := (2883199621, 18726, 19514, (165, 249, 25, 223, 127, 105, 219, 61 ));
   
   type IMapPolygon_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Path
   (
      This       : access IMapPolygon_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopath
   )
   return Windows.HRESULT is abstract;
   
   function put_Path
   (
      This       : access IMapPolygon_Interface
      ; value : Windows.Devices.Geolocation.IGeopath
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeColor
   (
      This       : access IMapPolygon_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_StrokeColor
   (
      This       : access IMapPolygon_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeThickness
   (
      This       : access IMapPolygon_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_StrokeThickness
   (
      This       : access IMapPolygon_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeDashed
   (
      This       : access IMapPolygon_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_StrokeDashed
   (
      This       : access IMapPolygon_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_FillColor
   (
      This       : access IMapPolygon_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_FillColor
   (
      This       : access IMapPolygon_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapPolygonStatics : aliased constant Windows.IID := (938832830, 2427, 16972, (135, 204, 46, 224, 66, 253, 166, 210 ));
   
   type IMapPolygonStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PathProperty
   (
      This       : access IMapPolygonStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeThicknessProperty
   (
      This       : access IMapPolygonStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeDashedProperty
   (
      This       : access IMapPolygonStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapPolygon2 : aliased constant Windows.IID := (2529730846, 25451, 16408, (156, 46, 172, 201, 18, 42, 1, 178 ));
   
   type IMapPolygon2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Paths
   (
      This       : access IMapPolygon2_Interface
      ; RetVal : access Windows.Devices.Geolocation.IVector_IGeopath -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapPolyline : aliased constant Windows.IID := (4222428322, 9439, 19078, (143, 250, 15, 143, 77, 158, 193, 125 ));
   
   type IMapPolyline_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Path
   (
      This       : access IMapPolyline_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopath
   )
   return Windows.HRESULT is abstract;
   
   function put_Path
   (
      This       : access IMapPolyline_Interface
      ; value : Windows.Devices.Geolocation.IGeopath
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeColor
   (
      This       : access IMapPolyline_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_StrokeColor
   (
      This       : access IMapPolyline_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeThickness
   (
      This       : access IMapPolyline_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_StrokeThickness
   (
      This       : access IMapPolyline_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeDashed
   (
      This       : access IMapPolyline_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_StrokeDashed
   (
      This       : access IMapPolyline_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapPolylineStatics : aliased constant Windows.IID := (1644029003, 7647, 17155, (184, 9, 236, 135, 245, 138, 208, 101 ));
   
   type IMapPolylineStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PathProperty
   (
      This       : access IMapPolylineStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeDashedProperty
   (
      This       : access IMapPolylineStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStreetsideExperience : aliased constant Windows.IID := (2774052553, 58124, 18120, (129, 22, 72, 70, 145, 103, 85, 88 ));
   
   type IStreetsideExperience_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AddressTextVisible
   (
      This       : access IStreetsideExperience_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AddressTextVisible
   (
      This       : access IStreetsideExperience_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CursorVisible
   (
      This       : access IStreetsideExperience_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CursorVisible
   (
      This       : access IStreetsideExperience_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_OverviewMapVisible
   (
      This       : access IStreetsideExperience_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_OverviewMapVisible
   (
      This       : access IStreetsideExperience_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StreetLabelsVisible
   (
      This       : access IStreetsideExperience_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_StreetLabelsVisible
   (
      This       : access IStreetsideExperience_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ExitButtonVisible
   (
      This       : access IStreetsideExperience_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ExitButtonVisible
   (
      This       : access IStreetsideExperience_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ZoomButtonsVisible
   (
      This       : access IStreetsideExperience_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ZoomButtonsVisible
   (
      This       : access IStreetsideExperience_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStreetsideExperienceFactory : aliased constant Windows.IID := (2052837180, 25758, 17218, (153, 149, 104, 166, 207, 89, 97, 167 ));
   
   type IStreetsideExperienceFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithPanorama
   (
      This       : access IStreetsideExperienceFactory_Interface
      ; panorama : Windows.UI.Xaml.Controls.Maps.IStreetsidePanorama
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IStreetsideExperience
   )
   return Windows.HRESULT is abstract;
   
   function CreateInstanceWithPanoramaHeadingPitchAndFieldOfView
   (
      This       : access IStreetsideExperienceFactory_Interface
      ; panorama : Windows.UI.Xaml.Controls.Maps.IStreetsidePanorama
      ; headingInDegrees : Windows.Double
      ; pitchInDegrees : Windows.Double
      ; fieldOfViewInDegrees : Windows.Double
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IStreetsideExperience
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControl : aliased constant Windows.IID := (1120974929, 21078, 18247, (158, 108, 13, 17, 233, 102, 20, 30 ));
   
   type IMapControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Center
   (
      This       : access IMapControl_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function put_Center
   (
      This       : access IMapControl_Interface
      ; value : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_Children
   (
      This       : access IMapControl_Interface
      ; RetVal : access Windows.UI.Xaml.IVector_IDependencyObject -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ColorScheme
   (
      This       : access IMapControl_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.MapColorScheme
   )
   return Windows.HRESULT is abstract;
   
   function put_ColorScheme
   (
      This       : access IMapControl_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.MapColorScheme
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredPitch
   (
      This       : access IMapControl_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredPitch
   (
      This       : access IMapControl_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Heading
   (
      This       : access IMapControl_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Heading
   (
      This       : access IMapControl_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_LandmarksVisible
   (
      This       : access IMapControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_LandmarksVisible
   (
      This       : access IMapControl_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_LoadingStatus
   (
      This       : access IMapControl_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.MapLoadingStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_MapServiceToken
   (
      This       : access IMapControl_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_MapServiceToken
   (
      This       : access IMapControl_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxZoomLevel
   (
      This       : access IMapControl_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_MinZoomLevel
   (
      This       : access IMapControl_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_PedestrianFeaturesVisible
   (
      This       : access IMapControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_PedestrianFeaturesVisible
   (
      This       : access IMapControl_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Pitch
   (
      This       : access IMapControl_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Style
   (
      This       : access IMapControl_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.MapStyle
   )
   return Windows.HRESULT is abstract;
   
   function put_Style
   (
      This       : access IMapControl_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.MapStyle
   )
   return Windows.HRESULT is abstract;
   
   function get_TrafficFlowVisible
   (
      This       : access IMapControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_TrafficFlowVisible
   (
      This       : access IMapControl_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_TransformOrigin
   (
      This       : access IMapControl_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_TransformOrigin
   (
      This       : access IMapControl_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_WatermarkMode
   (
      This       : access IMapControl_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.MapWatermarkMode
   )
   return Windows.HRESULT is abstract;
   
   function put_WatermarkMode
   (
      This       : access IMapControl_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.MapWatermarkMode
   )
   return Windows.HRESULT is abstract;
   
   function get_ZoomLevel
   (
      This       : access IMapControl_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_ZoomLevel
   (
      This       : access IMapControl_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_MapElements
   (
      This       : access IMapControl_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IVector_IMapElement -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Routes
   (
      This       : access IMapControl_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IVector_IMapRouteView -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_TileSources
   (
      This       : access IMapControl_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IVector_IMapTileSource -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_CenterChanged
   (
      This       : access IMapControl_Interface
      ; value : TypedEventHandler_IMapControl_add_CenterChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CenterChanged
   (
      This       : access IMapControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_HeadingChanged
   (
      This       : access IMapControl_Interface
      ; value : TypedEventHandler_IMapControl_add_HeadingChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_HeadingChanged
   (
      This       : access IMapControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_LoadingStatusChanged
   (
      This       : access IMapControl_Interface
      ; value : TypedEventHandler_IMapControl_add_LoadingStatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LoadingStatusChanged
   (
      This       : access IMapControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_MapDoubleTapped
   (
      This       : access IMapControl_Interface
      ; value : TypedEventHandler_IMapControl_add_MapDoubleTapped
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MapDoubleTapped
   (
      This       : access IMapControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_MapHolding
   (
      This       : access IMapControl_Interface
      ; value : TypedEventHandler_IMapControl_add_MapHolding
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MapHolding
   (
      This       : access IMapControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_MapTapped
   (
      This       : access IMapControl_Interface
      ; value : TypedEventHandler_IMapControl_add_MapTapped
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MapTapped
   (
      This       : access IMapControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PitchChanged
   (
      This       : access IMapControl_Interface
      ; value : TypedEventHandler_IMapControl_add_PitchChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PitchChanged
   (
      This       : access IMapControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_TransformOriginChanged
   (
      This       : access IMapControl_Interface
      ; value : TypedEventHandler_IMapControl_add_TransformOriginChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_TransformOriginChanged
   (
      This       : access IMapControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ZoomLevelChanged
   (
      This       : access IMapControl_Interface
      ; value : TypedEventHandler_IMapControl_add_ZoomLevelChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ZoomLevelChanged
   (
      This       : access IMapControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function FindMapElementsAtOffset
   (
      This       : access IMapControl_Interface
      ; offset : Windows.Foundation.Point
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IVectorView_IMapElement -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetLocationFromOffset
   (
      This       : access IMapControl_Interface
      ; offset : Windows.Foundation.Point
      ; location : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function GetOffsetFromLocation
   (
      This       : access IMapControl_Interface
      ; location : Windows.Devices.Geolocation.IGeopoint
      ; offset : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function IsLocationInView
   (
      This       : access IMapControl_Interface
      ; location : Windows.Devices.Geolocation.IGeopoint
      ; isInView : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TrySetViewBoundsAsync
   (
      This       : access IMapControl_Interface
      ; bounds : Windows.Devices.Geolocation.IGeoboundingBox
      ; margin : Windows.UI.Xaml.IReference_Thickness
      ; animation : Windows.UI.Xaml.Controls.Maps.MapAnimationKind
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TrySetViewWithCenterAsync
   (
      This       : access IMapControl_Interface
      ; center : Windows.Devices.Geolocation.IGeopoint
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TrySetViewWithCenterAndZoomAsync
   (
      This       : access IMapControl_Interface
      ; center : Windows.Devices.Geolocation.IGeopoint
      ; zoomLevel : Windows.Foundation.IReference_Double
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TrySetViewWithCenterZoomHeadingAndPitchAsync
   (
      This       : access IMapControl_Interface
      ; center : Windows.Devices.Geolocation.IGeopoint
      ; zoomLevel : Windows.Foundation.IReference_Double
      ; heading : Windows.Foundation.IReference_Double
      ; desiredPitch : Windows.Foundation.IReference_Double
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TrySetViewWithCenterZoomHeadingPitchAndAnimationAsync
   (
      This       : access IMapControl_Interface
      ; center : Windows.Devices.Geolocation.IGeopoint
      ; zoomLevel : Windows.Foundation.IReference_Double
      ; heading : Windows.Foundation.IReference_Double
      ; desiredPitch : Windows.Foundation.IReference_Double
      ; animation : Windows.UI.Xaml.Controls.Maps.MapAnimationKind
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControlStatics : aliased constant Windows.IID := (3267762069, 8519, 20234, (148, 42, 84, 147, 168, 93, 232, 7 ));
   
   type IMapControlStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CenterProperty
   (
      This       : access IMapControlStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ChildrenProperty
   (
      This       : access IMapControlStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ColorSchemeProperty
   (
      This       : access IMapControlStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredPitchProperty
   (
      This       : access IMapControlStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_HeadingProperty
   (
      This       : access IMapControlStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_LandmarksVisibleProperty
   (
      This       : access IMapControlStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_LoadingStatusProperty
   (
      This       : access IMapControlStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_MapServiceTokenProperty
   (
      This       : access IMapControlStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_PedestrianFeaturesVisibleProperty
   (
      This       : access IMapControlStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_PitchProperty
   (
      This       : access IMapControlStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_StyleProperty
   (
      This       : access IMapControlStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TrafficFlowVisibleProperty
   (
      This       : access IMapControlStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TransformOriginProperty
   (
      This       : access IMapControlStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_WatermarkModeProperty
   (
      This       : access IMapControlStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ZoomLevelProperty
   (
      This       : access IMapControlStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_MapElementsProperty
   (
      This       : access IMapControlStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RoutesProperty
   (
      This       : access IMapControlStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TileSourcesProperty
   (
      This       : access IMapControlStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_LocationProperty
   (
      This       : access IMapControlStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetLocation
   (
      This       : access IMapControlStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function SetLocation
   (
      This       : access IMapControlStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_NormalizedAnchorPointProperty
   (
      This       : access IMapControlStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetNormalizedAnchorPoint
   (
      This       : access IMapControlStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function SetNormalizedAnchorPoint
   (
      This       : access IMapControlStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControl2 : aliased constant Windows.IID := (3791479885, 38636, 16485, (176, 240, 117, 40, 29, 163, 101, 77 ));
   
   type IMapControl2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BusinessLandmarksVisible
   (
      This       : access IMapControl2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_BusinessLandmarksVisible
   (
      This       : access IMapControl2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_TransitFeaturesVisible
   (
      This       : access IMapControl2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_TransitFeaturesVisible
   (
      This       : access IMapControl2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PanInteractionMode
   (
      This       : access IMapControl2_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.MapPanInteractionMode
   )
   return Windows.HRESULT is abstract;
   
   function put_PanInteractionMode
   (
      This       : access IMapControl2_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.MapPanInteractionMode
   )
   return Windows.HRESULT is abstract;
   
   function get_RotateInteractionMode
   (
      This       : access IMapControl2_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.MapInteractionMode
   )
   return Windows.HRESULT is abstract;
   
   function put_RotateInteractionMode
   (
      This       : access IMapControl2_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.MapInteractionMode
   )
   return Windows.HRESULT is abstract;
   
   function get_TiltInteractionMode
   (
      This       : access IMapControl2_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.MapInteractionMode
   )
   return Windows.HRESULT is abstract;
   
   function put_TiltInteractionMode
   (
      This       : access IMapControl2_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.MapInteractionMode
   )
   return Windows.HRESULT is abstract;
   
   function get_ZoomInteractionMode
   (
      This       : access IMapControl2_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.MapInteractionMode
   )
   return Windows.HRESULT is abstract;
   
   function put_ZoomInteractionMode
   (
      This       : access IMapControl2_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.MapInteractionMode
   )
   return Windows.HRESULT is abstract;
   
   function get_Is3DSupported
   (
      This       : access IMapControl2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsStreetsideSupported
   (
      This       : access IMapControl2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Scene
   (
      This       : access IMapControl2_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapScene
   )
   return Windows.HRESULT is abstract;
   
   function put_Scene
   (
      This       : access IMapControl2_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.IMapScene
   )
   return Windows.HRESULT is abstract;
   
   function get_ActualCamera
   (
      This       : access IMapControl2_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapCamera
   )
   return Windows.HRESULT is abstract;
   
   function get_TargetCamera
   (
      This       : access IMapControl2_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapCamera
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomExperience
   (
      This       : access IMapControl2_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapCustomExperience
   )
   return Windows.HRESULT is abstract;
   
   function put_CustomExperience
   (
      This       : access IMapControl2_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.IMapCustomExperience
   )
   return Windows.HRESULT is abstract;
   
   function add_MapElementClick
   (
      This       : access IMapControl2_Interface
      ; value : TypedEventHandler_IMapControl2_add_MapElementClick
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MapElementClick
   (
      This       : access IMapControl2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_MapElementPointerEntered
   (
      This       : access IMapControl2_Interface
      ; value : TypedEventHandler_IMapControl2_add_MapElementPointerEntered
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MapElementPointerEntered
   (
      This       : access IMapControl2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_MapElementPointerExited
   (
      This       : access IMapControl2_Interface
      ; value : TypedEventHandler_IMapControl2_add_MapElementPointerExited
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MapElementPointerExited
   (
      This       : access IMapControl2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ActualCameraChanged
   (
      This       : access IMapControl2_Interface
      ; value : TypedEventHandler_IMapControl2_add_ActualCameraChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ActualCameraChanged
   (
      This       : access IMapControl2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ActualCameraChanging
   (
      This       : access IMapControl2_Interface
      ; value : TypedEventHandler_IMapControl2_add_ActualCameraChanging
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ActualCameraChanging
   (
      This       : access IMapControl2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_TargetCameraChanged
   (
      This       : access IMapControl2_Interface
      ; value : TypedEventHandler_IMapControl2_add_TargetCameraChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_TargetCameraChanged
   (
      This       : access IMapControl2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CustomExperienceChanged
   (
      This       : access IMapControl2_Interface
      ; value : TypedEventHandler_IMapControl2_add_CustomExperienceChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CustomExperienceChanged
   (
      This       : access IMapControl2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function StartContinuousRotate
   (
      This       : access IMapControl2_Interface
      ; rateInDegreesPerSecond : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function StopContinuousRotate
   (
      This       : access IMapControl2_Interface
   )
   return Windows.HRESULT is abstract;
   
   function StartContinuousTilt
   (
      This       : access IMapControl2_Interface
      ; rateInDegreesPerSecond : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function StopContinuousTilt
   (
      This       : access IMapControl2_Interface
   )
   return Windows.HRESULT is abstract;
   
   function StartContinuousZoom
   (
      This       : access IMapControl2_Interface
      ; rateOfChangePerSecond : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function StopContinuousZoom
   (
      This       : access IMapControl2_Interface
   )
   return Windows.HRESULT is abstract;
   
   function TryRotateAsync
   (
      This       : access IMapControl2_Interface
      ; degrees : Windows.Double
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryRotateToAsync
   (
      This       : access IMapControl2_Interface
      ; angleInDegrees : Windows.Double
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryTiltAsync
   (
      This       : access IMapControl2_Interface
      ; degrees : Windows.Double
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryTiltToAsync
   (
      This       : access IMapControl2_Interface
      ; angleInDegrees : Windows.Double
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryZoomInAsync
   (
      This       : access IMapControl2_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryZoomOutAsync
   (
      This       : access IMapControl2_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryZoomToAsync
   (
      This       : access IMapControl2_Interface
      ; zoomLevel : Windows.Double
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TrySetSceneAsync
   (
      This       : access IMapControl2_Interface
      ; scene : Windows.UI.Xaml.Controls.Maps.IMapScene
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TrySetSceneWithAnimationAsync
   (
      This       : access IMapControl2_Interface
      ; scene : Windows.UI.Xaml.Controls.Maps.IMapScene
      ; animationKind : Windows.UI.Xaml.Controls.Maps.MapAnimationKind
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControlStatics2 : aliased constant Windows.IID := (75836307, 46150, 19761, (151, 82, 30, 198, 154, 89, 150, 174 ));
   
   type IMapControlStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BusinessLandmarksVisibleProperty
   (
      This       : access IMapControlStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TransitFeaturesVisibleProperty
   (
      This       : access IMapControlStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_PanInteractionModeProperty
   (
      This       : access IMapControlStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RotateInteractionModeProperty
   (
      This       : access IMapControlStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TiltInteractionModeProperty
   (
      This       : access IMapControlStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ZoomInteractionModeProperty
   (
      This       : access IMapControlStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_Is3DSupportedProperty
   (
      This       : access IMapControlStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsStreetsideSupportedProperty
   (
      This       : access IMapControlStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SceneProperty
   (
      This       : access IMapControlStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControl3 : aliased constant Windows.IID := (1482893560, 36061, 16558, (147, 56, 175, 42, 123, 232, 69, 229 ));
   
   type IMapControl3_Interface is interface and Windows.IInspectable_Interface;
   
   function add_MapRightTapped
   (
      This       : access IMapControl3_Interface
      ; value : TypedEventHandler_IMapControl3_add_MapRightTapped
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MapRightTapped
   (
      This       : access IMapControl3_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControl4 : aliased constant Windows.IID := (110039850, 6167, 18029, (183, 206, 65, 155, 63, 142, 36, 139 ));
   
   type IMapControl4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BusinessLandmarksEnabled
   (
      This       : access IMapControl4_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_BusinessLandmarksEnabled
   (
      This       : access IMapControl4_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_TransitFeaturesEnabled
   (
      This       : access IMapControl4_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_TransitFeaturesEnabled
   (
      This       : access IMapControl4_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetVisibleRegion
   (
      This       : access IMapControl4_Interface
      ; region : Windows.UI.Xaml.Controls.Maps.MapVisibleRegionKind
      ; RetVal : access Windows.Devices.Geolocation.IGeopath
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControlStatics4 : aliased constant Windows.IID := (4269301143, 23827, 20385, (191, 29, 132, 6, 23, 104, 193, 131 ));
   
   type IMapControlStatics4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BusinessLandmarksEnabledProperty
   (
      This       : access IMapControlStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TransitFeaturesEnabledProperty
   (
      This       : access IMapControlStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControl5 : aliased constant Windows.IID := (3717926909, 30755, 18082, (130, 201, 101, 221, 172, 79, 54, 95 ));
   
   type IMapControl5_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MapProjection
   (
      This       : access IMapControl5_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.MapProjection
   )
   return Windows.HRESULT is abstract;
   
   function put_MapProjection
   (
      This       : access IMapControl5_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.MapProjection
   )
   return Windows.HRESULT is abstract;
   
   function get_StyleSheet
   (
      This       : access IMapControl5_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapStyleSheet
   )
   return Windows.HRESULT is abstract;
   
   function put_StyleSheet
   (
      This       : access IMapControl5_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.IMapStyleSheet
   )
   return Windows.HRESULT is abstract;
   
   function get_ViewPadding
   (
      This       : access IMapControl5_Interface
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function put_ViewPadding
   (
      This       : access IMapControl5_Interface
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function add_MapContextRequested
   (
      This       : access IMapControl5_Interface
      ; value : TypedEventHandler_IMapControl5_add_MapContextRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MapContextRequested
   (
      This       : access IMapControl5_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function FindMapElementsAtOffsetWithRadius
   (
      This       : access IMapControl5_Interface
      ; offset : Windows.Foundation.Point
      ; radius : Windows.Double
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IVectorView_IMapElement -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetLocationFromOffsetWithReferenceSystem
   (
      This       : access IMapControl5_Interface
      ; offset : Windows.Foundation.Point
      ; desiredReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
      ; location : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function StartContinuousPan
   (
      This       : access IMapControl5_Interface
      ; horizontalPixelsPerSecond : Windows.Double
      ; verticalPixelsPerSecond : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function StopContinuousPan
   (
      This       : access IMapControl5_Interface
   )
   return Windows.HRESULT is abstract;
   
   function TryPanAsync
   (
      This       : access IMapControl5_Interface
      ; horizontalPixels : Windows.Double
      ; verticalPixels : Windows.Double
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryPanToAsync
   (
      This       : access IMapControl5_Interface
      ; location : Windows.Devices.Geolocation.IGeopoint
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControlStatics5 : aliased constant Windows.IID := (157445888, 47069, 16777, (167, 247, 131, 12, 65, 45, 238, 163 ));
   
   type IMapControlStatics5_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MapProjectionProperty
   (
      This       : access IMapControlStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_StyleSheetProperty
   (
      This       : access IMapControlStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ViewPaddingProperty
   (
      This       : access IMapControlStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControl6 : aliased constant Windows.IID := (2967112098, 4161, 19434, (184, 138, 18, 172, 154, 130, 224, 226 ));
   
   type IMapControl6_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Layers
   (
      This       : access IMapControl6_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IVector_IMapLayer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Layers
   (
      This       : access IMapControl6_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.IVector_IMapLayer
   )
   return Windows.HRESULT is abstract;
   
   function TryGetLocationFromOffset
   (
      This       : access IMapControl6_Interface
      ; offset : Windows.Foundation.Point
      ; location : access Windows.Devices.Geolocation.IGeopoint
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryGetLocationFromOffsetWithReferenceSystem
   (
      This       : access IMapControl6_Interface
      ; offset : Windows.Foundation.Point
      ; desiredReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
      ; location : access Windows.Devices.Geolocation.IGeopoint
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControlStatics6 : aliased constant Windows.IID := (1020255615, 9425, 16546, (131, 81, 179, 6, 58, 140, 149, 164 ));
   
   type IMapControlStatics6_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LayersProperty
   (
      This       : access IMapControlStatics6_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControl7 : aliased constant Windows.IID := (226944083, 3103, 20350, (174, 102, 74, 208, 180, 152, 120, 87 ));
   
   type IMapControl7_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Region
   (
      This       : access IMapControl7_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Region
   (
      This       : access IMapControl7_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControlStatics7 : aliased constant Windows.IID := (1441901645, 29378, 18098, (183, 174, 121, 2, 96, 190, 100, 27 ));
   
   type IMapControlStatics7_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RegionProperty
   (
      This       : access IMapControlStatics7_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControlDataHelper : aliased constant Windows.IID := (2343628956, 5291, 18540, (157, 229, 90, 93, 239, 2, 5, 162 ));
   
   type IMapControlDataHelper_Interface is interface and Windows.IInspectable_Interface;
   
   function add_BusinessLandmarkClick
   (
      This       : access IMapControlDataHelper_Interface
      ; value : TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkClick
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BusinessLandmarkClick
   (
      This       : access IMapControlDataHelper_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_TransitFeatureClick
   (
      This       : access IMapControlDataHelper_Interface
      ; value : TypedEventHandler_IMapControlDataHelper_add_TransitFeatureClick
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_TransitFeatureClick
   (
      This       : access IMapControlDataHelper_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_BusinessLandmarkRightTapped
   (
      This       : access IMapControlDataHelper_Interface
      ; value : TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkRightTapped
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BusinessLandmarkRightTapped
   (
      This       : access IMapControlDataHelper_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_TransitFeatureRightTapped
   (
      This       : access IMapControlDataHelper_Interface
      ; value : TypedEventHandler_IMapControlDataHelper_add_TransitFeatureRightTapped
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_TransitFeatureRightTapped
   (
      This       : access IMapControlDataHelper_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControlDataHelper2 : aliased constant Windows.IID := (1506689694, 22063, 19489, (166, 116, 15, 17, 222, 207, 15, 179 ));
   
   type IMapControlDataHelper2_Interface is interface and Windows.IInspectable_Interface;
   
   function add_BusinessLandmarkPointerEntered
   (
      This       : access IMapControlDataHelper2_Interface
      ; value : TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerEntered
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BusinessLandmarkPointerEntered
   (
      This       : access IMapControlDataHelper2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_TransitFeaturePointerEntered
   (
      This       : access IMapControlDataHelper2_Interface
      ; value : TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerEntered
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_TransitFeaturePointerEntered
   (
      This       : access IMapControlDataHelper2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_BusinessLandmarkPointerExited
   (
      This       : access IMapControlDataHelper2_Interface
      ; value : TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerExited
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BusinessLandmarkPointerExited
   (
      This       : access IMapControlDataHelper2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_TransitFeaturePointerExited
   (
      This       : access IMapControlDataHelper2_Interface
      ; value : TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerExited
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_TransitFeaturePointerExited
   (
      This       : access IMapControlDataHelper2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControlDataHelperStatics : aliased constant Windows.IID := (2053518038, 59716, 16656, (131, 207, 49, 77, 7, 34, 226, 229 ));
   
   type IMapControlDataHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateMapControl
   (
      This       : access IMapControlDataHelperStatics_Interface
      ; rasterRenderMode : Windows.Boolean
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapControl
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControlDataHelperFactory : aliased constant Windows.IID := (997239438, 751, 18076, (187, 175, 220, 33, 88, 212, 40, 155 ));
   
   type IMapControlDataHelperFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IMapControlDataHelperFactory_Interface
      ; map : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapControlDataHelper
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControlBusinessLandmarkClickEventArgs : aliased constant Windows.IID := (1581664546, 18970, 18327, (190, 183, 92, 247, 117, 76, 184, 103 ));
   
   type IMapControlBusinessLandmarkClickEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LocalLocations
   (
      This       : access IMapControlBusinessLandmarkClickEventArgs_Interface
      ; RetVal : access Windows.Services.Maps.LocalSearch.IVectorView_ILocalLocation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControlTransitFeatureClickEventArgs : aliased constant Windows.IID := (1981258089, 46949, 17954, (176, 138, 48, 114, 116, 90, 69, 65 ));
   
   type IMapControlTransitFeatureClickEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayName
   (
      This       : access IMapControlTransitFeatureClickEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Location
   (
      This       : access IMapControlTransitFeatureClickEventArgs_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_TransitProperties
   (
      This       : access IMapControlTransitFeatureClickEventArgs_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControlBusinessLandmarkRightTappedEventArgs : aliased constant Windows.IID := (1504414439, 61828, 19121, (176, 176, 53, 200, 191, 6, 84, 178 ));
   
   type IMapControlBusinessLandmarkRightTappedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LocalLocations
   (
      This       : access IMapControlBusinessLandmarkRightTappedEventArgs_Interface
      ; RetVal : access Windows.Services.Maps.LocalSearch.IVectorView_ILocalLocation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControlTransitFeatureRightTappedEventArgs : aliased constant Windows.IID := (2929839177, 42793, 20142, (165, 154, 62, 201, 161, 37, 160, 40 ));
   
   type IMapControlTransitFeatureRightTappedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayName
   (
      This       : access IMapControlTransitFeatureRightTappedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Location
   (
      This       : access IMapControlTransitFeatureRightTappedEventArgs_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_TransitProperties
   (
      This       : access IMapControlTransitFeatureRightTappedEventArgs_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControlBusinessLandmarkPointerEnteredEventArgs : aliased constant Windows.IID := (1581285798, 60056, 20373, (140, 175, 91, 66, 105, 111, 245, 4 ));
   
   type IMapControlBusinessLandmarkPointerEnteredEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LocalLocations
   (
      This       : access IMapControlBusinessLandmarkPointerEnteredEventArgs_Interface
      ; RetVal : access Windows.Services.Maps.LocalSearch.IVectorView_ILocalLocation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControlTransitFeaturePointerEnteredEventArgs : aliased constant Windows.IID := (1938889294, 60495, 18334, (148, 161, 54, 224, 129, 208, 216, 151 ));
   
   type IMapControlTransitFeaturePointerEnteredEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayName
   (
      This       : access IMapControlTransitFeaturePointerEnteredEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Location
   (
      This       : access IMapControlTransitFeaturePointerEnteredEventArgs_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_TransitProperties
   (
      This       : access IMapControlTransitFeaturePointerEnteredEventArgs_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControlBusinessLandmarkPointerExitedEventArgs : aliased constant Windows.IID := (733293743, 62026, 18128, (180, 99, 101, 247, 25, 115, 16, 87 ));
   
   type IMapControlBusinessLandmarkPointerExitedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LocalLocations
   (
      This       : access IMapControlBusinessLandmarkPointerExitedEventArgs_Interface
      ; RetVal : access Windows.Services.Maps.LocalSearch.IVectorView_ILocalLocation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapControlTransitFeaturePointerExitedEventArgs : aliased constant Windows.IID := (1779508621, 17549, 17639, (188, 105, 209, 61, 73, 113, 84, 233 ));
   
   type IMapControlTransitFeaturePointerExitedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayName
   (
      This       : access IMapControlTransitFeaturePointerExitedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Location
   (
      This       : access IMapControlTransitFeaturePointerExitedEventArgs_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_TransitProperties
   (
      This       : access IMapControlTransitFeaturePointerExitedEventArgs_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMapElement : aliased constant Windows.IID := (4179014696, 15220, 23252, (157, 151, 27, 10, 56, 122, 236, 181 ));
   
   type IIterator_IMapElement_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMapElement_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapElement
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMapElement_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMapElement_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMapElement_Interface
      ; items : Windows.UI.Xaml.Controls.Maps.IMapElement_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMapElement : aliased constant Windows.IID := (2178047013, 42163, 23821, (146, 171, 38, 54, 12, 42, 127, 172 ));
   
   type IIterable_IMapElement_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMapElement_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IIterator_IMapElement
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMapElement : aliased constant Windows.IID := (3468763352, 60019, 23203, (145, 74, 55, 221, 37, 84, 246, 134 ));
   
   type IVectorView_IMapElement_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMapElement_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapElement
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMapElement_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMapElement_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.IMapElement
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMapElement_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Controls.Maps.IMapElement_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IMapElement : aliased constant Windows.IID := (41369389, 47895, 22269, (150, 204, 137, 241, 196, 127, 158, 17 ));
   
   type IVector_IMapElement_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IMapElement_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapElement
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IMapElement_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IMapElement_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IVectorView_IMapElement
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IMapElement_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.IMapElement
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IMapElement_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Controls.Maps.IMapElement
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IMapElement_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Controls.Maps.IMapElement
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IMapElement_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IMapElement_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.IMapElement
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IMapElement_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IMapElement_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IMapElement_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Controls.Maps.IMapElement_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IMapElement_Interface
      ; items : Windows.UI.Xaml.Controls.Maps.IMapElement_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IMapModel3D : aliased constant Windows.IID := (217064463, 32632, 21339, (133, 12, 254, 98, 49, 117, 144, 100 ));
   
   type IAsyncOperation_IMapModel3D_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMapModel3D_Interface
      ; handler : Windows.UI.Xaml.Controls.Maps.AsyncOperationCompletedHandler_IMapModel3D
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMapModel3D_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.AsyncOperationCompletedHandler_IMapModel3D
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMapModel3D_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapModel3D
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMapStyleSheet : aliased constant Windows.IID := (3871811557, 27160, 21299, (170, 106, 38, 110, 140, 139, 221, 81 ));
   
   type IIterator_IMapStyleSheet_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMapStyleSheet_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapStyleSheet
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMapStyleSheet_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMapStyleSheet_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMapStyleSheet_Interface
      ; items : Windows.UI.Xaml.Controls.Maps.IMapStyleSheet_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMapStyleSheet : aliased constant Windows.IID := (88620424, 33820, 23054, (185, 199, 93, 130, 141, 159, 42, 255 ));
   
   type IIterable_IMapStyleSheet_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMapStyleSheet_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IIterator_IMapStyleSheet
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IStreetsidePanorama : aliased constant Windows.IID := (1792600647, 26224, 20952, (161, 219, 51, 254, 117, 73, 31, 12 ));
   
   type IAsyncOperation_IStreetsidePanorama_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IStreetsidePanorama_Interface
      ; handler : Windows.UI.Xaml.Controls.Maps.AsyncOperationCompletedHandler_IStreetsidePanorama
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IStreetsidePanorama_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.AsyncOperationCompletedHandler_IStreetsidePanorama
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IStreetsidePanorama_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IStreetsidePanorama
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMapRouteView : aliased constant Windows.IID := (2938462357, 16708, 21927, (145, 57, 137, 132, 59, 87, 45, 183 ));
   
   type IIterator_IMapRouteView_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMapRouteView_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapRouteView
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMapRouteView_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMapRouteView_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMapRouteView_Interface
      ; items : Windows.UI.Xaml.Controls.Maps.IMapRouteView_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMapRouteView : aliased constant Windows.IID := (151704755, 36814, 20525, (134, 101, 24, 101, 12, 81, 190, 169 ));
   
   type IIterable_IMapRouteView_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMapRouteView_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IIterator_IMapRouteView
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMapRouteView : aliased constant Windows.IID := (3183166954, 3187, 22204, (163, 117, 63, 42, 123, 235, 111, 46 ));
   
   type IVectorView_IMapRouteView_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMapRouteView_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapRouteView
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMapRouteView_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMapRouteView_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.IMapRouteView
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMapRouteView_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Controls.Maps.IMapRouteView_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IMapRouteView : aliased constant Windows.IID := (2363823028, 2685, 21843, (183, 53, 121, 205, 90, 127, 238, 63 ));
   
   type IVector_IMapRouteView_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IMapRouteView_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapRouteView
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IMapRouteView_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IMapRouteView_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IVectorView_IMapRouteView
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IMapRouteView_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.IMapRouteView
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IMapRouteView_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Controls.Maps.IMapRouteView
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IMapRouteView_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Controls.Maps.IMapRouteView
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IMapRouteView_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IMapRouteView_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.IMapRouteView
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IMapRouteView_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IMapRouteView_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IMapRouteView_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Controls.Maps.IMapRouteView_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IMapRouteView_Interface
      ; items : Windows.UI.Xaml.Controls.Maps.IMapRouteView_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMapTileSource : aliased constant Windows.IID := (3855084454, 31861, 20668, (139, 54, 45, 140, 161, 250, 83, 139 ));
   
   type IIterator_IMapTileSource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMapTileSource_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapTileSource
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMapTileSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMapTileSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMapTileSource_Interface
      ; items : Windows.UI.Xaml.Controls.Maps.IMapTileSource_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMapTileSource : aliased constant Windows.IID := (1837790199, 43991, 22212, (153, 167, 6, 193, 250, 119, 220, 210 ));
   
   type IIterable_IMapTileSource_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMapTileSource_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IIterator_IMapTileSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMapTileSource : aliased constant Windows.IID := (3732578690, 36375, 21861, (154, 157, 148, 164, 255, 37, 54, 74 ));
   
   type IVectorView_IMapTileSource_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMapTileSource_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapTileSource
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMapTileSource_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMapTileSource_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.IMapTileSource
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMapTileSource_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Controls.Maps.IMapTileSource_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IMapTileSource : aliased constant Windows.IID := (435653190, 11365, 24468, (191, 91, 150, 51, 71, 160, 163, 24 ));
   
   type IVector_IMapTileSource_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IMapTileSource_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapTileSource
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IMapTileSource_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IMapTileSource_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IVectorView_IMapTileSource
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IMapTileSource_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.IMapTileSource
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IMapTileSource_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Controls.Maps.IMapTileSource
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IMapTileSource_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Controls.Maps.IMapTileSource
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IMapTileSource_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IMapTileSource_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.IMapTileSource
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IMapTileSource_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IMapTileSource_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IMapTileSource_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Controls.Maps.IMapTileSource_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IMapTileSource_Interface
      ; items : Windows.UI.Xaml.Controls.Maps.IMapTileSource_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMapLayer : aliased constant Windows.IID := (2938274815, 9486, 22225, (150, 212, 159, 120, 225, 100, 203, 198 ));
   
   type IIterator_IMapLayer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMapLayer_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapLayer
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMapLayer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMapLayer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMapLayer_Interface
      ; items : Windows.UI.Xaml.Controls.Maps.IMapLayer_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMapLayer : aliased constant Windows.IID := (1351494889, 6532, 24520, (164, 145, 98, 232, 136, 149, 57, 244 ));
   
   type IIterable_IMapLayer_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMapLayer_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IIterator_IMapLayer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMapLayer : aliased constant Windows.IID := (2519934649, 26480, 21233, (182, 198, 81, 148, 65, 248, 115, 195 ));
   
   type IVectorView_IMapLayer_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMapLayer_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapLayer
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMapLayer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMapLayer_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.IMapLayer
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMapLayer_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Controls.Maps.IMapLayer_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IMapLayer : aliased constant Windows.IID := (1652040960, 43468, 22513, (184, 27, 110, 188, 201, 33, 34, 69 ));
   
   type IVector_IMapLayer_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IMapLayer_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapLayer
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IMapLayer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IMapLayer_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IVectorView_IMapLayer
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IMapLayer_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.IMapLayer
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IMapLayer_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Controls.Maps.IMapLayer
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IMapLayer_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Controls.Maps.IMapLayer
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IMapLayer_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IMapLayer_Interface
      ; value : Windows.UI.Xaml.Controls.Maps.IMapLayer
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IMapLayer_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IMapLayer_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IMapLayer_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Controls.Maps.IMapLayer_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IMapLayer_Interface
      ; items : Windows.UI.Xaml.Controls.Maps.IMapLayer_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IMapModel3D : aliased constant Windows.IID := (1626282315, 56288, 22801, (183, 37, 236, 197, 222, 41, 135, 130 ));
   
   type AsyncOperationCompletedHandler_IMapModel3D_Interface(Callback : access procedure (asyncInfo : Windows.UI.Xaml.Controls.Maps.IAsyncOperation_IMapModel3D ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IMapModel3D'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMapModel3D_Interface
      ; asyncInfo : Windows.UI.Xaml.Controls.Maps.IAsyncOperation_IMapModel3D
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapScene_add_TargetCameraChanged : aliased constant Windows.IID := (1986974888, 59408, 24440, (188, 150, 154, 255, 159, 88, 207, 202 ));
   
   type TypedEventHandler_IMapScene_add_TargetCameraChanged_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapScene ; args : Windows.UI.Xaml.Controls.Maps.IMapTargetCameraChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapScene_add_TargetCameraChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapScene_add_TargetCameraChanged_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapScene
      ; args : Windows.UI.Xaml.Controls.Maps.IMapTargetCameraChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IStreetsidePanorama : aliased constant Windows.IID := (4143165820, 17703, 21800, (134, 170, 28, 241, 251, 120, 165, 235 ));
   
   type AsyncOperationCompletedHandler_IStreetsidePanorama_Interface(Callback : access procedure (asyncInfo : Windows.UI.Xaml.Controls.Maps.IAsyncOperation_IStreetsidePanorama ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IStreetsidePanorama'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IStreetsidePanorama_Interface
      ; asyncInfo : Windows.UI.Xaml.Controls.Maps.IAsyncOperation_IStreetsidePanorama
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICustomMapTileDataSource_add_BitmapRequested : aliased constant Windows.IID := (2368575061, 12162, 21105, (158, 149, 162, 219, 57, 216, 114, 240 ));
   
   type TypedEventHandler_ICustomMapTileDataSource_add_BitmapRequested_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.ICustomMapTileDataSource ; args : Windows.UI.Xaml.Controls.Maps.IMapTileBitmapRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICustomMapTileDataSource_add_BitmapRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICustomMapTileDataSource_add_BitmapRequested_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.ICustomMapTileDataSource
      ; args : Windows.UI.Xaml.Controls.Maps.IMapTileBitmapRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IHttpMapTileDataSource_add_UriRequested : aliased constant Windows.IID := (1228120474, 204, 23585, (163, 223, 182, 143, 153, 57, 246, 239 ));
   
   type TypedEventHandler_IHttpMapTileDataSource_add_UriRequested_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IHttpMapTileDataSource ; args : Windows.UI.Xaml.Controls.Maps.IMapTileUriRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IHttpMapTileDataSource_add_UriRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IHttpMapTileDataSource_add_UriRequested_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IHttpMapTileDataSource
      ; args : Windows.UI.Xaml.Controls.Maps.IMapTileUriRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ILocalMapTileDataSource_add_UriRequested : aliased constant Windows.IID := (1987391428, 45632, 20524, (144, 152, 98, 44, 108, 54, 230, 163 ));
   
   type TypedEventHandler_ILocalMapTileDataSource_add_UriRequested_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.ILocalMapTileDataSource ; args : Windows.UI.Xaml.Controls.Maps.IMapTileUriRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ILocalMapTileDataSource_add_UriRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ILocalMapTileDataSource_add_UriRequested_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.ILocalMapTileDataSource
      ; args : Windows.UI.Xaml.Controls.Maps.IMapTileUriRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapElementsLayer_add_MapElementClick : aliased constant Windows.IID := (3555606442, 27247, 22378, (153, 0, 82, 142, 142, 186, 146, 134 ));
   
   type TypedEventHandler_IMapElementsLayer_add_MapElementClick_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapElementsLayer ; args : Windows.UI.Xaml.Controls.Maps.IMapElementsLayerClickEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapElementsLayer_add_MapElementClick'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapElementsLayer_add_MapElementClick_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapElementsLayer
      ; args : Windows.UI.Xaml.Controls.Maps.IMapElementsLayerClickEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapElementsLayer_add_MapElementPointerEntered : aliased constant Windows.IID := (908250963, 4476, 22021, (177, 66, 254, 71, 216, 116, 226, 107 ));
   
   type TypedEventHandler_IMapElementsLayer_add_MapElementPointerEntered_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapElementsLayer ; args : Windows.UI.Xaml.Controls.Maps.IMapElementsLayerPointerEnteredEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapElementsLayer_add_MapElementPointerEntered'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapElementsLayer_add_MapElementPointerEntered_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapElementsLayer
      ; args : Windows.UI.Xaml.Controls.Maps.IMapElementsLayerPointerEnteredEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapElementsLayer_add_MapElementPointerExited : aliased constant Windows.IID := (3578032594, 989, 22168, (169, 47, 95, 172, 138, 94, 118, 104 ));
   
   type TypedEventHandler_IMapElementsLayer_add_MapElementPointerExited_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapElementsLayer ; args : Windows.UI.Xaml.Controls.Maps.IMapElementsLayerPointerExitedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapElementsLayer_add_MapElementPointerExited'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapElementsLayer_add_MapElementPointerExited_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapElementsLayer
      ; args : Windows.UI.Xaml.Controls.Maps.IMapElementsLayerPointerExitedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapElementsLayer_add_MapContextRequested : aliased constant Windows.IID := (3569872109, 20563, 23868, (140, 250, 251, 25, 219, 222, 74, 58 ));
   
   type TypedEventHandler_IMapElementsLayer_add_MapContextRequested_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapElementsLayer ; args : Windows.UI.Xaml.Controls.Maps.IMapElementsLayerContextRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapElementsLayer_add_MapContextRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapElementsLayer_add_MapContextRequested_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapElementsLayer
      ; args : Windows.UI.Xaml.Controls.Maps.IMapElementsLayerContextRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControl_add_CenterChanged : aliased constant Windows.IID := (4065385875, 58934, 20975, (188, 147, 238, 120, 212, 49, 166, 189 ));
   
   type TypedEventHandler_IMapControl_add_CenterChanged_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControl_add_CenterChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControl_add_CenterChanged_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControl_add_HeadingChanged : aliased constant Windows.IID := (4065385875, 58934, 20975, (188, 147, 238, 120, 212, 49, 166, 189 ));
   
   type TypedEventHandler_IMapControl_add_HeadingChanged_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControl_add_HeadingChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControl_add_HeadingChanged_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControl_add_LoadingStatusChanged : aliased constant Windows.IID := (4065385875, 58934, 20975, (188, 147, 238, 120, 212, 49, 166, 189 ));
   
   type TypedEventHandler_IMapControl_add_LoadingStatusChanged_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControl_add_LoadingStatusChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControl_add_LoadingStatusChanged_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControl_add_MapDoubleTapped : aliased constant Windows.IID := (3106891798, 19722, 21186, (152, 104, 148, 181, 201, 66, 0, 126 ));
   
   type TypedEventHandler_IMapControl_add_MapDoubleTapped_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.UI.Xaml.Controls.Maps.IMapInputEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControl_add_MapDoubleTapped'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControl_add_MapDoubleTapped_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapInputEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControl_add_MapHolding : aliased constant Windows.IID := (3106891798, 19722, 21186, (152, 104, 148, 181, 201, 66, 0, 126 ));
   
   type TypedEventHandler_IMapControl_add_MapHolding_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.UI.Xaml.Controls.Maps.IMapInputEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControl_add_MapHolding'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControl_add_MapHolding_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapInputEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControl_add_MapTapped : aliased constant Windows.IID := (3106891798, 19722, 21186, (152, 104, 148, 181, 201, 66, 0, 126 ));
   
   type TypedEventHandler_IMapControl_add_MapTapped_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.UI.Xaml.Controls.Maps.IMapInputEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControl_add_MapTapped'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControl_add_MapTapped_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapInputEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControl_add_PitchChanged : aliased constant Windows.IID := (4065385875, 58934, 20975, (188, 147, 238, 120, 212, 49, 166, 189 ));
   
   type TypedEventHandler_IMapControl_add_PitchChanged_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControl_add_PitchChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControl_add_PitchChanged_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControl_add_TransformOriginChanged : aliased constant Windows.IID := (4065385875, 58934, 20975, (188, 147, 238, 120, 212, 49, 166, 189 ));
   
   type TypedEventHandler_IMapControl_add_TransformOriginChanged_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControl_add_TransformOriginChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControl_add_TransformOriginChanged_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControl_add_ZoomLevelChanged : aliased constant Windows.IID := (4065385875, 58934, 20975, (188, 147, 238, 120, 212, 49, 166, 189 ));
   
   type TypedEventHandler_IMapControl_add_ZoomLevelChanged_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControl_add_ZoomLevelChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControl_add_ZoomLevelChanged_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControl2_add_MapElementClick : aliased constant Windows.IID := (1282941345, 54640, 22909, (172, 199, 6, 136, 83, 196, 171, 39 ));
   
   type TypedEventHandler_IMapControl2_add_MapElementClick_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.UI.Xaml.Controls.Maps.IMapElementClickEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControl2_add_MapElementClick'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControl2_add_MapElementClick_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapElementClickEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControl2_add_MapElementPointerEntered : aliased constant Windows.IID := (3391502565, 31795, 23440, (155, 102, 39, 55, 49, 252, 112, 145 ));
   
   type TypedEventHandler_IMapControl2_add_MapElementPointerEntered_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.UI.Xaml.Controls.Maps.IMapElementPointerEnteredEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControl2_add_MapElementPointerEntered'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControl2_add_MapElementPointerEntered_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapElementPointerEnteredEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControl2_add_MapElementPointerExited : aliased constant Windows.IID := (4138188753, 11385, 20881, (179, 130, 117, 177, 65, 209, 136, 70 ));
   
   type TypedEventHandler_IMapControl2_add_MapElementPointerExited_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.UI.Xaml.Controls.Maps.IMapElementPointerExitedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControl2_add_MapElementPointerExited'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControl2_add_MapElementPointerExited_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapElementPointerExitedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControl2_add_ActualCameraChanged : aliased constant Windows.IID := (458451680, 2224, 23636, (187, 48, 103, 158, 106, 135, 93, 97 ));
   
   type TypedEventHandler_IMapControl2_add_ActualCameraChanged_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.UI.Xaml.Controls.Maps.IMapActualCameraChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControl2_add_ActualCameraChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControl2_add_ActualCameraChanged_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapActualCameraChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControl2_add_ActualCameraChanging : aliased constant Windows.IID := (2025830171, 11648, 20705, (162, 233, 229, 102, 127, 248, 158, 242 ));
   
   type TypedEventHandler_IMapControl2_add_ActualCameraChanging_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.UI.Xaml.Controls.Maps.IMapActualCameraChangingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControl2_add_ActualCameraChanging'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControl2_add_ActualCameraChanging_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapActualCameraChangingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControl2_add_TargetCameraChanged : aliased constant Windows.IID := (644989661, 57874, 24131, (128, 226, 171, 111, 243, 243, 8, 108 ));
   
   type TypedEventHandler_IMapControl2_add_TargetCameraChanged_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.UI.Xaml.Controls.Maps.IMapTargetCameraChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControl2_add_TargetCameraChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControl2_add_TargetCameraChanged_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapTargetCameraChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControl2_add_CustomExperienceChanged : aliased constant Windows.IID := (657257071, 6362, 22942, (137, 111, 59, 251, 246, 251, 19, 38 ));
   
   type TypedEventHandler_IMapControl2_add_CustomExperienceChanged_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.UI.Xaml.Controls.Maps.IMapCustomExperienceChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControl2_add_CustomExperienceChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControl2_add_CustomExperienceChanged_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapCustomExperienceChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControl3_add_MapRightTapped : aliased constant Windows.IID := (4022677293, 44395, 22959, (160, 240, 34, 83, 212, 52, 65, 79 ));
   
   type TypedEventHandler_IMapControl3_add_MapRightTapped_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.UI.Xaml.Controls.Maps.IMapRightTappedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControl3_add_MapRightTapped'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControl3_add_MapRightTapped_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapRightTappedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControl5_add_MapContextRequested : aliased constant Windows.IID := (3844314689, 47647, 23945, (170, 225, 199, 180, 153, 164, 123, 12 ));
   
   type TypedEventHandler_IMapControl5_add_MapContextRequested_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.UI.Xaml.Controls.Maps.IMapContextRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControl5_add_MapContextRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControl5_add_MapContextRequested_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapContextRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkClick : aliased constant Windows.IID := (983397826, 42011, 22280, (140, 27, 142, 124, 38, 232, 87, 208 ));
   
   type TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkClick_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkClickEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkClick'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkClick_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkClickEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControlDataHelper_add_TransitFeatureClick : aliased constant Windows.IID := (1053252336, 5753, 21503, (187, 12, 55, 107, 140, 68, 25, 128 ));
   
   type TypedEventHandler_IMapControlDataHelper_add_TransitFeatureClick_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeatureClickEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControlDataHelper_add_TransitFeatureClick'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControlDataHelper_add_TransitFeatureClick_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeatureClickEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkRightTapped : aliased constant Windows.IID := (3814935124, 1517, 24121, (157, 138, 3, 133, 127, 11, 160, 231 ));
   
   type TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkRightTapped_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkRightTappedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkRightTapped'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkRightTapped_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkRightTappedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControlDataHelper_add_TransitFeatureRightTapped : aliased constant Windows.IID := (2710259671, 25382, 24513, (138, 64, 136, 175, 145, 187, 5, 137 ));
   
   type TypedEventHandler_IMapControlDataHelper_add_TransitFeatureRightTapped_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeatureRightTappedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControlDataHelper_add_TransitFeatureRightTapped'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControlDataHelper_add_TransitFeatureRightTapped_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeatureRightTappedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerEntered : aliased constant Windows.IID := (4252871658, 20, 23088, (154, 89, 189, 65, 38, 162, 255, 183 ));
   
   type TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerEntered_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkPointerEnteredEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerEntered'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerEntered_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkPointerEnteredEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerEntered : aliased constant Windows.IID := (376350219, 43888, 22540, (187, 112, 47, 121, 238, 33, 76, 234 ));
   
   type TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerEntered_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeaturePointerEnteredEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerEntered'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerEntered_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeaturePointerEnteredEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerExited : aliased constant Windows.IID := (3294055297, 41362, 22544, (176, 217, 204, 153, 35, 15, 220, 220 ));
   
   type TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerExited_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkPointerExitedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerExited'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerExited_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkPointerExitedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerExited : aliased constant Windows.IID := (1968438520, 42178, 23745, (154, 60, 240, 179, 107, 117, 96, 104 ));
   
   type TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerExited_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Controls.Maps.IMapControl ; args : Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeaturePointerExitedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerExited'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerExited_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeaturePointerExitedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype MapActualCameraChangedEventArgs is Windows.UI.Xaml.Controls.Maps.IMapActualCameraChangedEventArgs;
   function CreateMapActualCameraChangedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapActualCameraChangedEventArgs;
   
   subtype MapActualCameraChangingEventArgs is Windows.UI.Xaml.Controls.Maps.IMapActualCameraChangingEventArgs;
   function CreateMapActualCameraChangingEventArgs return Windows.UI.Xaml.Controls.Maps.IMapActualCameraChangingEventArgs;
   
   subtype MapContextRequestedEventArgs is Windows.UI.Xaml.Controls.Maps.IMapContextRequestedEventArgs;
   function CreateMapContextRequestedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapContextRequestedEventArgs;
   
   subtype MapCustomExperienceChangedEventArgs is Windows.UI.Xaml.Controls.Maps.IMapCustomExperienceChangedEventArgs;
   function CreateMapCustomExperienceChangedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapCustomExperienceChangedEventArgs;
   
   subtype MapElementClickEventArgs is Windows.UI.Xaml.Controls.Maps.IMapElementClickEventArgs;
   function CreateMapElementClickEventArgs return Windows.UI.Xaml.Controls.Maps.IMapElementClickEventArgs;
   
   subtype MapElementPointerEnteredEventArgs is Windows.UI.Xaml.Controls.Maps.IMapElementPointerEnteredEventArgs;
   function CreateMapElementPointerEnteredEventArgs return Windows.UI.Xaml.Controls.Maps.IMapElementPointerEnteredEventArgs;
   
   subtype MapElementPointerExitedEventArgs is Windows.UI.Xaml.Controls.Maps.IMapElementPointerExitedEventArgs;
   function CreateMapElementPointerExitedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapElementPointerExitedEventArgs;
   
   subtype MapElementsLayerClickEventArgs is Windows.UI.Xaml.Controls.Maps.IMapElementsLayerClickEventArgs;
   function CreateMapElementsLayerClickEventArgs return Windows.UI.Xaml.Controls.Maps.IMapElementsLayerClickEventArgs;
   
   subtype MapElementsLayerContextRequestedEventArgs is Windows.UI.Xaml.Controls.Maps.IMapElementsLayerContextRequestedEventArgs;
   function CreateMapElementsLayerContextRequestedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapElementsLayerContextRequestedEventArgs;
   
   subtype MapElementsLayerPointerEnteredEventArgs is Windows.UI.Xaml.Controls.Maps.IMapElementsLayerPointerEnteredEventArgs;
   function CreateMapElementsLayerPointerEnteredEventArgs return Windows.UI.Xaml.Controls.Maps.IMapElementsLayerPointerEnteredEventArgs;
   
   subtype MapElementsLayerPointerExitedEventArgs is Windows.UI.Xaml.Controls.Maps.IMapElementsLayerPointerExitedEventArgs;
   function CreateMapElementsLayerPointerExitedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapElementsLayerPointerExitedEventArgs;
   
   subtype MapRightTappedEventArgs is Windows.UI.Xaml.Controls.Maps.IMapRightTappedEventArgs;
   function CreateMapRightTappedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapRightTappedEventArgs;
   
   subtype MapTargetCameraChangedEventArgs is Windows.UI.Xaml.Controls.Maps.IMapTargetCameraChangedEventArgs;
   function CreateMapTargetCameraChangedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapTargetCameraChangedEventArgs;
   
   subtype MapTileBitmapRequestDeferral is Windows.UI.Xaml.Controls.Maps.IMapTileBitmapRequestDeferral;
   function CreateMapTileBitmapRequestDeferral return Windows.UI.Xaml.Controls.Maps.IMapTileBitmapRequestDeferral;
   
   subtype MapTileBitmapRequest is Windows.UI.Xaml.Controls.Maps.IMapTileBitmapRequest;
   function CreateMapTileBitmapRequest return Windows.UI.Xaml.Controls.Maps.IMapTileBitmapRequest;
   
   subtype MapTileBitmapRequestedEventArgs is Windows.UI.Xaml.Controls.Maps.IMapTileBitmapRequestedEventArgs;
   function CreateMapTileBitmapRequestedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapTileBitmapRequestedEventArgs;
   
   subtype MapTileUriRequestDeferral is Windows.UI.Xaml.Controls.Maps.IMapTileUriRequestDeferral;
   function CreateMapTileUriRequestDeferral return Windows.UI.Xaml.Controls.Maps.IMapTileUriRequestDeferral;
   
   subtype MapTileUriRequest is Windows.UI.Xaml.Controls.Maps.IMapTileUriRequest;
   function CreateMapTileUriRequest return Windows.UI.Xaml.Controls.Maps.IMapTileUriRequest;
   
   subtype MapTileUriRequestedEventArgs is Windows.UI.Xaml.Controls.Maps.IMapTileUriRequestedEventArgs;
   function CreateMapTileUriRequestedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapTileUriRequestedEventArgs;
   
   subtype MapCamera is Windows.UI.Xaml.Controls.Maps.IMapCamera;
   function CreateInstanceWithLocation
   (
      location : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.UI.Xaml.Controls.Maps.IMapCamera;
   
   function CreateInstanceWithLocationAndHeading
   (
      location : Windows.Devices.Geolocation.IGeopoint
      ; headingInDegrees : Windows.Double
   )
   return Windows.UI.Xaml.Controls.Maps.IMapCamera;
   
   function CreateInstanceWithLocationHeadingAndPitch
   (
      location : Windows.Devices.Geolocation.IGeopoint
      ; headingInDegrees : Windows.Double
      ; pitchInDegrees : Windows.Double
   )
   return Windows.UI.Xaml.Controls.Maps.IMapCamera;
   
   function CreateInstanceWithLocationHeadingPitchRollAndFieldOfView
   (
      location : Windows.Devices.Geolocation.IGeopoint
      ; headingInDegrees : Windows.Double
      ; pitchInDegrees : Windows.Double
      ; rollInDegrees : Windows.Double
      ; fieldOfViewInDegrees : Windows.Double
   )
   return Windows.UI.Xaml.Controls.Maps.IMapCamera;
   
   subtype MapCustomExperience is Windows.UI.Xaml.Controls.Maps.IMapCustomExperience;
   
   type IMapCustomExperience_Interface_Impl is new IMapCustomExperience_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IMapCustomExperience := null;
      m_IMapCustomExperience : IMapCustomExperience := null;
   end record;
   type IMapCustomExperience_Impl is access all IMapCustomExperience_Interface_Impl'Class;
   type IMapCustomExperience_Impl_Ptr is access all IMapCustomExperience_Impl;
   
   function QueryInterface
   (
      This       : access IMapCustomExperience_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IMapCustomExperience_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IMapCustomExperience_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IMapCustomExperience_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IMapCustomExperience_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IMapCustomExperience_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   subtype MapElement is Windows.UI.Xaml.Controls.Maps.IMapElement;
   
   type IMapElement_Interface_Impl is new IMapElement_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IMapElement := null;
      m_IMapElement : IMapElement := null;
   end record;
   type IMapElement_Impl is access all IMapElement_Interface_Impl'Class;
   type IMapElement_Impl_Ptr is access all IMapElement_Impl;
   
   function QueryInterface
   (
      This       : access IMapElement_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IMapElement_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IMapElement_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IMapElement_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IMapElement_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IMapElement_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function get_ZIndex
   (
      This       : access IMapElement_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT;
   
   function put_ZIndex
   (
      This       : access IMapElement_Interface_Impl
      ; value : Windows.Int32
   )
   return Windows.HRESULT;
   
   function get_Visible
   (
      This       : access IMapElement_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function put_Visible
   (
      This       : access IMapElement_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT;
   
   subtype MapInputEventArgs is Windows.UI.Xaml.Controls.Maps.IMapInputEventArgs;
   function CreateMapInputEventArgs return Windows.UI.Xaml.Controls.Maps.IMapInputEventArgs;
   
   subtype MapItemsControl is Windows.UI.Xaml.Controls.Maps.IMapItemsControl;
   function CreateMapItemsControl return Windows.UI.Xaml.Controls.Maps.IMapItemsControl;
   
   subtype MapLayer is Windows.UI.Xaml.Controls.Maps.IMapLayer;
   
   type IMapLayer_Interface_Impl is new IMapLayer_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IMapLayer := null;
      m_IMapLayer : IMapLayer := null;
   end record;
   type IMapLayer_Impl is access all IMapLayer_Interface_Impl'Class;
   type IMapLayer_Impl_Ptr is access all IMapLayer_Impl;
   
   function QueryInterface
   (
      This       : access IMapLayer_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IMapLayer_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IMapLayer_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IMapLayer_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IMapLayer_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IMapLayer_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function get_MapTabIndex
   (
      This       : access IMapLayer_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT;
   
   function put_MapTabIndex
   (
      This       : access IMapLayer_Interface_Impl
      ; value : Windows.Int32
   )
   return Windows.HRESULT;
   
   function get_Visible
   (
      This       : access IMapLayer_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function put_Visible
   (
      This       : access IMapLayer_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT;
   
   function get_ZIndex
   (
      This       : access IMapLayer_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT;
   
   function put_ZIndex
   (
      This       : access IMapLayer_Interface_Impl
      ; value : Windows.Int32
   )
   return Windows.HRESULT;
   
   subtype MapModel3D is Windows.UI.Xaml.Controls.Maps.IMapModel3D;
   
   type IMapModel3D_Interface_Impl is new IMapModel3D_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IMapModel3D := null;
      m_IMapModel3D : IMapModel3D := null;
   end record;
   type IMapModel3D_Impl is access all IMapModel3D_Interface_Impl'Class;
   type IMapModel3D_Impl_Ptr is access all IMapModel3D_Impl;
   
   function QueryInterface
   (
      This       : access IMapModel3D_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IMapModel3D_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IMapModel3D_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IMapModel3D_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IMapModel3D_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IMapModel3D_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   subtype MapRouteView is Windows.UI.Xaml.Controls.Maps.IMapRouteView;
   subtype MapScene is Windows.UI.Xaml.Controls.Maps.IMapScene;
   subtype MapStyleSheet is Windows.UI.Xaml.Controls.Maps.IMapStyleSheet;
   subtype MapTileDataSource is Windows.UI.Xaml.Controls.Maps.IMapTileDataSource;
   
   type IMapTileDataSource_Interface_Impl is new IMapTileDataSource_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IMapTileDataSource := null;
      m_IMapTileDataSource : IMapTileDataSource := null;
   end record;
   type IMapTileDataSource_Impl is access all IMapTileDataSource_Interface_Impl'Class;
   type IMapTileDataSource_Impl_Ptr is access all IMapTileDataSource_Impl;
   
   function QueryInterface
   (
      This       : access IMapTileDataSource_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IMapTileDataSource_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IMapTileDataSource_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IMapTileDataSource_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IMapTileDataSource_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IMapTileDataSource_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   subtype MapTileSource is Windows.UI.Xaml.Controls.Maps.IMapTileSource;
   
   type IMapTileSource_Interface_Impl is new IMapTileSource_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IMapTileSource := null;
      m_IMapTileSource : IMapTileSource := null;
   end record;
   type IMapTileSource_Impl is access all IMapTileSource_Interface_Impl'Class;
   type IMapTileSource_Impl_Ptr is access all IMapTileSource_Impl;
   
   function QueryInterface
   (
      This       : access IMapTileSource_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IMapTileSource_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IMapTileSource_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IMapTileSource_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IMapTileSource_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IMapTileSource_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function get_DataSource
   (
      This       : access IMapTileSource_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapTileDataSource
   )
   return Windows.HRESULT;
   
   function put_DataSource
   (
      This       : access IMapTileSource_Interface_Impl
      ; value : Windows.UI.Xaml.Controls.Maps.IMapTileDataSource
   )
   return Windows.HRESULT;
   
   function get_Layer
   (
      This       : access IMapTileSource_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.MapTileLayer
   )
   return Windows.HRESULT;
   
   function put_Layer
   (
      This       : access IMapTileSource_Interface_Impl
      ; value : Windows.UI.Xaml.Controls.Maps.MapTileLayer
   )
   return Windows.HRESULT;
   
   function get_ZoomLevelRange
   (
      This       : access IMapTileSource_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.MapZoomLevelRange
   )
   return Windows.HRESULT;
   
   function put_ZoomLevelRange
   (
      This       : access IMapTileSource_Interface_Impl
      ; value : Windows.UI.Xaml.Controls.Maps.MapZoomLevelRange
   )
   return Windows.HRESULT;
   
   function get_Bounds
   (
      This       : access IMapTileSource_Interface_Impl
      ; RetVal : access Windows.Devices.Geolocation.IGeoboundingBox
   )
   return Windows.HRESULT;
   
   function put_Bounds
   (
      This       : access IMapTileSource_Interface_Impl
      ; value : Windows.Devices.Geolocation.IGeoboundingBox
   )
   return Windows.HRESULT;
   
   function get_AllowOverstretch
   (
      This       : access IMapTileSource_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function put_AllowOverstretch
   (
      This       : access IMapTileSource_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT;
   
   function get_IsFadingEnabled
   (
      This       : access IMapTileSource_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function put_IsFadingEnabled
   (
      This       : access IMapTileSource_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT;
   
   function get_IsTransparencyEnabled
   (
      This       : access IMapTileSource_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function put_IsTransparencyEnabled
   (
      This       : access IMapTileSource_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT;
   
   function get_IsRetryEnabled
   (
      This       : access IMapTileSource_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function put_IsRetryEnabled
   (
      This       : access IMapTileSource_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT;
   
   function get_ZIndex
   (
      This       : access IMapTileSource_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT;
   
   function put_ZIndex
   (
      This       : access IMapTileSource_Interface_Impl
      ; value : Windows.Int32
   )
   return Windows.HRESULT;
   
   function get_TilePixelSize
   (
      This       : access IMapTileSource_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT;
   
   function put_TilePixelSize
   (
      This       : access IMapTileSource_Interface_Impl
      ; value : Windows.Int32
   )
   return Windows.HRESULT;
   
   function get_Visible
   (
      This       : access IMapTileSource_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function put_Visible
   (
      This       : access IMapTileSource_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT;
   
   subtype StreetsidePanorama is Windows.UI.Xaml.Controls.Maps.IStreetsidePanorama;
   subtype CustomMapTileDataSource is Windows.UI.Xaml.Controls.Maps.ICustomMapTileDataSource;
   
   type ICustomMapTileDataSource_Interface_Impl is new ICustomMapTileDataSource_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased ICustomMapTileDataSource := null;
      m_ICustomMapTileDataSource : ICustomMapTileDataSource := null;
   end record;
   type ICustomMapTileDataSource_Impl is access all ICustomMapTileDataSource_Interface_Impl'Class;
   type ICustomMapTileDataSource_Impl_Ptr is access all ICustomMapTileDataSource_Impl;
   
   function QueryInterface
   (
      This       : access ICustomMapTileDataSource_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access ICustomMapTileDataSource_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access ICustomMapTileDataSource_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access ICustomMapTileDataSource_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access ICustomMapTileDataSource_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access ICustomMapTileDataSource_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function add_BitmapRequested
   (
      This       : access ICustomMapTileDataSource_Interface_Impl
      ; value : TypedEventHandler_ICustomMapTileDataSource_add_BitmapRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_BitmapRequested
   (
      This       : access ICustomMapTileDataSource_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   subtype HttpMapTileDataSource is Windows.UI.Xaml.Controls.Maps.IHttpMapTileDataSource;
   
   type IHttpMapTileDataSource_Interface_Impl is new IHttpMapTileDataSource_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IHttpMapTileDataSource := null;
      m_IHttpMapTileDataSource : IHttpMapTileDataSource := null;
   end record;
   type IHttpMapTileDataSource_Impl is access all IHttpMapTileDataSource_Interface_Impl'Class;
   type IHttpMapTileDataSource_Impl_Ptr is access all IHttpMapTileDataSource_Impl;
   
   function QueryInterface
   (
      This       : access IHttpMapTileDataSource_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IHttpMapTileDataSource_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IHttpMapTileDataSource_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IHttpMapTileDataSource_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IHttpMapTileDataSource_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IHttpMapTileDataSource_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function get_UriFormatString
   (
      This       : access IHttpMapTileDataSource_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function put_UriFormatString
   (
      This       : access IHttpMapTileDataSource_Interface_Impl
      ; value : Windows.String
   )
   return Windows.HRESULT;
   
   function get_AdditionalRequestHeaders
   (
      This       : access IHttpMapTileDataSource_Interface_Impl
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT;
   
   function get_AllowCaching
   (
      This       : access IHttpMapTileDataSource_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function put_AllowCaching
   (
      This       : access IHttpMapTileDataSource_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT;
   
   function add_UriRequested
   (
      This       : access IHttpMapTileDataSource_Interface_Impl
      ; value : TypedEventHandler_IHttpMapTileDataSource_add_UriRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_UriRequested
   (
      This       : access IHttpMapTileDataSource_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   subtype LocalMapTileDataSource is Windows.UI.Xaml.Controls.Maps.ILocalMapTileDataSource;
   
   type ILocalMapTileDataSource_Interface_Impl is new ILocalMapTileDataSource_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased ILocalMapTileDataSource := null;
      m_ILocalMapTileDataSource : ILocalMapTileDataSource := null;
   end record;
   type ILocalMapTileDataSource_Impl is access all ILocalMapTileDataSource_Interface_Impl'Class;
   type ILocalMapTileDataSource_Impl_Ptr is access all ILocalMapTileDataSource_Impl;
   
   function QueryInterface
   (
      This       : access ILocalMapTileDataSource_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access ILocalMapTileDataSource_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access ILocalMapTileDataSource_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access ILocalMapTileDataSource_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access ILocalMapTileDataSource_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access ILocalMapTileDataSource_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function get_UriFormatString
   (
      This       : access ILocalMapTileDataSource_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function put_UriFormatString
   (
      This       : access ILocalMapTileDataSource_Interface_Impl
      ; value : Windows.String
   )
   return Windows.HRESULT;
   
   function add_UriRequested
   (
      This       : access ILocalMapTileDataSource_Interface_Impl
      ; value : TypedEventHandler_ILocalMapTileDataSource_add_UriRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_UriRequested
   (
      This       : access ILocalMapTileDataSource_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   subtype MapBillboard is Windows.UI.Xaml.Controls.Maps.IMapBillboard;
   function CreateInstanceFromCamera
   (
      camera : Windows.UI.Xaml.Controls.Maps.IMapCamera
   )
   return Windows.UI.Xaml.Controls.Maps.IMapBillboard;
   
   subtype MapElement3D is Windows.UI.Xaml.Controls.Maps.IMapElement3D;
   function CreateMapElement3D return Windows.UI.Xaml.Controls.Maps.IMapElement3D;
   
   subtype MapElementsLayer is Windows.UI.Xaml.Controls.Maps.IMapElementsLayer;
   function CreateMapElementsLayer return Windows.UI.Xaml.Controls.Maps.IMapElementsLayer;
   
   subtype MapIcon is Windows.UI.Xaml.Controls.Maps.IMapIcon;
   function CreateMapIcon return Windows.UI.Xaml.Controls.Maps.IMapIcon;
   
   subtype MapPolygon is Windows.UI.Xaml.Controls.Maps.IMapPolygon;
   function CreateMapPolygon return Windows.UI.Xaml.Controls.Maps.IMapPolygon;
   
   subtype MapPolyline is Windows.UI.Xaml.Controls.Maps.IMapPolyline;
   function CreateMapPolyline return Windows.UI.Xaml.Controls.Maps.IMapPolyline;
   
   subtype StreetsideExperience is Windows.UI.Xaml.Controls.Maps.IStreetsideExperience;
   function CreateInstanceWithPanorama
   (
      panorama : Windows.UI.Xaml.Controls.Maps.IStreetsidePanorama
   )
   return Windows.UI.Xaml.Controls.Maps.IStreetsideExperience;
   
   function CreateInstanceWithPanoramaHeadingPitchAndFieldOfView
   (
      panorama : Windows.UI.Xaml.Controls.Maps.IStreetsidePanorama
      ; headingInDegrees : Windows.Double
      ; pitchInDegrees : Windows.Double
      ; fieldOfViewInDegrees : Windows.Double
   )
   return Windows.UI.Xaml.Controls.Maps.IStreetsideExperience;
   
   subtype MapControl is Windows.UI.Xaml.Controls.Maps.IMapControl;
   function CreateMapControl return Windows.UI.Xaml.Controls.Maps.IMapControl;
   
   subtype MapControlBusinessLandmarkClickEventArgs is Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkClickEventArgs;
   function CreateMapControlBusinessLandmarkClickEventArgs return Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkClickEventArgs;
   
   subtype MapControlTransitFeatureClickEventArgs is Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeatureClickEventArgs;
   function CreateMapControlTransitFeatureClickEventArgs return Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeatureClickEventArgs;
   
   subtype MapControlBusinessLandmarkRightTappedEventArgs is Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkRightTappedEventArgs;
   function CreateMapControlBusinessLandmarkRightTappedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkRightTappedEventArgs;
   
   subtype MapControlTransitFeatureRightTappedEventArgs is Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeatureRightTappedEventArgs;
   function CreateMapControlTransitFeatureRightTappedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeatureRightTappedEventArgs;
   
   subtype MapControlBusinessLandmarkPointerEnteredEventArgs is Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkPointerEnteredEventArgs;
   function CreateMapControlBusinessLandmarkPointerEnteredEventArgs return Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkPointerEnteredEventArgs;
   
   subtype MapControlTransitFeaturePointerEnteredEventArgs is Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeaturePointerEnteredEventArgs;
   function CreateMapControlTransitFeaturePointerEnteredEventArgs return Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeaturePointerEnteredEventArgs;
   
   subtype MapControlBusinessLandmarkPointerExitedEventArgs is Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkPointerExitedEventArgs;
   function CreateMapControlBusinessLandmarkPointerExitedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkPointerExitedEventArgs;
   
   subtype MapControlTransitFeaturePointerExitedEventArgs is Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeaturePointerExitedEventArgs;
   function CreateMapControlTransitFeaturePointerExitedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeaturePointerExitedEventArgs;
   
   subtype MapControlDataHelper is Windows.UI.Xaml.Controls.Maps.IMapControlDataHelper;
   function CreateInstance
   (
      map : Windows.UI.Xaml.Controls.Maps.IMapControl
   )
   return Windows.UI.Xaml.Controls.Maps.IMapControlDataHelper;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_Area
   return Windows.String;
   
   function get_Airport
   return Windows.String;
   
   function get_Cemetery
   return Windows.String;
   
   function get_Continent
   return Windows.String;
   
   function get_Education
   return Windows.String;
   
   function get_IndigenousPeoplesReserve
   return Windows.String;
   
   function get_Island
   return Windows.String;
   
   function get_Medical
   return Windows.String;
   
   function get_Military
   return Windows.String;
   
   function get_Nautical
   return Windows.String;
   
   function get_Neighborhood
   return Windows.String;
   
   function get_Runway
   return Windows.String;
   
   function get_Sand
   return Windows.String;
   
   function get_ShoppingCenter
   return Windows.String;
   
   function get_Stadium
   return Windows.String;
   
   function get_Vegetation
   return Windows.String;
   
   function get_Forest
   return Windows.String;
   
   function get_GolfCourse
   return Windows.String;
   
   function get_Park
   return Windows.String;
   
   function get_PlayingField
   return Windows.String;
   
   function get_Reserve
   return Windows.String;
   
   function get_Point
   return Windows.String;
   
   function get_NaturalPoint
   return Windows.String;
   
   function get_Peak
   return Windows.String;
   
   function get_VolcanicPeak
   return Windows.String;
   
   function get_WaterPoint
   return Windows.String;
   
   function get_PointOfInterest
   return Windows.String;
   
   function get_Business
   return Windows.String;
   
   function get_FoodPoint
   return Windows.String;
   
   function get_PopulatedPlace
   return Windows.String;
   
   function get_Capital
   return Windows.String;
   
   function get_AdminDistrictCapital
   return Windows.String;
   
   function get_CountryRegionCapital
   return Windows.String;
   
   function get_RoadShield
   return Windows.String;
   
   function get_RoadExit
   return Windows.String;
   
   function get_Transit
   return Windows.String;
   
   function get_Political
   return Windows.String;
   
   function get_CountryRegion
   return Windows.String;
   
   function get_AdminDistrict
   return Windows.String;
   
   function get_District
   return Windows.String;
   
   function get_Structure
   return Windows.String;
   
   function get_Building
   return Windows.String;
   
   function get_EducationBuilding
   return Windows.String;
   
   function get_MedicalBuilding
   return Windows.String;
   
   function get_TransitBuilding
   return Windows.String;
   
   function get_Transportation
   return Windows.String;
   
   function get_Road
   return Windows.String;
   
   function get_ControlledAccessHighway
   return Windows.String;
   
   function get_HighSpeedRamp
   return Windows.String;
   
   function get_Highway
   return Windows.String;
   
   function get_MajorRoad
   return Windows.String;
   
   function get_ArterialRoad
   return Windows.String;
   
   function get_Street
   return Windows.String;
   
   function get_Ramp
   return Windows.String;
   
   function get_UnpavedStreet
   return Windows.String;
   
   function get_TollRoad
   return Windows.String;
   
   function get_Railway
   return Windows.String;
   
   function get_Trail
   return Windows.String;
   
   function get_WaterRoute
   return Windows.String;
   
   function get_Water
   return Windows.String;
   
   function get_River
   return Windows.String;
   
   function get_RouteLine
   return Windows.String;
   
   function get_WalkingRoute
   return Windows.String;
   
   function get_DrivingRoute
   return Windows.String;
   
   function get_Disabled
   return Windows.String;
   
   function get_Hover
   return Windows.String;
   
   function get_Selected
   return Windows.String;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IMapCustomExperience;
   
   function get_IsEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IMapElement;
   
   function get_MapStyleSheetEntryProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_MapStyleSheetEntryStateProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TagProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ZIndexProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_VisibleProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_MapTabIndexProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ItemsSourceProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ItemsProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ItemTemplateProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IMapLayer;
   
   function get_MapTabIndexProperty_IMapLayer
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_VisibleProperty_IMapLayer
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ZIndexProperty_IMapLayer
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IMapModel3D;
   
   function CreateFrom3MFAsync
   (
      source : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.UI.Xaml.Controls.Maps.IAsyncOperation_IMapModel3D;
   
   function CreateFrom3MFWithShadingOptionAsync
   (
      source : Windows.Storage.Streams.IRandomAccessStreamReference
      ; shadingOption : Windows.UI.Xaml.Controls.Maps.MapModel3DShadingOption
   )
   return Windows.UI.Xaml.Controls.Maps.IAsyncOperation_IMapModel3D;
   
   function CreateInstanceWithMapRoute
   (
      route : Windows.Services.Maps.IMapRoute
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IMapRouteView;
   
   function CreateFromBoundingBox
   (
      bounds : Windows.Devices.Geolocation.IGeoboundingBox
   )
   return Windows.UI.Xaml.Controls.Maps.IMapScene;
   
   function CreateFromBoundingBoxWithHeadingAndPitch
   (
      bounds : Windows.Devices.Geolocation.IGeoboundingBox
      ; headingInDegrees : Windows.Double
      ; pitchInDegrees : Windows.Double
   )
   return Windows.UI.Xaml.Controls.Maps.IMapScene;
   
   function CreateFromCamera
   (
      camera : Windows.UI.Xaml.Controls.Maps.IMapCamera
   )
   return Windows.UI.Xaml.Controls.Maps.IMapScene;
   
   function CreateFromLocation
   (
      location : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.UI.Xaml.Controls.Maps.IMapScene;
   
   function CreateFromLocationWithHeadingAndPitch
   (
      location : Windows.Devices.Geolocation.IGeopoint
      ; headingInDegrees : Windows.Double
      ; pitchInDegrees : Windows.Double
   )
   return Windows.UI.Xaml.Controls.Maps.IMapScene;
   
   function CreateFromLocationAndRadius
   (
      location : Windows.Devices.Geolocation.IGeopoint
      ; radiusInMeters : Windows.Double
   )
   return Windows.UI.Xaml.Controls.Maps.IMapScene;
   
   function CreateFromLocationAndRadiusWithHeadingAndPitch
   (
      location : Windows.Devices.Geolocation.IGeopoint
      ; radiusInMeters : Windows.Double
      ; headingInDegrees : Windows.Double
      ; pitchInDegrees : Windows.Double
   )
   return Windows.UI.Xaml.Controls.Maps.IMapScene;
   
   function CreateFromLocations
   (
      locations : Windows.Devices.Geolocation.IIterable_IGeopoint
   )
   return Windows.UI.Xaml.Controls.Maps.IMapScene;
   
   function CreateFromLocationsWithHeadingAndPitch
   (
      locations : Windows.Devices.Geolocation.IIterable_IGeopoint
      ; headingInDegrees : Windows.Double
      ; pitchInDegrees : Windows.Double
   )
   return Windows.UI.Xaml.Controls.Maps.IMapScene;
   
   function Aerial
   return Windows.UI.Xaml.Controls.Maps.IMapStyleSheet;
   
   function AerialWithOverlay
   return Windows.UI.Xaml.Controls.Maps.IMapStyleSheet;
   
   function RoadLight
   return Windows.UI.Xaml.Controls.Maps.IMapStyleSheet;
   
   function RoadDark
   return Windows.UI.Xaml.Controls.Maps.IMapStyleSheet;
   
   function RoadHighContrastLight
   return Windows.UI.Xaml.Controls.Maps.IMapStyleSheet;
   
   function RoadHighContrastDark
   return Windows.UI.Xaml.Controls.Maps.IMapStyleSheet;
   
   function Combine
   (
      styleSheets : Windows.UI.Xaml.Controls.Maps.IIterable_IMapStyleSheet
   )
   return Windows.UI.Xaml.Controls.Maps.IMapStyleSheet;
   
   function ParseFromJson
   (
      styleAsJson : Windows.String
   )
   return Windows.UI.Xaml.Controls.Maps.IMapStyleSheet;
   
   function TryParseFromJson
   (
      styleAsJson : Windows.String
      ; styleSheet : access Windows.UI.Xaml.Controls.Maps.IMapStyleSheet
   )
   return Windows.Boolean;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IMapTileDataSource;
   
   function get_DataSourceProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_LayerProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ZoomLevelRangeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_BoundsProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_AllowOverstretchProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsFadingEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsTransparencyEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsRetryEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ZIndexProperty_IMapTileSource
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TilePixelSizeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_VisibleProperty_IMapTileSource
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IMapTileSource;
   
   function CreateInstanceWithDataSource
   (
      dataSource : Windows.UI.Xaml.Controls.Maps.IMapTileDataSource
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IMapTileSource;
   
   function CreateInstanceWithDataSourceAndZoomRange
   (
      dataSource : Windows.UI.Xaml.Controls.Maps.IMapTileDataSource
      ; zoomLevelRange : Windows.UI.Xaml.Controls.Maps.MapZoomLevelRange
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IMapTileSource;
   
   function CreateInstanceWithDataSourceZoomRangeAndBounds
   (
      dataSource : Windows.UI.Xaml.Controls.Maps.IMapTileDataSource
      ; zoomLevelRange : Windows.UI.Xaml.Controls.Maps.MapZoomLevelRange
      ; bounds : Windows.Devices.Geolocation.IGeoboundingBox
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IMapTileSource;
   
   function CreateInstanceWithDataSourceZoomRangeBoundsAndTileSize
   (
      dataSource : Windows.UI.Xaml.Controls.Maps.IMapTileDataSource
      ; zoomLevelRange : Windows.UI.Xaml.Controls.Maps.MapZoomLevelRange
      ; bounds : Windows.Devices.Geolocation.IGeoboundingBox
      ; tileSizeInPixels : Windows.Int32
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IMapTileSource;
   
   function FindNearbyWithLocationAsync
   (
      location : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.UI.Xaml.Controls.Maps.IAsyncOperation_IStreetsidePanorama;
   
   function FindNearbyWithLocationAndRadiusAsync
   (
      location : Windows.Devices.Geolocation.IGeopoint
      ; radiusInMeters : Windows.Double
   )
   return Windows.UI.Xaml.Controls.Maps.IAsyncOperation_IStreetsidePanorama;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.ICustomMapTileDataSource;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IHttpMapTileDataSource;
   
   function CreateInstanceWithUriFormatString
   (
      uriFormatString : Windows.String
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IHttpMapTileDataSource;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.ILocalMapTileDataSource;
   
   function CreateInstanceWithUriFormatString
   (
      uriFormatString : Windows.String
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.ILocalMapTileDataSource;
   
   function get_LocationProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_NormalizedAnchorPointProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CollisionBehaviorDesiredProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_LocationProperty_IMapElement3D
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_HeadingProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PitchProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RollProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ScaleProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_MapElementsProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CollisionBehaviorDesiredProperty_IMapIcon
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_LocationProperty_IMapIcon
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TitleProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_NormalizedAnchorPointProperty_IMapIcon
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PathProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_StrokeThicknessProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_StrokeDashedProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PathProperty_IMapPolyline
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_StrokeDashedProperty_IMapPolyline
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_MapProjectionProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_StyleSheetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ViewPaddingProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RegionProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_BusinessLandmarksEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TransitFeaturesEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_BusinessLandmarksVisibleProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TransitFeaturesVisibleProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PanInteractionModeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RotateInteractionModeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TiltInteractionModeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ZoomInteractionModeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_Is3DSupportedProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsStreetsideSupportedProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SceneProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CenterProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ChildrenProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ColorSchemeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_DesiredPitchProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_HeadingProperty_IMapControl
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_LandmarksVisibleProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_LoadingStatusProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_MapServiceTokenProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PedestrianFeaturesVisibleProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PitchProperty_IMapControl
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_StyleProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TrafficFlowVisibleProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TransformOriginProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_WatermarkModeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ZoomLevelProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_MapElementsProperty_IMapControl
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RoutesProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TileSourcesProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_LocationProperty_IMapControl
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetLocation
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Devices.Geolocation.IGeopoint;
   
   procedure SetLocation
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Devices.Geolocation.IGeopoint
   )
   ;
   
   function get_NormalizedAnchorPointProperty_IMapControl
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetNormalizedAnchorPoint
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Foundation.Point;
   
   procedure SetNormalizedAnchorPoint
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Foundation.Point
   )
   ;
   
   function get_LayersProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateMapControl
   (
      rasterRenderMode : Windows.Boolean
   )
   return Windows.UI.Xaml.Controls.Maps.IMapControl;
   
end;
