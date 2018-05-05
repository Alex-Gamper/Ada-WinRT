--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.2.0.1                                                     --
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
with Windows.Foundation.Numerics;
with Windows.Foundation.Collections;
limited with Windows.Storage.Streams;
limited with Windows.System.RemoteSystems;
--------------------------------------------------------------------------------
package Windows.Perception.Spatial is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type SpatialPerceptionAccessStatus is (
      Unspecified,
      Allowed,
      DeniedByUser,
      DeniedBySystem
   );
   for SpatialPerceptionAccessStatus use (
      Unspecified => 0,
      Allowed => 1,
      DeniedByUser => 2,
      DeniedBySystem => 3
   );
   for SpatialPerceptionAccessStatus'Size use 32;
   
   type SpatialPerceptionAccessStatus_Ptr is access SpatialPerceptionAccessStatus;
   
   type SpatialLocatability is (
      Unavailable,
      OrientationOnly,
      PositionalTrackingActivating,
      PositionalTrackingActive,
      PositionalTrackingInhibited
   );
   for SpatialLocatability use (
      Unavailable => 0,
      OrientationOnly => 1,
      PositionalTrackingActivating => 2,
      PositionalTrackingActive => 3,
      PositionalTrackingInhibited => 4
   );
   for SpatialLocatability'Size use 32;
   
   type SpatialLocatability_Ptr is access SpatialLocatability;
   
   type SpatialMovementRange is (
      NoMovement,
      Bounded
   );
   for SpatialMovementRange use (
      NoMovement => 0,
      Bounded => 1
   );
   for SpatialMovementRange'Size use 32;
   
   type SpatialMovementRange_Ptr is access SpatialMovementRange;
   
   type SpatialLookDirectionRange is (
      ForwardOnly,
      Omnidirectional
   );
   for SpatialLookDirectionRange use (
      ForwardOnly => 0,
      Omnidirectional => 1
   );
   for SpatialLookDirectionRange'Size use 32;
   
   type SpatialLookDirectionRange_Ptr is access SpatialLookDirectionRange;
   
   type SpatialEntityWatcherStatus is (
      Created,
      Started,
      EnumerationCompleted,
      Stopping,
      Stopped,
      Aborted
   );
   for SpatialEntityWatcherStatus use (
      Created => 0,
      Started => 1,
      EnumerationCompleted => 2,
      Stopping => 3,
      Stopped => 4,
      Aborted => 5
   );
   for SpatialEntityWatcherStatus'Size use 32;
   
   type SpatialEntityWatcherStatus_Ptr is access SpatialEntityWatcherStatus;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type SpatialBoundingFrustum is record
      Near : Windows.Foundation.Numerics.Plane;
      Far : Windows.Foundation.Numerics.Plane;
      Right : Windows.Foundation.Numerics.Plane;
      Left : Windows.Foundation.Numerics.Plane;
      Top : Windows.Foundation.Numerics.Plane;
      Bottom : Windows.Foundation.Numerics.Plane;
   end record;
   pragma Convention (C_Pass_By_Copy , SpatialBoundingFrustum);
   
   type SpatialBoundingFrustum_Ptr is access SpatialBoundingFrustum;
   
   type SpatialBoundingBox is record
      Center : Windows.Foundation.Numerics.Vector3;
      Extents : Windows.Foundation.Numerics.Vector3;
   end record;
   pragma Convention (C_Pass_By_Copy , SpatialBoundingBox);
   
   type SpatialBoundingBox_Ptr is access SpatialBoundingBox;
   
   type SpatialBoundingOrientedBox is record
      Center : Windows.Foundation.Numerics.Vector3;
      Extents : Windows.Foundation.Numerics.Vector3;
      Orientation : Windows.Foundation.Numerics.Quaternion;
   end record;
   pragma Convention (C_Pass_By_Copy , SpatialBoundingOrientedBox);
   
   type SpatialBoundingOrientedBox_Ptr is access SpatialBoundingOrientedBox;
   
   type SpatialBoundingSphere is record
      Center : Windows.Foundation.Numerics.Vector3;
      Radius : Windows.Single;
   end record;
   pragma Convention (C_Pass_By_Copy , SpatialBoundingSphere);
   
   type SpatialBoundingSphere_Ptr is access SpatialBoundingSphere;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_ISpatialAnchor_add_RawCoordinateSystemAdjusted_Interface;
   type TypedEventHandler_ISpatialAnchor_add_RawCoordinateSystemAdjusted is access all TypedEventHandler_ISpatialAnchor_add_RawCoordinateSystemAdjusted_Interface'Class;
   type TypedEventHandler_ISpatialAnchor_add_RawCoordinateSystemAdjusted_Ptr is access all TypedEventHandler_ISpatialAnchor_add_RawCoordinateSystemAdjusted;
   type AsyncOperationCompletedHandler_ISpatialAnchorStore_Interface;
   type AsyncOperationCompletedHandler_ISpatialAnchorStore is access all AsyncOperationCompletedHandler_ISpatialAnchorStore_Interface'Class;
   type AsyncOperationCompletedHandler_ISpatialAnchorStore_Ptr is access all AsyncOperationCompletedHandler_ISpatialAnchorStore;
   type AsyncOperationCompletedHandler_SpatialPerceptionAccessStatus_Interface;
   type AsyncOperationCompletedHandler_SpatialPerceptionAccessStatus is access all AsyncOperationCompletedHandler_SpatialPerceptionAccessStatus_Interface'Class;
   type AsyncOperationCompletedHandler_SpatialPerceptionAccessStatus_Ptr is access all AsyncOperationCompletedHandler_SpatialPerceptionAccessStatus;
   type TypedEventHandler_ISpatialLocator_add_LocatabilityChanged_Interface;
   type TypedEventHandler_ISpatialLocator_add_LocatabilityChanged is access all TypedEventHandler_ISpatialLocator_add_LocatabilityChanged_Interface'Class;
   type TypedEventHandler_ISpatialLocator_add_LocatabilityChanged_Ptr is access all TypedEventHandler_ISpatialLocator_add_LocatabilityChanged;
   type TypedEventHandler_ISpatialLocator_add_PositionalTrackingDeactivating_Interface;
   type TypedEventHandler_ISpatialLocator_add_PositionalTrackingDeactivating is access all TypedEventHandler_ISpatialLocator_add_PositionalTrackingDeactivating_Interface'Class;
   type TypedEventHandler_ISpatialLocator_add_PositionalTrackingDeactivating_Ptr is access all TypedEventHandler_ISpatialLocator_add_PositionalTrackingDeactivating;
   type AsyncOperationCompletedHandler_ISpatialStageFrameOfReference_Interface;
   type AsyncOperationCompletedHandler_ISpatialStageFrameOfReference is access all AsyncOperationCompletedHandler_ISpatialStageFrameOfReference_Interface'Class;
   type AsyncOperationCompletedHandler_ISpatialStageFrameOfReference_Ptr is access all AsyncOperationCompletedHandler_ISpatialStageFrameOfReference;
   type TypedEventHandler_ISpatialEntityWatcher_add_Added_Interface;
   type TypedEventHandler_ISpatialEntityWatcher_add_Added is access all TypedEventHandler_ISpatialEntityWatcher_add_Added_Interface'Class;
   type TypedEventHandler_ISpatialEntityWatcher_add_Added_Ptr is access all TypedEventHandler_ISpatialEntityWatcher_add_Added;
   type TypedEventHandler_ISpatialEntityWatcher_add_Updated_Interface;
   type TypedEventHandler_ISpatialEntityWatcher_add_Updated is access all TypedEventHandler_ISpatialEntityWatcher_add_Updated_Interface'Class;
   type TypedEventHandler_ISpatialEntityWatcher_add_Updated_Ptr is access all TypedEventHandler_ISpatialEntityWatcher_add_Updated;
   type TypedEventHandler_ISpatialEntityWatcher_add_Removed_Interface;
   type TypedEventHandler_ISpatialEntityWatcher_add_Removed is access all TypedEventHandler_ISpatialEntityWatcher_add_Removed_Interface'Class;
   type TypedEventHandler_ISpatialEntityWatcher_add_Removed_Ptr is access all TypedEventHandler_ISpatialEntityWatcher_add_Removed;
   type TypedEventHandler_ISpatialEntityWatcher_add_EnumerationCompleted_Interface;
   type TypedEventHandler_ISpatialEntityWatcher_add_EnumerationCompleted is access all TypedEventHandler_ISpatialEntityWatcher_add_EnumerationCompleted_Interface'Class;
   type TypedEventHandler_ISpatialEntityWatcher_add_EnumerationCompleted_Ptr is access all TypedEventHandler_ISpatialEntityWatcher_add_EnumerationCompleted;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISpatialCoordinateSystem_Interface;
   type ISpatialCoordinateSystem is access all ISpatialCoordinateSystem_Interface'Class;
   type ISpatialCoordinateSystem_Ptr is access all ISpatialCoordinateSystem;
   type ISpatialAnchorRawCoordinateSystemAdjustedEventArgs_Interface;
   type ISpatialAnchorRawCoordinateSystemAdjustedEventArgs is access all ISpatialAnchorRawCoordinateSystemAdjustedEventArgs_Interface'Class;
   type ISpatialAnchorRawCoordinateSystemAdjustedEventArgs_Ptr is access all ISpatialAnchorRawCoordinateSystemAdjustedEventArgs;
   type ISpatialAnchor_Interface;
   type ISpatialAnchor is access all ISpatialAnchor_Interface'Class;
   type ISpatialAnchor_Ptr is access all ISpatialAnchor;
   type ISpatialAnchor2_Interface;
   type ISpatialAnchor2 is access all ISpatialAnchor2_Interface'Class;
   type ISpatialAnchor2_Ptr is access all ISpatialAnchor2;
   type ISpatialAnchorStatics_Interface;
   type ISpatialAnchorStatics is access all ISpatialAnchorStatics_Interface'Class;
   type ISpatialAnchorStatics_Ptr is access all ISpatialAnchorStatics;
   type ISpatialAnchorStore_Interface;
   type ISpatialAnchorStore is access all ISpatialAnchorStore_Interface'Class;
   type ISpatialAnchorStore_Ptr is access all ISpatialAnchorStore;
   type ISpatialAnchorManagerStatics_Interface;
   type ISpatialAnchorManagerStatics is access all ISpatialAnchorManagerStatics_Interface'Class;
   type ISpatialAnchorManagerStatics_Ptr is access all ISpatialAnchorManagerStatics;
   type ISpatialAnchorTransferManagerStatics_Interface;
   type ISpatialAnchorTransferManagerStatics is access all ISpatialAnchorTransferManagerStatics_Interface'Class;
   type ISpatialAnchorTransferManagerStatics_Ptr is access all ISpatialAnchorTransferManagerStatics;
   type ISpatialLocatorPositionalTrackingDeactivatingEventArgs_Interface;
   type ISpatialLocatorPositionalTrackingDeactivatingEventArgs is access all ISpatialLocatorPositionalTrackingDeactivatingEventArgs_Interface'Class;
   type ISpatialLocatorPositionalTrackingDeactivatingEventArgs_Ptr is access all ISpatialLocatorPositionalTrackingDeactivatingEventArgs;
   type ISpatialLocatorAttachedFrameOfReference_Interface;
   type ISpatialLocatorAttachedFrameOfReference is access all ISpatialLocatorAttachedFrameOfReference_Interface'Class;
   type ISpatialLocatorAttachedFrameOfReference_Ptr is access all ISpatialLocatorAttachedFrameOfReference;
   type ISpatialStationaryFrameOfReference_Interface;
   type ISpatialStationaryFrameOfReference is access all ISpatialStationaryFrameOfReference_Interface'Class;
   type ISpatialStationaryFrameOfReference_Ptr is access all ISpatialStationaryFrameOfReference;
   type ISpatialLocation_Interface;
   type ISpatialLocation is access all ISpatialLocation_Interface'Class;
   type ISpatialLocation_Ptr is access all ISpatialLocation;
   type ISpatialLocator_Interface;
   type ISpatialLocator is access all ISpatialLocator_Interface'Class;
   type ISpatialLocator_Ptr is access all ISpatialLocator;
   type ISpatialLocatorStatics_Interface;
   type ISpatialLocatorStatics is access all ISpatialLocatorStatics_Interface'Class;
   type ISpatialLocatorStatics_Ptr is access all ISpatialLocatorStatics;
   type ISpatialBoundingVolume_Interface;
   type ISpatialBoundingVolume is access all ISpatialBoundingVolume_Interface'Class;
   type ISpatialBoundingVolume_Ptr is access all ISpatialBoundingVolume;
   type ISpatialBoundingVolumeStatics_Interface;
   type ISpatialBoundingVolumeStatics is access all ISpatialBoundingVolumeStatics_Interface'Class;
   type ISpatialBoundingVolumeStatics_Ptr is access all ISpatialBoundingVolumeStatics;
   type ISpatialStageFrameOfReference_Interface;
   type ISpatialStageFrameOfReference is access all ISpatialStageFrameOfReference_Interface'Class;
   type ISpatialStageFrameOfReference_Ptr is access all ISpatialStageFrameOfReference;
   type ISpatialStageFrameOfReferenceStatics_Interface;
   type ISpatialStageFrameOfReferenceStatics is access all ISpatialStageFrameOfReferenceStatics_Interface'Class;
   type ISpatialStageFrameOfReferenceStatics_Ptr is access all ISpatialStageFrameOfReferenceStatics;
   type ISpatialEntity_Interface;
   type ISpatialEntity is access all ISpatialEntity_Interface'Class;
   type ISpatialEntity_Ptr is access all ISpatialEntity;
   type ISpatialEntityFactory_Interface;
   type ISpatialEntityFactory is access all ISpatialEntityFactory_Interface'Class;
   type ISpatialEntityFactory_Ptr is access all ISpatialEntityFactory;
   type ISpatialEntityAddedEventArgs_Interface;
   type ISpatialEntityAddedEventArgs is access all ISpatialEntityAddedEventArgs_Interface'Class;
   type ISpatialEntityAddedEventArgs_Ptr is access all ISpatialEntityAddedEventArgs;
   type ISpatialEntityUpdatedEventArgs_Interface;
   type ISpatialEntityUpdatedEventArgs is access all ISpatialEntityUpdatedEventArgs_Interface'Class;
   type ISpatialEntityUpdatedEventArgs_Ptr is access all ISpatialEntityUpdatedEventArgs;
   type ISpatialEntityRemovedEventArgs_Interface;
   type ISpatialEntityRemovedEventArgs is access all ISpatialEntityRemovedEventArgs_Interface'Class;
   type ISpatialEntityRemovedEventArgs_Ptr is access all ISpatialEntityRemovedEventArgs;
   type ISpatialEntityWatcher_Interface;
   type ISpatialEntityWatcher is access all ISpatialEntityWatcher_Interface'Class;
   type ISpatialEntityWatcher_Ptr is access all ISpatialEntityWatcher;
   type ISpatialEntityStore_Interface;
   type ISpatialEntityStore is access all ISpatialEntityStore_Interface'Class;
   type ISpatialEntityStore_Ptr is access all ISpatialEntityStore;
   type ISpatialEntityStoreStatics_Interface;
   type ISpatialEntityStoreStatics is access all ISpatialEntityStoreStatics_Interface'Class;
   type ISpatialEntityStoreStatics_Ptr is access all ISpatialEntityStoreStatics;
   type IReference_SpatialBoundingBox_Interface;
   type IReference_SpatialBoundingBox is access all IReference_SpatialBoundingBox_Interface'Class;
   type IReference_SpatialBoundingBox_Ptr is access all IReference_SpatialBoundingBox;
   type IAsyncOperation_ISpatialAnchorStore_Interface;
   type IAsyncOperation_ISpatialAnchorStore is access all IAsyncOperation_ISpatialAnchorStore_Interface'Class;
   type IAsyncOperation_ISpatialAnchorStore_Ptr is access all IAsyncOperation_ISpatialAnchorStore;
   type IAsyncOperation_SpatialPerceptionAccessStatus_Interface;
   type IAsyncOperation_SpatialPerceptionAccessStatus is access all IAsyncOperation_SpatialPerceptionAccessStatus_Interface'Class;
   type IAsyncOperation_SpatialPerceptionAccessStatus_Ptr is access all IAsyncOperation_SpatialPerceptionAccessStatus;
   type IReference_SpatialBoundingFrustum_Interface;
   type IReference_SpatialBoundingFrustum is access all IReference_SpatialBoundingFrustum_Interface'Class;
   type IReference_SpatialBoundingFrustum_Ptr is access all IReference_SpatialBoundingFrustum;
   type IReference_SpatialBoundingOrientedBox_Interface;
   type IReference_SpatialBoundingOrientedBox is access all IReference_SpatialBoundingOrientedBox_Interface'Class;
   type IReference_SpatialBoundingOrientedBox_Ptr is access all IReference_SpatialBoundingOrientedBox;
   type IIterator_ISpatialBoundingVolume_Interface;
   type IIterator_ISpatialBoundingVolume is access all IIterator_ISpatialBoundingVolume_Interface'Class;
   type IIterator_ISpatialBoundingVolume_Ptr is access all IIterator_ISpatialBoundingVolume;
   type IIterable_ISpatialBoundingVolume_Interface;
   type IIterable_ISpatialBoundingVolume is access all IIterable_ISpatialBoundingVolume_Interface'Class;
   type IIterable_ISpatialBoundingVolume_Ptr is access all IIterable_ISpatialBoundingVolume;
   type IAsyncOperation_ISpatialStageFrameOfReference_Interface;
   type IAsyncOperation_ISpatialStageFrameOfReference is access all IAsyncOperation_ISpatialStageFrameOfReference_Interface'Class;
   type IAsyncOperation_ISpatialStageFrameOfReference_Ptr is access all IAsyncOperation_ISpatialStageFrameOfReference;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ISpatialCoordinateSystem : aliased constant Windows.IID := (1777060427, 24739, 13702, (166, 83, 89, 167, 189, 103, 109, 7 ));
   
   type ISpatialCoordinateSystem_Interface is interface and Windows.IInspectable_Interface;
   
   function TryGetTransformTo
   (
      This       : access ISpatialCoordinateSystem_Interface
      ; target : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; RetVal : access Windows.Foundation.Numerics.IReference_Matrix4x4 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialAnchorRawCoordinateSystemAdjustedEventArgs : aliased constant Windows.IID := (2716343992, 22215, 12567, (162, 228, 129, 224, 252, 242, 142, 0 ));
   
   type ISpatialAnchorRawCoordinateSystemAdjustedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OldRawCoordinateSystemToNewRawCoordinateSystemTransform
   (
      This       : access ISpatialAnchorRawCoordinateSystemAdjustedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Numerics.Matrix4x4
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialAnchor : aliased constant Windows.IID := (86631886, 7476, 14082, (188, 236, 234, 191, 245, 120, 168, 105 ));
   
   type ISpatialAnchor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CoordinateSystem
   (
      This       : access ISpatialAnchor_Interface
      ; RetVal : access Windows.Perception.Spatial.ISpatialCoordinateSystem
   )
   return Windows.HRESULT is abstract;
   
   function get_RawCoordinateSystem
   (
      This       : access ISpatialAnchor_Interface
      ; RetVal : access Windows.Perception.Spatial.ISpatialCoordinateSystem
   )
   return Windows.HRESULT is abstract;
   
   function add_RawCoordinateSystemAdjusted
   (
      This       : access ISpatialAnchor_Interface
      ; handler : TypedEventHandler_ISpatialAnchor_add_RawCoordinateSystemAdjusted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RawCoordinateSystemAdjusted
   (
      This       : access ISpatialAnchor_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialAnchor2 : aliased constant Windows.IID := (3977758984, 42645, 19702, (146, 253, 151, 38, 59, 167, 16, 71 ));
   
   type ISpatialAnchor2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RemovedByUser
   (
      This       : access ISpatialAnchor2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialAnchorStatics : aliased constant Windows.IID := (2844952130, 372, 12572, (174, 121, 14, 81, 7, 102, 159, 22 ));
   
   type ISpatialAnchorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function TryCreateRelativeTo
   (
      This       : access ISpatialAnchorStatics_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; RetVal : access Windows.Perception.Spatial.ISpatialAnchor
   )
   return Windows.HRESULT is abstract;
   
   function TryCreateWithPositionRelativeTo
   (
      This       : access ISpatialAnchorStatics_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; position : Windows.Foundation.Numerics.Vector3
      ; RetVal : access Windows.Perception.Spatial.ISpatialAnchor
   )
   return Windows.HRESULT is abstract;
   
   function TryCreateWithPositionAndOrientationRelativeTo
   (
      This       : access ISpatialAnchorStatics_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; position : Windows.Foundation.Numerics.Vector3
      ; orientation : Windows.Foundation.Numerics.Quaternion
      ; RetVal : access Windows.Perception.Spatial.ISpatialAnchor
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialAnchorStore : aliased constant Windows.IID := (2965124662, 18538, 15536, (158, 111, 18, 69, 22, 92, 77, 182 ));
   
   type ISpatialAnchorStore_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAllSavedAnchors
   (
      This       : access ISpatialAnchorStore_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TrySave
   (
      This       : access ISpatialAnchorStore_Interface
      ; id : Windows.String
      ; anchor : Windows.Perception.Spatial.ISpatialAnchor
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Remove
   (
      This       : access ISpatialAnchorStore_Interface
      ; id : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access ISpatialAnchorStore_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialAnchorManagerStatics : aliased constant Windows.IID := (2296581803, 62391, 16907, (176, 134, 138, 128, 192, 125, 145, 13 ));
   
   type ISpatialAnchorManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestStoreAsync
   (
      This       : access ISpatialAnchorManagerStatics_Interface
      ; RetVal : access Windows.Perception.Spatial.IAsyncOperation_ISpatialAnchorStore -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialAnchorTransferManagerStatics : aliased constant Windows.IID := (62650809, 4824, 19406, (136, 53, 197, 223, 58, 192, 173, 171 ));
   
   type ISpatialAnchorTransferManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function TryImportAnchorsAsync
   (
      This       : access ISpatialAnchorTransferManagerStatics_Interface
      ; stream : Windows.Storage.Streams.IInputStream
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryExportAnchorsAsync
   (
      This       : access ISpatialAnchorTransferManagerStatics_Interface
      ; anchors : Windows.Address
      ; stream : Windows.Storage.Streams.IOutputStream
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessAsync
   (
      This       : access ISpatialAnchorTransferManagerStatics_Interface
      ; RetVal : access Windows.Perception.Spatial.IAsyncOperation_SpatialPerceptionAccessStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialLocatorPositionalTrackingDeactivatingEventArgs : aliased constant Windows.IID := (3098034275, 58356, 13963, (144, 97, 158, 169, 209, 214, 204, 22 ));
   
   type ISpatialLocatorPositionalTrackingDeactivatingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Canceled
   (
      This       : access ISpatialLocatorPositionalTrackingDeactivatingEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Canceled
   (
      This       : access ISpatialLocatorPositionalTrackingDeactivatingEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialLocatorAttachedFrameOfReference : aliased constant Windows.IID := (3782692598, 8015, 18844, (150, 37, 239, 94, 110, 215, 160, 72 ));
   
   type ISpatialLocatorAttachedFrameOfReference_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RelativePosition
   (
      This       : access ISpatialLocatorAttachedFrameOfReference_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function put_RelativePosition
   (
      This       : access ISpatialLocatorAttachedFrameOfReference_Interface
      ; value : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_RelativeOrientation
   (
      This       : access ISpatialLocatorAttachedFrameOfReference_Interface
      ; RetVal : access Windows.Foundation.Numerics.Quaternion
   )
   return Windows.HRESULT is abstract;
   
   function put_RelativeOrientation
   (
      This       : access ISpatialLocatorAttachedFrameOfReference_Interface
      ; value : Windows.Foundation.Numerics.Quaternion
   )
   return Windows.HRESULT is abstract;
   
   function AdjustHeading
   (
      This       : access ISpatialLocatorAttachedFrameOfReference_Interface
      ; headingOffsetInRadians : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function GetStationaryCoordinateSystemAtTimestamp
   (
      This       : access ISpatialLocatorAttachedFrameOfReference_Interface
      ; timestamp : Windows.Perception.IPerceptionTimestamp
      ; RetVal : access Windows.Perception.Spatial.ISpatialCoordinateSystem
   )
   return Windows.HRESULT is abstract;
   
   function TryGetRelativeHeadingAtTimestamp
   (
      This       : access ISpatialLocatorAttachedFrameOfReference_Interface
      ; timestamp : Windows.Perception.IPerceptionTimestamp
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialStationaryFrameOfReference : aliased constant Windows.IID := (165399737, 48376, 15999, (190, 126, 126, 220, 203, 177, 120, 168 ));
   
   type ISpatialStationaryFrameOfReference_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CoordinateSystem
   (
      This       : access ISpatialStationaryFrameOfReference_Interface
      ; RetVal : access Windows.Perception.Spatial.ISpatialCoordinateSystem
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialLocation : aliased constant Windows.IID := (495047325, 9377, 14293, (143, 161, 57, 180, 249, 173, 103, 226 ));
   
   type ISpatialLocation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access ISpatialLocation_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_Orientation
   (
      This       : access ISpatialLocation_Interface
      ; RetVal : access Windows.Foundation.Numerics.Quaternion
   )
   return Windows.HRESULT is abstract;
   
   function get_AbsoluteLinearVelocity
   (
      This       : access ISpatialLocation_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_AbsoluteLinearAcceleration
   (
      This       : access ISpatialLocation_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_AbsoluteAngularVelocity
   (
      This       : access ISpatialLocation_Interface
      ; RetVal : access Windows.Foundation.Numerics.Quaternion
   )
   return Windows.HRESULT is abstract;
   
   function get_AbsoluteAngularAcceleration
   (
      This       : access ISpatialLocation_Interface
      ; RetVal : access Windows.Foundation.Numerics.Quaternion
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialLocator : aliased constant Windows.IID := (4131883301, 40460, 15286, (153, 126, 182, 78, 204, 162, 76, 244 ));
   
   type ISpatialLocator_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Locatability
   (
      This       : access ISpatialLocator_Interface
      ; RetVal : access Windows.Perception.Spatial.SpatialLocatability
   )
   return Windows.HRESULT is abstract;
   
   function add_LocatabilityChanged
   (
      This       : access ISpatialLocator_Interface
      ; handler : TypedEventHandler_ISpatialLocator_add_LocatabilityChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LocatabilityChanged
   (
      This       : access ISpatialLocator_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PositionalTrackingDeactivating
   (
      This       : access ISpatialLocator_Interface
      ; handler : TypedEventHandler_ISpatialLocator_add_PositionalTrackingDeactivating
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PositionalTrackingDeactivating
   (
      This       : access ISpatialLocator_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function TryLocateAtTimestamp
   (
      This       : access ISpatialLocator_Interface
      ; timestamp : Windows.Perception.IPerceptionTimestamp
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; RetVal : access Windows.Perception.Spatial.ISpatialLocation
   )
   return Windows.HRESULT is abstract;
   
   function CreateAttachedFrameOfReferenceAtCurrentHeading
   (
      This       : access ISpatialLocator_Interface
      ; RetVal : access Windows.Perception.Spatial.ISpatialLocatorAttachedFrameOfReference
   )
   return Windows.HRESULT is abstract;
   
   function CreateAttachedFrameOfReferenceAtCurrentHeadingWithPosition
   (
      This       : access ISpatialLocator_Interface
      ; relativePosition : Windows.Foundation.Numerics.Vector3
      ; RetVal : access Windows.Perception.Spatial.ISpatialLocatorAttachedFrameOfReference
   )
   return Windows.HRESULT is abstract;
   
   function CreateAttachedFrameOfReferenceAtCurrentHeadingWithPositionAndOrientation
   (
      This       : access ISpatialLocator_Interface
      ; relativePosition : Windows.Foundation.Numerics.Vector3
      ; relativeOrientation : Windows.Foundation.Numerics.Quaternion
      ; RetVal : access Windows.Perception.Spatial.ISpatialLocatorAttachedFrameOfReference
   )
   return Windows.HRESULT is abstract;
   
   function CreateAttachedFrameOfReferenceAtCurrentHeadingWithPositionAndOrientationAndRelativeHeading
   (
      This       : access ISpatialLocator_Interface
      ; relativePosition : Windows.Foundation.Numerics.Vector3
      ; relativeOrientation : Windows.Foundation.Numerics.Quaternion
      ; relativeHeadingInRadians : Windows.Double
      ; RetVal : access Windows.Perception.Spatial.ISpatialLocatorAttachedFrameOfReference
   )
   return Windows.HRESULT is abstract;
   
   function CreateStationaryFrameOfReferenceAtCurrentLocation
   (
      This       : access ISpatialLocator_Interface
      ; RetVal : access Windows.Perception.Spatial.ISpatialStationaryFrameOfReference
   )
   return Windows.HRESULT is abstract;
   
   function CreateStationaryFrameOfReferenceAtCurrentLocationWithPosition
   (
      This       : access ISpatialLocator_Interface
      ; relativePosition : Windows.Foundation.Numerics.Vector3
      ; RetVal : access Windows.Perception.Spatial.ISpatialStationaryFrameOfReference
   )
   return Windows.HRESULT is abstract;
   
   function CreateStationaryFrameOfReferenceAtCurrentLocationWithPositionAndOrientation
   (
      This       : access ISpatialLocator_Interface
      ; relativePosition : Windows.Foundation.Numerics.Vector3
      ; relativeOrientation : Windows.Foundation.Numerics.Quaternion
      ; RetVal : access Windows.Perception.Spatial.ISpatialStationaryFrameOfReference
   )
   return Windows.HRESULT is abstract;
   
   function CreateStationaryFrameOfReferenceAtCurrentLocationWithPositionAndOrientationAndRelativeHeading
   (
      This       : access ISpatialLocator_Interface
      ; relativePosition : Windows.Foundation.Numerics.Vector3
      ; relativeOrientation : Windows.Foundation.Numerics.Quaternion
      ; relativeHeadingInRadians : Windows.Double
      ; RetVal : access Windows.Perception.Spatial.ISpatialStationaryFrameOfReference
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialLocatorStatics : aliased constant Windows.IID := (3077452608, 42946, 13851, (187, 130, 86, 233, 59, 137, 177, 187 ));
   
   type ISpatialLocatorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access ISpatialLocatorStatics_Interface
      ; RetVal : access Windows.Perception.Spatial.ISpatialLocator
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialBoundingVolume : aliased constant Windows.IID := (4213204442, 26819, 13279, (183, 175, 76, 120, 114, 7, 153, 156 ));
   
   type ISpatialBoundingVolume_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialBoundingVolumeStatics : aliased constant Windows.IID := (92836119, 46049, 14040, (176, 23, 86, 97, 129, 165, 177, 150 ));
   
   type ISpatialBoundingVolumeStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromBox
   (
      This       : access ISpatialBoundingVolumeStatics_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; box : Windows.Perception.Spatial.SpatialBoundingBox
      ; RetVal : access Windows.Perception.Spatial.ISpatialBoundingVolume
   )
   return Windows.HRESULT is abstract;
   
   function FromOrientedBox
   (
      This       : access ISpatialBoundingVolumeStatics_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; box : Windows.Perception.Spatial.SpatialBoundingOrientedBox
      ; RetVal : access Windows.Perception.Spatial.ISpatialBoundingVolume
   )
   return Windows.HRESULT is abstract;
   
   function FromSphere
   (
      This       : access ISpatialBoundingVolumeStatics_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; sphere : Windows.Perception.Spatial.SpatialBoundingSphere
      ; RetVal : access Windows.Perception.Spatial.ISpatialBoundingVolume
   )
   return Windows.HRESULT is abstract;
   
   function FromFrustum
   (
      This       : access ISpatialBoundingVolumeStatics_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; frustum : Windows.Perception.Spatial.SpatialBoundingFrustum
      ; RetVal : access Windows.Perception.Spatial.ISpatialBoundingVolume
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialStageFrameOfReference : aliased constant Windows.IID := (2055877732, 44301, 17808, (171, 134, 51, 6, 43, 103, 73, 38 ));
   
   type ISpatialStageFrameOfReference_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CoordinateSystem
   (
      This       : access ISpatialStageFrameOfReference_Interface
      ; RetVal : access Windows.Perception.Spatial.ISpatialCoordinateSystem
   )
   return Windows.HRESULT is abstract;
   
   function get_MovementRange
   (
      This       : access ISpatialStageFrameOfReference_Interface
      ; RetVal : access Windows.Perception.Spatial.SpatialMovementRange
   )
   return Windows.HRESULT is abstract;
   
   function get_LookDirectionRange
   (
      This       : access ISpatialStageFrameOfReference_Interface
      ; RetVal : access Windows.Perception.Spatial.SpatialLookDirectionRange
   )
   return Windows.HRESULT is abstract;
   
   function GetCoordinateSystemAtCurrentLocation
   (
      This       : access ISpatialStageFrameOfReference_Interface
      ; locator : Windows.Perception.Spatial.ISpatialLocator
      ; RetVal : access Windows.Perception.Spatial.ISpatialCoordinateSystem
   )
   return Windows.HRESULT is abstract;
   
   function TryGetMovementBounds
   (
      This       : access ISpatialStageFrameOfReference_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; RetVal : access Windows.Foundation.Numerics.Vector3_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialStageFrameOfReferenceStatics : aliased constant Windows.IID := (4153236557, 41124, 18844, (141, 145, 168, 201, 101, 212, 6, 84 ));
   
   type ISpatialStageFrameOfReferenceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access ISpatialStageFrameOfReferenceStatics_Interface
      ; RetVal : access Windows.Perception.Spatial.ISpatialStageFrameOfReference
   )
   return Windows.HRESULT is abstract;
   
   function add_CurrentChanged
   (
      This       : access ISpatialStageFrameOfReferenceStatics_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CurrentChanged
   (
      This       : access ISpatialStageFrameOfReferenceStatics_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function RequestNewStageAsync
   (
      This       : access ISpatialStageFrameOfReferenceStatics_Interface
      ; RetVal : access Windows.Perception.Spatial.IAsyncOperation_ISpatialStageFrameOfReference -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialEntity : aliased constant Windows.IID := (376301909, 57835, 17740, (186, 8, 230, 192, 102, 141, 220, 101 ));
   
   type ISpatialEntity_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access ISpatialEntity_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Anchor
   (
      This       : access ISpatialEntity_Interface
      ; RetVal : access Windows.Perception.Spatial.ISpatialAnchor
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access ISpatialEntity_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialEntityFactory : aliased constant Windows.IID := (3790725925, 13471, 16933, (162, 243, 75, 1, 193, 95, 224, 86 ));
   
   type ISpatialEntityFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithSpatialAnchor
   (
      This       : access ISpatialEntityFactory_Interface
      ; spatialAnchor : Windows.Perception.Spatial.ISpatialAnchor
      ; RetVal : access Windows.Perception.Spatial.ISpatialEntity
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithSpatialAnchorAndProperties
   (
      This       : access ISpatialEntityFactory_Interface
      ; spatialAnchor : Windows.Perception.Spatial.ISpatialAnchor
      ; propertySet : Windows.Foundation.Collections.IPropertySet
      ; RetVal : access Windows.Perception.Spatial.ISpatialEntity
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialEntityAddedEventArgs : aliased constant Windows.IID := (2744644763, 5482, 18183, (172, 44, 211, 29, 87, 14, 211, 153 ));
   
   type ISpatialEntityAddedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Entity
   (
      This       : access ISpatialEntityAddedEventArgs_Interface
      ; RetVal : access Windows.Perception.Spatial.ISpatialEntity
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialEntityUpdatedEventArgs : aliased constant Windows.IID := (3848738662, 25211, 17355, (164, 159, 179, 190, 109, 71, 222, 237 ));
   
   type ISpatialEntityUpdatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Entity
   (
      This       : access ISpatialEntityUpdatedEventArgs_Interface
      ; RetVal : access Windows.Perception.Spatial.ISpatialEntity
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialEntityRemovedEventArgs : aliased constant Windows.IID := (2440304640, 21357, 20127, (171, 246, 65, 91, 84, 68, 214, 81 ));
   
   type ISpatialEntityRemovedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Entity
   (
      This       : access ISpatialEntityRemovedEventArgs_Interface
      ; RetVal : access Windows.Perception.Spatial.ISpatialEntity
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialEntityWatcher : aliased constant Windows.IID := (3015204768, 27998, 19388, (128, 93, 95, 229, 185, 186, 25, 89 ));
   
   type ISpatialEntityWatcher_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access ISpatialEntityWatcher_Interface
      ; RetVal : access Windows.Perception.Spatial.SpatialEntityWatcherStatus
   )
   return Windows.HRESULT is abstract;
   
   function add_Added
   (
      This       : access ISpatialEntityWatcher_Interface
      ; handler : TypedEventHandler_ISpatialEntityWatcher_add_Added
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Added
   (
      This       : access ISpatialEntityWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Updated
   (
      This       : access ISpatialEntityWatcher_Interface
      ; handler : TypedEventHandler_ISpatialEntityWatcher_add_Updated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Updated
   (
      This       : access ISpatialEntityWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Removed
   (
      This       : access ISpatialEntityWatcher_Interface
      ; handler : TypedEventHandler_ISpatialEntityWatcher_add_Removed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Removed
   (
      This       : access ISpatialEntityWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_EnumerationCompleted
   (
      This       : access ISpatialEntityWatcher_Interface
      ; handler : TypedEventHandler_ISpatialEntityWatcher_add_EnumerationCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_EnumerationCompleted
   (
      This       : access ISpatialEntityWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access ISpatialEntityWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access ISpatialEntityWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialEntityStore : aliased constant Windows.IID := (848791738, 58643, 20230, (136, 157, 27, 227, 14, 207, 67, 230 ));
   
   type ISpatialEntityStore_Interface is interface and Windows.IInspectable_Interface;
   
   function SaveAsync
   (
      This       : access ISpatialEntityStore_Interface
      ; entity : Windows.Perception.Spatial.ISpatialEntity
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAsync
   (
      This       : access ISpatialEntityStore_Interface
      ; entity : Windows.Perception.Spatial.ISpatialEntity
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function CreateEntityWatcher
   (
      This       : access ISpatialEntityStore_Interface
      ; RetVal : access Windows.Perception.Spatial.ISpatialEntityWatcher
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialEntityStoreStatics : aliased constant Windows.IID := (1800091806, 31824, 20114, (138, 98, 77, 29, 75, 124, 205, 62 ));
   
   type ISpatialEntityStoreStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsSupported
   (
      This       : access ISpatialEntityStoreStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryGetForRemoteSystemSession
   (
      This       : access ISpatialEntityStoreStatics_Interface
      ; session : Windows.System.RemoteSystems.IRemoteSystemSession
      ; RetVal : access Windows.Perception.Spatial.ISpatialEntityStore
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IReference_SpatialBoundingBox : aliased constant Windows.IID := (2872210649, 39810, 21398, (187, 0, 215, 12, 83, 151, 150, 179 ));
   
   type IReference_SpatialBoundingBox_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_SpatialBoundingBox_Interface
      ; RetVal : access Windows.Perception.Spatial.SpatialBoundingBox
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ISpatialAnchorStore : aliased constant Windows.IID := (483417681, 5207, 20515, (143, 93, 254, 94, 90, 149, 52, 35 ));
   
   type IAsyncOperation_ISpatialAnchorStore_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISpatialAnchorStore_Interface
      ; handler : Windows.Perception.Spatial.AsyncOperationCompletedHandler_ISpatialAnchorStore
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISpatialAnchorStore_Interface
      ; RetVal : access Windows.Perception.Spatial.AsyncOperationCompletedHandler_ISpatialAnchorStore
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISpatialAnchorStore_Interface
      ; RetVal : access Windows.Perception.Spatial.ISpatialAnchorStore
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_SpatialPerceptionAccessStatus : aliased constant Windows.IID := (3022377254, 4201, 22079, (168, 99, 68, 163, 10, 143, 7, 29 ));
   
   type IAsyncOperation_SpatialPerceptionAccessStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_SpatialPerceptionAccessStatus_Interface
      ; handler : Windows.Perception.Spatial.AsyncOperationCompletedHandler_SpatialPerceptionAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_SpatialPerceptionAccessStatus_Interface
      ; RetVal : access Windows.Perception.Spatial.AsyncOperationCompletedHandler_SpatialPerceptionAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_SpatialPerceptionAccessStatus_Interface
      ; RetVal : access Windows.Perception.Spatial.SpatialPerceptionAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IReference_SpatialBoundingFrustum : aliased constant Windows.IID := (4097112782, 3126, 22345, (168, 160, 11, 182, 206, 120, 166, 20 ));
   
   type IReference_SpatialBoundingFrustum_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_SpatialBoundingFrustum_Interface
      ; RetVal : access Windows.Perception.Spatial.SpatialBoundingFrustum
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IReference_SpatialBoundingOrientedBox : aliased constant Windows.IID := (167281417, 40833, 20999, (189, 178, 171, 239, 146, 109, 177, 143 ));
   
   type IReference_SpatialBoundingOrientedBox_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_SpatialBoundingOrientedBox_Interface
      ; RetVal : access Windows.Perception.Spatial.SpatialBoundingOrientedBox
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ISpatialBoundingVolume : aliased constant Windows.IID := (3951265221, 1909, 21525, (143, 118, 50, 126, 110, 56, 138, 197 ));
   
   type IIterator_ISpatialBoundingVolume_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISpatialBoundingVolume_Interface
      ; RetVal : access Windows.Perception.Spatial.ISpatialBoundingVolume
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISpatialBoundingVolume_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISpatialBoundingVolume_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISpatialBoundingVolume_Interface
      ; items : Windows.Perception.Spatial.ISpatialBoundingVolume_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ISpatialBoundingVolume : aliased constant Windows.IID := (2313744878, 14890, 23401, (167, 134, 205, 220, 247, 69, 106, 58 ));
   
   type IIterable_ISpatialBoundingVolume_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISpatialBoundingVolume_Interface
      ; RetVal : access Windows.Perception.Spatial.IIterator_ISpatialBoundingVolume
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ISpatialStageFrameOfReference : aliased constant Windows.IID := (3034100159, 7526, 21592, (165, 223, 63, 79, 108, 54, 108, 88 ));
   
   type IAsyncOperation_ISpatialStageFrameOfReference_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISpatialStageFrameOfReference_Interface
      ; handler : Windows.Perception.Spatial.AsyncOperationCompletedHandler_ISpatialStageFrameOfReference
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISpatialStageFrameOfReference_Interface
      ; RetVal : access Windows.Perception.Spatial.AsyncOperationCompletedHandler_ISpatialStageFrameOfReference
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISpatialStageFrameOfReference_Interface
      ; RetVal : access Windows.Perception.Spatial.ISpatialStageFrameOfReference
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialAnchor_add_RawCoordinateSystemAdjusted : aliased constant Windows.IID := (4198758884, 13656, 22984, (154, 119, 110, 139, 118, 90, 220, 200 ));
   
   type TypedEventHandler_ISpatialAnchor_add_RawCoordinateSystemAdjusted_Interface(Callback : access procedure (sender : Windows.Perception.Spatial.ISpatialAnchor ; args : Windows.Perception.Spatial.ISpatialAnchorRawCoordinateSystemAdjustedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialAnchor_add_RawCoordinateSystemAdjusted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialAnchor_add_RawCoordinateSystemAdjusted_Interface
      ; sender : Windows.Perception.Spatial.ISpatialAnchor
      ; args : Windows.Perception.Spatial.ISpatialAnchorRawCoordinateSystemAdjustedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ISpatialAnchorStore : aliased constant Windows.IID := (2227313210, 890, 20543, (128, 6, 171, 87, 123, 127, 111, 102 ));
   
   type AsyncOperationCompletedHandler_ISpatialAnchorStore_Interface(Callback : access procedure (asyncInfo : Windows.Perception.Spatial.IAsyncOperation_ISpatialAnchorStore ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ISpatialAnchorStore'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISpatialAnchorStore_Interface
      ; asyncInfo : Windows.Perception.Spatial.IAsyncOperation_ISpatialAnchorStore
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_SpatialPerceptionAccessStatus : aliased constant Windows.IID := (1827493064, 30345, 21082, (128, 225, 149, 106, 157, 133, 205, 131 ));
   
   type AsyncOperationCompletedHandler_SpatialPerceptionAccessStatus_Interface(Callback : access procedure (asyncInfo : Windows.Perception.Spatial.IAsyncOperation_SpatialPerceptionAccessStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_SpatialPerceptionAccessStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_SpatialPerceptionAccessStatus_Interface
      ; asyncInfo : Windows.Perception.Spatial.IAsyncOperation_SpatialPerceptionAccessStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialLocator_add_LocatabilityChanged : aliased constant Windows.IID := (3685780149, 27456, 22011, (131, 211, 80, 213, 55, 58, 59, 32 ));
   
   type TypedEventHandler_ISpatialLocator_add_LocatabilityChanged_Interface(Callback : access procedure (sender : Windows.Perception.Spatial.ISpatialLocator ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialLocator_add_LocatabilityChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialLocator_add_LocatabilityChanged_Interface
      ; sender : Windows.Perception.Spatial.ISpatialLocator
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialLocator_add_PositionalTrackingDeactivating : aliased constant Windows.IID := (884941676, 58838, 20511, (134, 147, 188, 29, 141, 67, 29, 126 ));
   
   type TypedEventHandler_ISpatialLocator_add_PositionalTrackingDeactivating_Interface(Callback : access procedure (sender : Windows.Perception.Spatial.ISpatialLocator ; args : Windows.Perception.Spatial.ISpatialLocatorPositionalTrackingDeactivatingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialLocator_add_PositionalTrackingDeactivating'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialLocator_add_PositionalTrackingDeactivating_Interface
      ; sender : Windows.Perception.Spatial.ISpatialLocator
      ; args : Windows.Perception.Spatial.ISpatialLocatorPositionalTrackingDeactivatingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ISpatialStageFrameOfReference : aliased constant Windows.IID := (4223134203, 58522, 21729, (140, 131, 209, 168, 126, 77, 35, 4 ));
   
   type AsyncOperationCompletedHandler_ISpatialStageFrameOfReference_Interface(Callback : access procedure (asyncInfo : Windows.Perception.Spatial.IAsyncOperation_ISpatialStageFrameOfReference ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ISpatialStageFrameOfReference'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISpatialStageFrameOfReference_Interface
      ; asyncInfo : Windows.Perception.Spatial.IAsyncOperation_ISpatialStageFrameOfReference
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialEntityWatcher_add_Added : aliased constant Windows.IID := (4176326145, 27184, 21196, (181, 67, 138, 189, 178, 101, 41, 180 ));
   
   type TypedEventHandler_ISpatialEntityWatcher_add_Added_Interface(Callback : access procedure (sender : Windows.Perception.Spatial.ISpatialEntityWatcher ; args : Windows.Perception.Spatial.ISpatialEntityAddedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialEntityWatcher_add_Added'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialEntityWatcher_add_Added_Interface
      ; sender : Windows.Perception.Spatial.ISpatialEntityWatcher
      ; args : Windows.Perception.Spatial.ISpatialEntityAddedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialEntityWatcher_add_Updated : aliased constant Windows.IID := (2707411136, 35338, 23165, (137, 122, 242, 6, 204, 80, 145, 144 ));
   
   type TypedEventHandler_ISpatialEntityWatcher_add_Updated_Interface(Callback : access procedure (sender : Windows.Perception.Spatial.ISpatialEntityWatcher ; args : Windows.Perception.Spatial.ISpatialEntityUpdatedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialEntityWatcher_add_Updated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialEntityWatcher_add_Updated_Interface
      ; sender : Windows.Perception.Spatial.ISpatialEntityWatcher
      ; args : Windows.Perception.Spatial.ISpatialEntityUpdatedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialEntityWatcher_add_Removed : aliased constant Windows.IID := (922321581, 60066, 21091, (134, 30, 42, 207, 3, 12, 158, 23 ));
   
   type TypedEventHandler_ISpatialEntityWatcher_add_Removed_Interface(Callback : access procedure (sender : Windows.Perception.Spatial.ISpatialEntityWatcher ; args : Windows.Perception.Spatial.ISpatialEntityRemovedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialEntityWatcher_add_Removed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialEntityWatcher_add_Removed_Interface
      ; sender : Windows.Perception.Spatial.ISpatialEntityWatcher
      ; args : Windows.Perception.Spatial.ISpatialEntityRemovedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialEntityWatcher_add_EnumerationCompleted : aliased constant Windows.IID := (1343690787, 12457, 22840, (159, 59, 53, 141, 134, 22, 159, 46 ));
   
   type TypedEventHandler_ISpatialEntityWatcher_add_EnumerationCompleted_Interface(Callback : access procedure (sender : Windows.Perception.Spatial.ISpatialEntityWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialEntityWatcher_add_EnumerationCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialEntityWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.Perception.Spatial.ISpatialEntityWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SpatialCoordinateSystem is Windows.Perception.Spatial.ISpatialCoordinateSystem;
   subtype SpatialAnchor is Windows.Perception.Spatial.ISpatialAnchor;
   subtype SpatialAnchorRawCoordinateSystemAdjustedEventArgs is Windows.Perception.Spatial.ISpatialAnchorRawCoordinateSystemAdjustedEventArgs;
   subtype SpatialAnchorStore is Windows.Perception.Spatial.ISpatialAnchorStore;
   subtype SpatialLocator is Windows.Perception.Spatial.ISpatialLocator;
   subtype SpatialLocatorPositionalTrackingDeactivatingEventArgs is Windows.Perception.Spatial.ISpatialLocatorPositionalTrackingDeactivatingEventArgs;
   subtype SpatialLocation is Windows.Perception.Spatial.ISpatialLocation;
   subtype SpatialLocatorAttachedFrameOfReference is Windows.Perception.Spatial.ISpatialLocatorAttachedFrameOfReference;
   subtype SpatialStationaryFrameOfReference is Windows.Perception.Spatial.ISpatialStationaryFrameOfReference;
   subtype SpatialBoundingVolume is Windows.Perception.Spatial.ISpatialBoundingVolume;
   subtype SpatialStageFrameOfReference is Windows.Perception.Spatial.ISpatialStageFrameOfReference;
   subtype SpatialEntity is Windows.Perception.Spatial.ISpatialEntity;
   function CreateWithSpatialAnchor
   (
      spatialAnchor : Windows.Perception.Spatial.ISpatialAnchor
   )
   return Windows.Perception.Spatial.ISpatialEntity;
   
   function CreateWithSpatialAnchorAndProperties
   (
      spatialAnchor : Windows.Perception.Spatial.ISpatialAnchor
      ; propertySet : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.Perception.Spatial.ISpatialEntity;
   
   subtype SpatialEntityAddedEventArgs is Windows.Perception.Spatial.ISpatialEntityAddedEventArgs;
   subtype SpatialEntityUpdatedEventArgs is Windows.Perception.Spatial.ISpatialEntityUpdatedEventArgs;
   subtype SpatialEntityRemovedEventArgs is Windows.Perception.Spatial.ISpatialEntityRemovedEventArgs;
   subtype SpatialEntityWatcher is Windows.Perception.Spatial.ISpatialEntityWatcher;
   subtype SpatialEntityStore is Windows.Perception.Spatial.ISpatialEntityStore;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function TryCreateRelativeTo
   (
      coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
   )
   return Windows.Perception.Spatial.ISpatialAnchor;
   
   function TryCreateWithPositionRelativeTo
   (
      coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; position : Windows.Foundation.Numerics.Vector3
   )
   return Windows.Perception.Spatial.ISpatialAnchor;
   
   function TryCreateWithPositionAndOrientationRelativeTo
   (
      coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; position : Windows.Foundation.Numerics.Vector3
      ; orientation : Windows.Foundation.Numerics.Quaternion
   )
   return Windows.Perception.Spatial.ISpatialAnchor;
   
   function GetDefault
   return Windows.Perception.Spatial.ISpatialLocator;
   
   function RequestStoreAsync
   return Windows.Perception.Spatial.IAsyncOperation_ISpatialAnchorStore;
   
   function TryImportAnchorsAsync
   (
      stream : Windows.Storage.Streams.IInputStream
   )
   return Windows.Address;
   
   function TryExportAnchorsAsync
   (
      anchors : Windows.Address
      ; stream : Windows.Storage.Streams.IOutputStream
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function RequestAccessAsync
   return Windows.Perception.Spatial.IAsyncOperation_SpatialPerceptionAccessStatus;
   
   function FromBox
   (
      coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; box : Windows.Perception.Spatial.SpatialBoundingBox
   )
   return Windows.Perception.Spatial.ISpatialBoundingVolume;
   
   function FromOrientedBox
   (
      coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; box : Windows.Perception.Spatial.SpatialBoundingOrientedBox
   )
   return Windows.Perception.Spatial.ISpatialBoundingVolume;
   
   function FromSphere
   (
      coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; sphere : Windows.Perception.Spatial.SpatialBoundingSphere
   )
   return Windows.Perception.Spatial.ISpatialBoundingVolume;
   
   function FromFrustum
   (
      coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; frustum : Windows.Perception.Spatial.SpatialBoundingFrustum
   )
   return Windows.Perception.Spatial.ISpatialBoundingVolume;
   
   function get_Current
   return Windows.Perception.Spatial.ISpatialStageFrameOfReference;
   
   function add_CurrentChanged
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_CurrentChanged
   (
      cookie : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function RequestNewStageAsync
   return Windows.Perception.Spatial.IAsyncOperation_ISpatialStageFrameOfReference;
   
   function get_IsSupported
   return Windows.Boolean;
   
   function TryGetForRemoteSystemSession
   (
      session : Windows.System.RemoteSystems.IRemoteSystemSession
   )
   return Windows.Perception.Spatial.ISpatialEntityStore;
   
end;
