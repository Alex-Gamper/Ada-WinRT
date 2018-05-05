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
with Windows.Foundation.Collections;
limited with Windows.Storage.Streams;
with Windows; use Windows;
limited with Windows.Storage;
--------------------------------------------------------------------------------
package Windows.Media.Import is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PhotoImportStage is (
      NotStarted,
      FindingItems,
      ImportingItems,
      DeletingImportedItemsFromSource
   );
   for PhotoImportStage use (
      NotStarted => 0,
      FindingItems => 1,
      ImportingItems => 2,
      DeletingImportedItemsFromSource => 3
   );
   for PhotoImportStage'Size use 32;
   
   type PhotoImportStage_Ptr is access PhotoImportStage;
   
   type PhotoImportAccessMode is (
      ReadWrite,
      ReadOnly,
      ReadAndDelete
   );
   for PhotoImportAccessMode use (
      ReadWrite => 0,
      ReadOnly => 1,
      ReadAndDelete => 2
   );
   for PhotoImportAccessMode'Size use 32;
   
   type PhotoImportAccessMode_Ptr is access PhotoImportAccessMode;
   
   type PhotoImportImportMode is (
      ImportEverything,
      IgnoreSidecars,
      IgnoreSiblings,
      IgnoreSidecarsAndSiblings
   );
   for PhotoImportImportMode use (
      ImportEverything => 0,
      IgnoreSidecars => 1,
      IgnoreSiblings => 2,
      IgnoreSidecarsAndSiblings => 3
   );
   for PhotoImportImportMode'Size use 32;
   
   type PhotoImportImportMode_Ptr is access PhotoImportImportMode;
   
   type PhotoImportSourceType is (
      Generic_x,
      Camera,
      MediaPlayer,
      Phone,
      Video,
      PersonalInfoManager,
      AudioRecorder
   );
   for PhotoImportSourceType use (
      Generic_x => 0,
      Camera => 1,
      MediaPlayer => 2,
      Phone => 3,
      Video => 4,
      PersonalInfoManager => 5,
      AudioRecorder => 6
   );
   for PhotoImportSourceType'Size use 32;
   
   type PhotoImportSourceType_Ptr is access PhotoImportSourceType;
   
   type PhotoImportContentType is (
      Unknown,
      Image,
      Video
   );
   for PhotoImportContentType use (
      Unknown => 0,
      Image => 1,
      Video => 2
   );
   for PhotoImportContentType'Size use 32;
   
   type PhotoImportContentType_Ptr is access PhotoImportContentType;
   
   type PhotoImportPowerSource is (
      Unknown,
      Battery,
      External
   );
   for PhotoImportPowerSource use (
      Unknown => 0,
      Battery => 1,
      External => 2
   );
   for PhotoImportPowerSource'Size use 32;
   
   type PhotoImportPowerSource_Ptr is access PhotoImportPowerSource;
   
   type PhotoImportStorageMediumType is (
      Undefined,
      Fixed,
      Removable
   );
   for PhotoImportStorageMediumType use (
      Undefined => 0,
      Fixed => 1,
      Removable => 2
   );
   for PhotoImportStorageMediumType'Size use 32;
   
   type PhotoImportStorageMediumType_Ptr is access PhotoImportStorageMediumType;
   
   type PhotoImportContentTypeFilter is (
      OnlyImages,
      OnlyVideos,
      ImagesAndVideos
   );
   for PhotoImportContentTypeFilter use (
      OnlyImages => 0,
      OnlyVideos => 1,
      ImagesAndVideos => 2
   );
   for PhotoImportContentTypeFilter'Size use 32;
   
   type PhotoImportContentTypeFilter_Ptr is access PhotoImportContentTypeFilter;
   
   type PhotoImportItemSelectionMode is (
      SelectAll,
      SelectNone,
      SelectNew
   );
   for PhotoImportItemSelectionMode use (
      SelectAll => 0,
      SelectNone => 1,
      SelectNew => 2
   );
   for PhotoImportItemSelectionMode'Size use 32;
   
   type PhotoImportItemSelectionMode_Ptr is access PhotoImportItemSelectionMode;
   
   type PhotoImportSubfolderDateFormat is (
      Year,
      YearMonth,
      YearMonthDay
   );
   for PhotoImportSubfolderDateFormat use (
      Year => 0,
      YearMonth => 1,
      YearMonthDay => 2
   );
   for PhotoImportSubfolderDateFormat'Size use 32;
   
   type PhotoImportSubfolderDateFormat_Ptr is access PhotoImportSubfolderDateFormat;
   
   type PhotoImportConnectionTransport is (
      Unknown,
      Usb,
      IP,
      Bluetooth
   );
   for PhotoImportConnectionTransport use (
      Unknown => 0,
      Usb => 1,
      IP => 2,
      Bluetooth => 3
   );
   for PhotoImportConnectionTransport'Size use 32;
   
   type PhotoImportConnectionTransport_Ptr is access PhotoImportConnectionTransport;
   
   type PhotoImportSubfolderCreationMode is (
      DoNotCreateSubfolders,
      CreateSubfoldersFromFileDate,
      CreateSubfoldersFromExifDate,
      KeepOriginalFolderStructure
   );
   for PhotoImportSubfolderCreationMode use (
      DoNotCreateSubfolders => 0,
      CreateSubfoldersFromFileDate => 1,
      CreateSubfoldersFromExifDate => 2,
      KeepOriginalFolderStructure => 3
   );
   for PhotoImportSubfolderCreationMode'Size use 32;
   
   type PhotoImportSubfolderCreationMode_Ptr is access PhotoImportSubfolderCreationMode;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type PhotoImportProgress is record
      ItemsImported : Windows.UInt32;
      TotalItemsToImport : Windows.UInt32;
      BytesImported : Windows.UInt64;
      TotalBytesToImport : Windows.UInt64;
      ImportProgress : Windows.Double;
   end record;
   pragma Convention (C_Pass_By_Copy , PhotoImportProgress);
   
   type PhotoImportProgress_Ptr is access PhotoImportProgress;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IPhotoImportSource_Interface;
   type AsyncOperationCompletedHandler_IPhotoImportSource is access all AsyncOperationCompletedHandler_IPhotoImportSource_Interface'Class;
   type AsyncOperationCompletedHandler_IPhotoImportSource_Ptr is access all AsyncOperationCompletedHandler_IPhotoImportSource;
   type TypedEventHandler_IPhotoImportFindItemsResult_add_SelectionChanged_Interface;
   type TypedEventHandler_IPhotoImportFindItemsResult_add_SelectionChanged is access all TypedEventHandler_IPhotoImportFindItemsResult_add_SelectionChanged_Interface'Class;
   type TypedEventHandler_IPhotoImportFindItemsResult_add_SelectionChanged_Ptr is access all TypedEventHandler_IPhotoImportFindItemsResult_add_SelectionChanged;
   type TypedEventHandler_IPhotoImportFindItemsResult_add_ItemImported_Interface;
   type TypedEventHandler_IPhotoImportFindItemsResult_add_ItemImported is access all TypedEventHandler_IPhotoImportFindItemsResult_add_ItemImported_Interface'Class;
   type TypedEventHandler_IPhotoImportFindItemsResult_add_ItemImported_Ptr is access all TypedEventHandler_IPhotoImportFindItemsResult_add_ItemImported;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPhotoImportManagerStatics_Interface;
   type IPhotoImportManagerStatics is access all IPhotoImportManagerStatics_Interface'Class;
   type IPhotoImportManagerStatics_Ptr is access all IPhotoImportManagerStatics;
   type IPhotoImportOperation_Interface;
   type IPhotoImportOperation is access all IPhotoImportOperation_Interface'Class;
   type IPhotoImportOperation_Ptr is access all IPhotoImportOperation;
   type IPhotoImportStorageMedium_Interface;
   type IPhotoImportStorageMedium is access all IPhotoImportStorageMedium_Interface'Class;
   type IPhotoImportStorageMedium_Ptr is access all IPhotoImportStorageMedium;
   type IPhotoImportSourceStatics_Interface;
   type IPhotoImportSourceStatics is access all IPhotoImportSourceStatics_Interface'Class;
   type IPhotoImportSourceStatics_Ptr is access all IPhotoImportSourceStatics;
   type IPhotoImportSource_Interface;
   type IPhotoImportSource is access all IPhotoImportSource_Interface'Class;
   type IPhotoImportSource_Ptr is access all IPhotoImportSource;
   type IPhotoImportSession_Interface;
   type IPhotoImportSession is access all IPhotoImportSession_Interface'Class;
   type IPhotoImportSession_Ptr is access all IPhotoImportSession;
   type IPhotoImportSession2_Interface;
   type IPhotoImportSession2 is access all IPhotoImportSession2_Interface'Class;
   type IPhotoImportSession2_Ptr is access all IPhotoImportSession2;
   type IPhotoImportItem_Interface;
   type IPhotoImportItem is access all IPhotoImportItem_Interface'Class;
   type IPhotoImportItem_Ptr is access all IPhotoImportItem;
   type IPhotoImportFindItemsResult_Interface;
   type IPhotoImportFindItemsResult is access all IPhotoImportFindItemsResult_Interface'Class;
   type IPhotoImportFindItemsResult_Ptr is access all IPhotoImportFindItemsResult;
   type IPhotoImportFindItemsResult2_Interface;
   type IPhotoImportFindItemsResult2 is access all IPhotoImportFindItemsResult2_Interface'Class;
   type IPhotoImportFindItemsResult2_Ptr is access all IPhotoImportFindItemsResult2;
   type IPhotoImportImportItemsResult_Interface;
   type IPhotoImportImportItemsResult is access all IPhotoImportImportItemsResult_Interface'Class;
   type IPhotoImportImportItemsResult_Ptr is access all IPhotoImportImportItemsResult;
   type IPhotoImportDeleteImportedItemsFromSourceResult_Interface;
   type IPhotoImportDeleteImportedItemsFromSourceResult is access all IPhotoImportDeleteImportedItemsFromSourceResult_Interface'Class;
   type IPhotoImportDeleteImportedItemsFromSourceResult_Ptr is access all IPhotoImportDeleteImportedItemsFromSourceResult;
   type IPhotoImportSidecar_Interface;
   type IPhotoImportSidecar is access all IPhotoImportSidecar_Interface'Class;
   type IPhotoImportSidecar_Ptr is access all IPhotoImportSidecar;
   type IPhotoImportVideoSegment_Interface;
   type IPhotoImportVideoSegment is access all IPhotoImportVideoSegment_Interface'Class;
   type IPhotoImportVideoSegment_Ptr is access all IPhotoImportVideoSegment;
   type IPhotoImportItemImportedEventArgs_Interface;
   type IPhotoImportItemImportedEventArgs is access all IPhotoImportItemImportedEventArgs_Interface'Class;
   type IPhotoImportItemImportedEventArgs_Ptr is access all IPhotoImportItemImportedEventArgs;
   type IPhotoImportSelectionChangedEventArgs_Interface;
   type IPhotoImportSelectionChangedEventArgs is access all IPhotoImportSelectionChangedEventArgs_Interface'Class;
   type IPhotoImportSelectionChangedEventArgs_Ptr is access all IPhotoImportSelectionChangedEventArgs;
   type IIterator_IPhotoImportOperation_Interface;
   type IIterator_IPhotoImportOperation is access all IIterator_IPhotoImportOperation_Interface'Class;
   type IIterator_IPhotoImportOperation_Ptr is access all IIterator_IPhotoImportOperation;
   type IIterable_IPhotoImportOperation_Interface;
   type IIterable_IPhotoImportOperation is access all IIterable_IPhotoImportOperation_Interface'Class;
   type IIterable_IPhotoImportOperation_Ptr is access all IIterable_IPhotoImportOperation;
   type IVectorView_IPhotoImportOperation_Interface;
   type IVectorView_IPhotoImportOperation is access all IVectorView_IPhotoImportOperation_Interface'Class;
   type IVectorView_IPhotoImportOperation_Ptr is access all IVectorView_IPhotoImportOperation;
   type IAsyncOperation_IPhotoImportSource_Interface;
   type IAsyncOperation_IPhotoImportSource is access all IAsyncOperation_IPhotoImportSource_Interface'Class;
   type IAsyncOperation_IPhotoImportSource_Ptr is access all IAsyncOperation_IPhotoImportSource;
   type IIterator_IPhotoImportStorageMedium_Interface;
   type IIterator_IPhotoImportStorageMedium is access all IIterator_IPhotoImportStorageMedium_Interface'Class;
   type IIterator_IPhotoImportStorageMedium_Ptr is access all IIterator_IPhotoImportStorageMedium;
   type IIterable_IPhotoImportStorageMedium_Interface;
   type IIterable_IPhotoImportStorageMedium is access all IIterable_IPhotoImportStorageMedium_Interface'Class;
   type IIterable_IPhotoImportStorageMedium_Ptr is access all IIterable_IPhotoImportStorageMedium;
   type IVectorView_IPhotoImportStorageMedium_Interface;
   type IVectorView_IPhotoImportStorageMedium is access all IVectorView_IPhotoImportStorageMedium_Interface'Class;
   type IVectorView_IPhotoImportStorageMedium_Ptr is access all IVectorView_IPhotoImportStorageMedium;
   type IIterator_IPhotoImportSidecar_Interface;
   type IIterator_IPhotoImportSidecar is access all IIterator_IPhotoImportSidecar_Interface'Class;
   type IIterator_IPhotoImportSidecar_Ptr is access all IIterator_IPhotoImportSidecar;
   type IIterable_IPhotoImportSidecar_Interface;
   type IIterable_IPhotoImportSidecar is access all IIterable_IPhotoImportSidecar_Interface'Class;
   type IIterable_IPhotoImportSidecar_Ptr is access all IIterable_IPhotoImportSidecar;
   type IVectorView_IPhotoImportSidecar_Interface;
   type IVectorView_IPhotoImportSidecar is access all IVectorView_IPhotoImportSidecar_Interface'Class;
   type IVectorView_IPhotoImportSidecar_Ptr is access all IVectorView_IPhotoImportSidecar;
   type IIterator_IPhotoImportVideoSegment_Interface;
   type IIterator_IPhotoImportVideoSegment is access all IIterator_IPhotoImportVideoSegment_Interface'Class;
   type IIterator_IPhotoImportVideoSegment_Ptr is access all IIterator_IPhotoImportVideoSegment;
   type IIterable_IPhotoImportVideoSegment_Interface;
   type IIterable_IPhotoImportVideoSegment is access all IIterable_IPhotoImportVideoSegment_Interface'Class;
   type IIterable_IPhotoImportVideoSegment_Ptr is access all IIterable_IPhotoImportVideoSegment;
   type IVectorView_IPhotoImportVideoSegment_Interface;
   type IVectorView_IPhotoImportVideoSegment is access all IVectorView_IPhotoImportVideoSegment_Interface'Class;
   type IVectorView_IPhotoImportVideoSegment_Ptr is access all IVectorView_IPhotoImportVideoSegment;
   type IIterator_IPhotoImportItem_Interface;
   type IIterator_IPhotoImportItem is access all IIterator_IPhotoImportItem_Interface'Class;
   type IIterator_IPhotoImportItem_Ptr is access all IIterator_IPhotoImportItem;
   type IIterable_IPhotoImportItem_Interface;
   type IIterable_IPhotoImportItem is access all IIterable_IPhotoImportItem_Interface'Class;
   type IIterable_IPhotoImportItem_Ptr is access all IIterable_IPhotoImportItem;
   type IVectorView_IPhotoImportItem_Interface;
   type IVectorView_IPhotoImportItem is access all IVectorView_IPhotoImportItem_Interface'Class;
   type IVectorView_IPhotoImportItem_Ptr is access all IVectorView_IPhotoImportItem;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IPhotoImportManagerStatics : aliased constant Windows.IID := (661753917, 41030, 20230, (155, 156, 191, 214, 98, 232, 50, 135 ));
   
   type IPhotoImportManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function IsSupportedAsync
   (
      This       : access IPhotoImportManagerStatics_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAllSourcesAsync
   (
      This       : access IPhotoImportManagerStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetPendingOperations
   (
      This       : access IPhotoImportManagerStatics_Interface
      ; RetVal : access Windows.Media.Import.IVectorView_IPhotoImportOperation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPhotoImportOperation : aliased constant Windows.IID := (3656882148, 41114, 20196, (164, 177, 32, 148, 2, 119, 165, 190 ));
   
   type IPhotoImportOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Stage
   (
      This       : access IPhotoImportOperation_Interface
      ; RetVal : access Windows.Media.Import.PhotoImportStage
   )
   return Windows.HRESULT is abstract;
   
   function get_Session
   (
      This       : access IPhotoImportOperation_Interface
      ; RetVal : access Windows.Media.Import.IPhotoImportSession
   )
   return Windows.HRESULT is abstract;
   
   function get_ContinueFindingItemsAsync
   (
      This       : access IPhotoImportOperation_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ContinueImportingItemsAsync
   (
      This       : access IPhotoImportOperation_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ContinueDeletingImportedItemsFromSourceAsync
   (
      This       : access IPhotoImportOperation_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPhotoImportStorageMedium : aliased constant Windows.IID := (4072255635, 64645, 18559, (135, 194, 88, 214, 117, 208, 91, 7 ));
   
   type IPhotoImportStorageMedium_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IPhotoImportStorageMedium_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IPhotoImportStorageMedium_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SerialNumber
   (
      This       : access IPhotoImportStorageMedium_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_StorageMediumType
   (
      This       : access IPhotoImportStorageMedium_Interface
      ; RetVal : access Windows.Media.Import.PhotoImportStorageMediumType
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedAccessMode
   (
      This       : access IPhotoImportStorageMedium_Interface
      ; RetVal : access Windows.Media.Import.PhotoImportAccessMode
   )
   return Windows.HRESULT is abstract;
   
   function get_CapacityInBytes
   (
      This       : access IPhotoImportStorageMedium_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_AvailableSpaceInBytes
   (
      This       : access IPhotoImportStorageMedium_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function Refresh
   (
      This       : access IPhotoImportStorageMedium_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPhotoImportSourceStatics : aliased constant Windows.IID := (86566278, 13016, 18044, (140, 238, 35, 161, 178, 244, 62, 133 ));
   
   type IPhotoImportSourceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromIdAsync
   (
      This       : access IPhotoImportSourceStatics_Interface
      ; sourceId : Windows.String
      ; RetVal : access Windows.Media.Import.IAsyncOperation_IPhotoImportSource -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FromFolderAsync
   (
      This       : access IPhotoImportSourceStatics_Interface
      ; sourceRootFolder : Windows.Storage.IStorageFolder
      ; RetVal : access Windows.Media.Import.IAsyncOperation_IPhotoImportSource -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPhotoImportSource : aliased constant Windows.IID := (529441630, 5211, 19670, (135, 241, 84, 150, 90, 152, 47, 239 ));
   
   type IPhotoImportSource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IPhotoImportSource_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IPhotoImportSource_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IPhotoImportSource_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Manufacturer
   (
      This       : access IPhotoImportSource_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Model
   (
      This       : access IPhotoImportSource_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SerialNumber
   (
      This       : access IPhotoImportSource_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ConnectionProtocol
   (
      This       : access IPhotoImportSource_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ConnectionTransport
   (
      This       : access IPhotoImportSource_Interface
      ; RetVal : access Windows.Media.Import.PhotoImportConnectionTransport
   )
   return Windows.HRESULT is abstract;
   
   function get_Type
   (
      This       : access IPhotoImportSource_Interface
      ; RetVal : access Windows.Media.Import.PhotoImportSourceType
   )
   return Windows.HRESULT is abstract;
   
   function get_PowerSource
   (
      This       : access IPhotoImportSource_Interface
      ; RetVal : access Windows.Media.Import.PhotoImportPowerSource
   )
   return Windows.HRESULT is abstract;
   
   function get_BatteryLevelPercent
   (
      This       : access IPhotoImportSource_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DateTime
   (
      This       : access IPhotoImportSource_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_StorageMedia
   (
      This       : access IPhotoImportSource_Interface
      ; RetVal : access Windows.Media.Import.IVectorView_IPhotoImportStorageMedium -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IsLocked
   (
      This       : access IPhotoImportSource_Interface
      ; RetVal : access Windows.Foundation.IReference_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IsMassStorage
   (
      This       : access IPhotoImportSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Thumbnail
   (
      This       : access IPhotoImportSource_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function CreateImportSession
   (
      This       : access IPhotoImportSource_Interface
      ; RetVal : access Windows.Media.Import.IPhotoImportSession
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPhotoImportSession : aliased constant Windows.IID := (2858652014, 60635, 20222, (148, 198, 95, 92, 175, 227, 76, 251 ));
   
   type IPhotoImportSession_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Source
   (
      This       : access IPhotoImportSession_Interface
      ; RetVal : access Windows.Media.Import.IPhotoImportSource
   )
   return Windows.HRESULT is abstract;
   
   function get_SessionId
   (
      This       : access IPhotoImportSession_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function put_DestinationFolder
   (
      This       : access IPhotoImportSession_Interface
      ; value : Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function get_DestinationFolder
   (
      This       : access IPhotoImportSession_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function put_AppendSessionDateToDestinationFolder
   (
      This       : access IPhotoImportSession_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AppendSessionDateToDestinationFolder
   (
      This       : access IPhotoImportSession_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_SubfolderCreationMode
   (
      This       : access IPhotoImportSession_Interface
      ; value : Windows.Media.Import.PhotoImportSubfolderCreationMode
   )
   return Windows.HRESULT is abstract;
   
   function get_SubfolderCreationMode
   (
      This       : access IPhotoImportSession_Interface
      ; RetVal : access Windows.Media.Import.PhotoImportSubfolderCreationMode
   )
   return Windows.HRESULT is abstract;
   
   function put_DestinationFileNamePrefix
   (
      This       : access IPhotoImportSession_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DestinationFileNamePrefix
   (
      This       : access IPhotoImportSession_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FindItemsAsync
   (
      This       : access IPhotoImportSession_Interface
      ; contentTypeFilter : Windows.Media.Import.PhotoImportContentTypeFilter
      ; itemSelectionMode : Windows.Media.Import.PhotoImportItemSelectionMode
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPhotoImportSession2 : aliased constant Windows.IID := (710043408, 16070, 18077, (163, 117, 43, 159, 71, 133, 57, 30 ));
   
   type IPhotoImportSession2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_SubfolderDateFormat
   (
      This       : access IPhotoImportSession2_Interface
      ; value : Windows.Media.Import.PhotoImportSubfolderDateFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_SubfolderDateFormat
   (
      This       : access IPhotoImportSession2_Interface
      ; RetVal : access Windows.Media.Import.PhotoImportSubfolderDateFormat
   )
   return Windows.HRESULT is abstract;
   
   function put_RememberDeselectedItems
   (
      This       : access IPhotoImportSession2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_RememberDeselectedItems
   (
      This       : access IPhotoImportSession2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPhotoImportItem : aliased constant Windows.IID := (2849013366, 39932, 17336, (179, 86, 99, 59, 106, 152, 140, 158 ));
   
   type IPhotoImportItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IPhotoImportItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemKey
   (
      This       : access IPhotoImportItem_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentType
   (
      This       : access IPhotoImportItem_Interface
      ; RetVal : access Windows.Media.Import.PhotoImportContentType
   )
   return Windows.HRESULT is abstract;
   
   function get_SizeInBytes
   (
      This       : access IPhotoImportItem_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_Date
   (
      This       : access IPhotoImportItem_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Sibling
   (
      This       : access IPhotoImportItem_Interface
      ; RetVal : access Windows.Media.Import.IPhotoImportSidecar
   )
   return Windows.HRESULT is abstract;
   
   function get_Sidecars
   (
      This       : access IPhotoImportItem_Interface
      ; RetVal : access Windows.Media.Import.IVectorView_IPhotoImportSidecar -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoSegments
   (
      This       : access IPhotoImportItem_Interface
      ; RetVal : access Windows.Media.Import.IVectorView_IPhotoImportVideoSegment -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSelected
   (
      This       : access IPhotoImportItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsSelected
   (
      This       : access IPhotoImportItem_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Thumbnail
   (
      This       : access IPhotoImportItem_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_ImportedFileNames
   (
      This       : access IPhotoImportItem_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DeletedFileNames
   (
      This       : access IPhotoImportItem_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPhotoImportFindItemsResult : aliased constant Windows.IID := (957736519, 27768, 18731, (132, 78, 143, 229, 232, 246, 191, 185 ));
   
   type IPhotoImportFindItemsResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Session
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.Media.Import.IPhotoImportSession
   )
   return Windows.HRESULT is abstract;
   
   function get_HasSucceeded
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_FoundItems
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.Media.Import.IVectorView_IPhotoImportItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PhotosCount
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_PhotosSizeInBytes
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_VideosCount
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_VideosSizeInBytes
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_SidecarsCount
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_SidecarsSizeInBytes
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_SiblingsCount
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_SiblingsSizeInBytes
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_TotalCount
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_TotalSizeInBytes
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function SelectAll
   (
      This       : access IPhotoImportFindItemsResult_Interface
   )
   return Windows.HRESULT is abstract;
   
   function SelectNone
   (
      This       : access IPhotoImportFindItemsResult_Interface
   )
   return Windows.HRESULT is abstract;
   
   function SelectNewAsync
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SetImportMode
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; value : Windows.Media.Import.PhotoImportImportMode
   )
   return Windows.HRESULT is abstract;
   
   function get_ImportMode
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.Media.Import.PhotoImportImportMode
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedPhotosCount
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedPhotosSizeInBytes
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedVideosCount
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedVideosSizeInBytes
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedSidecarsCount
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedSidecarsSizeInBytes
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedSiblingsCount
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedSiblingsSizeInBytes
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedTotalCount
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedTotalSizeInBytes
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function add_SelectionChanged
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; value : TypedEventHandler_IPhotoImportFindItemsResult_add_SelectionChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SelectionChanged
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function ImportItemsAsync
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_ItemImported
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; value : TypedEventHandler_IPhotoImportFindItemsResult_add_ItemImported
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ItemImported
   (
      This       : access IPhotoImportFindItemsResult_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPhotoImportFindItemsResult2 : aliased constant Windows.IID := (4225591867, 60665, 16490, (129, 94, 80, 21, 98, 91, 10, 136 ));
   
   type IPhotoImportFindItemsResult2_Interface is interface and Windows.IInspectable_Interface;
   
   function AddItemsInDateRangeToSelection
   (
      This       : access IPhotoImportFindItemsResult2_Interface
      ; rangeStart : Windows.Foundation.DateTime
      ; rangeLength : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPhotoImportImportItemsResult : aliased constant Windows.IID := (3839161464, 54297, 17475, (168, 78, 240, 106, 133, 12, 11, 0 ));
   
   type IPhotoImportImportItemsResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Session
   (
      This       : access IPhotoImportImportItemsResult_Interface
      ; RetVal : access Windows.Media.Import.IPhotoImportSession
   )
   return Windows.HRESULT is abstract;
   
   function get_HasSucceeded
   (
      This       : access IPhotoImportImportItemsResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ImportedItems
   (
      This       : access IPhotoImportImportItemsResult_Interface
      ; RetVal : access Windows.Media.Import.IVectorView_IPhotoImportItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PhotosCount
   (
      This       : access IPhotoImportImportItemsResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_PhotosSizeInBytes
   (
      This       : access IPhotoImportImportItemsResult_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_VideosCount
   (
      This       : access IPhotoImportImportItemsResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_VideosSizeInBytes
   (
      This       : access IPhotoImportImportItemsResult_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_SidecarsCount
   (
      This       : access IPhotoImportImportItemsResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_SidecarsSizeInBytes
   (
      This       : access IPhotoImportImportItemsResult_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_SiblingsCount
   (
      This       : access IPhotoImportImportItemsResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_SiblingsSizeInBytes
   (
      This       : access IPhotoImportImportItemsResult_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_TotalCount
   (
      This       : access IPhotoImportImportItemsResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_TotalSizeInBytes
   (
      This       : access IPhotoImportImportItemsResult_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function DeleteImportedItemsFromSourceAsync
   (
      This       : access IPhotoImportImportItemsResult_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPhotoImportDeleteImportedItemsFromSourceResult : aliased constant Windows.IID := (4108391160, 33853, 17034, (161, 166, 129, 81, 2, 146, 176, 174 ));
   
   type IPhotoImportDeleteImportedItemsFromSourceResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Session
   (
      This       : access IPhotoImportDeleteImportedItemsFromSourceResult_Interface
      ; RetVal : access Windows.Media.Import.IPhotoImportSession
   )
   return Windows.HRESULT is abstract;
   
   function get_HasSucceeded
   (
      This       : access IPhotoImportDeleteImportedItemsFromSourceResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DeletedItems
   (
      This       : access IPhotoImportDeleteImportedItemsFromSourceResult_Interface
      ; RetVal : access Windows.Media.Import.IVectorView_IPhotoImportItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PhotosCount
   (
      This       : access IPhotoImportDeleteImportedItemsFromSourceResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_PhotosSizeInBytes
   (
      This       : access IPhotoImportDeleteImportedItemsFromSourceResult_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_VideosCount
   (
      This       : access IPhotoImportDeleteImportedItemsFromSourceResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_VideosSizeInBytes
   (
      This       : access IPhotoImportDeleteImportedItemsFromSourceResult_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_SidecarsCount
   (
      This       : access IPhotoImportDeleteImportedItemsFromSourceResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_SidecarsSizeInBytes
   (
      This       : access IPhotoImportDeleteImportedItemsFromSourceResult_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_SiblingsCount
   (
      This       : access IPhotoImportDeleteImportedItemsFromSourceResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_SiblingsSizeInBytes
   (
      This       : access IPhotoImportDeleteImportedItemsFromSourceResult_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_TotalCount
   (
      This       : access IPhotoImportDeleteImportedItemsFromSourceResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_TotalSizeInBytes
   (
      This       : access IPhotoImportDeleteImportedItemsFromSourceResult_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPhotoImportSidecar : aliased constant Windows.IID := (1188550487, 63490, 17607, (156, 152, 122, 113, 244, 188, 20, 134 ));
   
   type IPhotoImportSidecar_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IPhotoImportSidecar_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SizeInBytes
   (
      This       : access IPhotoImportSidecar_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_Date
   (
      This       : access IPhotoImportSidecar_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPhotoImportVideoSegment : aliased constant Windows.IID := (1648099977, 12826, 16856, (145, 102, 140, 98, 163, 51, 39, 108 ));
   
   type IPhotoImportVideoSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IPhotoImportVideoSegment_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SizeInBytes
   (
      This       : access IPhotoImportVideoSegment_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_Date
   (
      This       : access IPhotoImportVideoSegment_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Sibling
   (
      This       : access IPhotoImportVideoSegment_Interface
      ; RetVal : access Windows.Media.Import.IPhotoImportSidecar
   )
   return Windows.HRESULT is abstract;
   
   function get_Sidecars
   (
      This       : access IPhotoImportVideoSegment_Interface
      ; RetVal : access Windows.Media.Import.IVectorView_IPhotoImportSidecar -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPhotoImportItemImportedEventArgs : aliased constant Windows.IID := (1120612317, 32104, 18357, (188, 124, 206, 183, 62, 12, 119, 220 ));
   
   type IPhotoImportItemImportedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ImportedItem
   (
      This       : access IPhotoImportItemImportedEventArgs_Interface
      ; RetVal : access Windows.Media.Import.IPhotoImportItem
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPhotoImportSelectionChangedEventArgs : aliased constant Windows.IID := (273028994, 64157, 19504, (139, 201, 77, 100, 145, 21, 114, 213 ));
   
   type IPhotoImportSelectionChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsSelectionEmpty
   (
      This       : access IPhotoImportSelectionChangedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPhotoImportOperation : aliased constant Windows.IID := (2090720794, 43169, 22871, (142, 13, 196, 1, 209, 156, 146, 55 ));
   
   type IIterator_IPhotoImportOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPhotoImportOperation_Interface
      ; RetVal : access Windows.Media.Import.IPhotoImportOperation
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPhotoImportOperation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPhotoImportOperation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPhotoImportOperation_Interface
      ; items : Windows.Media.Import.IPhotoImportOperation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPhotoImportOperation : aliased constant Windows.IID := (2498968207, 4442, 20683, (181, 157, 171, 132, 131, 168, 72, 66 ));
   
   type IIterable_IPhotoImportOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPhotoImportOperation_Interface
      ; RetVal : access Windows.Media.Import.IIterator_IPhotoImportOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPhotoImportOperation : aliased constant Windows.IID := (2779805704, 32024, 21248, (159, 1, 29, 133, 20, 149, 70, 210 ));
   
   type IVectorView_IPhotoImportOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPhotoImportOperation_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Import.IPhotoImportOperation
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPhotoImportOperation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPhotoImportOperation_Interface
      ; value : Windows.Media.Import.IPhotoImportOperation
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPhotoImportOperation_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Import.IPhotoImportOperation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IPhotoImportSource : aliased constant Windows.IID := (3368410142, 60231, 20664, (181, 217, 170, 254, 26, 130, 49, 138 ));
   
   type IAsyncOperation_IPhotoImportSource_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPhotoImportSource_Interface
      ; handler : Windows.Media.Import.AsyncOperationCompletedHandler_IPhotoImportSource
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPhotoImportSource_Interface
      ; RetVal : access Windows.Media.Import.AsyncOperationCompletedHandler_IPhotoImportSource
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPhotoImportSource_Interface
      ; RetVal : access Windows.Media.Import.IPhotoImportSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPhotoImportStorageMedium : aliased constant Windows.IID := (2556213576, 38761, 21980, (133, 217, 18, 90, 93, 3, 214, 187 ));
   
   type IIterator_IPhotoImportStorageMedium_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPhotoImportStorageMedium_Interface
      ; RetVal : access Windows.Media.Import.IPhotoImportStorageMedium
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPhotoImportStorageMedium_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPhotoImportStorageMedium_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPhotoImportStorageMedium_Interface
      ; items : Windows.Media.Import.IPhotoImportStorageMedium_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPhotoImportStorageMedium : aliased constant Windows.IID := (842255358, 63982, 22031, (189, 15, 227, 106, 190, 108, 218, 127 ));
   
   type IIterable_IPhotoImportStorageMedium_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPhotoImportStorageMedium_Interface
      ; RetVal : access Windows.Media.Import.IIterator_IPhotoImportStorageMedium
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPhotoImportStorageMedium : aliased constant Windows.IID := (894014521, 57406, 22289, (169, 85, 247, 196, 89, 40, 188, 144 ));
   
   type IVectorView_IPhotoImportStorageMedium_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPhotoImportStorageMedium_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Import.IPhotoImportStorageMedium
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPhotoImportStorageMedium_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPhotoImportStorageMedium_Interface
      ; value : Windows.Media.Import.IPhotoImportStorageMedium
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPhotoImportStorageMedium_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Import.IPhotoImportStorageMedium_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPhotoImportSidecar : aliased constant Windows.IID := (2935352304, 4963, 22842, (134, 213, 249, 43, 194, 48, 191, 214 ));
   
   type IIterator_IPhotoImportSidecar_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPhotoImportSidecar_Interface
      ; RetVal : access Windows.Media.Import.IPhotoImportSidecar
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPhotoImportSidecar_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPhotoImportSidecar_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPhotoImportSidecar_Interface
      ; items : Windows.Media.Import.IPhotoImportSidecar_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPhotoImportSidecar : aliased constant Windows.IID := (729780909, 58774, 22121, (182, 34, 251, 251, 199, 4, 14, 137 ));
   
   type IIterable_IPhotoImportSidecar_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPhotoImportSidecar_Interface
      ; RetVal : access Windows.Media.Import.IIterator_IPhotoImportSidecar
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPhotoImportSidecar : aliased constant Windows.IID := (2801416894, 52665, 20564, (191, 61, 82, 86, 7, 249, 194, 210 ));
   
   type IVectorView_IPhotoImportSidecar_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPhotoImportSidecar_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Import.IPhotoImportSidecar
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPhotoImportSidecar_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPhotoImportSidecar_Interface
      ; value : Windows.Media.Import.IPhotoImportSidecar
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPhotoImportSidecar_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Import.IPhotoImportSidecar_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPhotoImportVideoSegment : aliased constant Windows.IID := (3301010037, 13072, 23225, (147, 7, 120, 117, 90, 177, 9, 77 ));
   
   type IIterator_IPhotoImportVideoSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPhotoImportVideoSegment_Interface
      ; RetVal : access Windows.Media.Import.IPhotoImportVideoSegment
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPhotoImportVideoSegment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPhotoImportVideoSegment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPhotoImportVideoSegment_Interface
      ; items : Windows.Media.Import.IPhotoImportVideoSegment_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPhotoImportVideoSegment : aliased constant Windows.IID := (2497526596, 55811, 23929, (187, 251, 27, 234, 242, 237, 228, 130 ));
   
   type IIterable_IPhotoImportVideoSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPhotoImportVideoSegment_Interface
      ; RetVal : access Windows.Media.Import.IIterator_IPhotoImportVideoSegment
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPhotoImportVideoSegment : aliased constant Windows.IID := (3679753165, 26901, 22146, (141, 213, 29, 225, 68, 236, 89, 157 ));
   
   type IVectorView_IPhotoImportVideoSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPhotoImportVideoSegment_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Import.IPhotoImportVideoSegment
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPhotoImportVideoSegment_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPhotoImportVideoSegment_Interface
      ; value : Windows.Media.Import.IPhotoImportVideoSegment
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPhotoImportVideoSegment_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Import.IPhotoImportVideoSegment_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPhotoImportItem : aliased constant Windows.IID := (3494731880, 46499, 20622, (188, 107, 29, 205, 252, 251, 13, 8 ));
   
   type IIterator_IPhotoImportItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPhotoImportItem_Interface
      ; RetVal : access Windows.Media.Import.IPhotoImportItem
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPhotoImportItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPhotoImportItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPhotoImportItem_Interface
      ; items : Windows.Media.Import.IPhotoImportItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPhotoImportItem : aliased constant Windows.IID := (2184475779, 15221, 24213, (187, 164, 171, 192, 184, 163, 32, 170 ));
   
   type IIterable_IPhotoImportItem_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPhotoImportItem_Interface
      ; RetVal : access Windows.Media.Import.IIterator_IPhotoImportItem
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPhotoImportItem : aliased constant Windows.IID := (2593171534, 37451, 22649, (136, 247, 187, 47, 123, 19, 24, 152 ));
   
   type IVectorView_IPhotoImportItem_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPhotoImportItem_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Import.IPhotoImportItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPhotoImportItem_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPhotoImportItem_Interface
      ; value : Windows.Media.Import.IPhotoImportItem
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPhotoImportItem_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Import.IPhotoImportItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IPhotoImportSource : aliased constant Windows.IID := (3694703146, 34606, 21496, (142, 151, 69, 237, 133, 223, 13, 35 ));
   
   type AsyncOperationCompletedHandler_IPhotoImportSource_Interface(Callback : access procedure (asyncInfo : Windows.Media.Import.IAsyncOperation_IPhotoImportSource ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IPhotoImportSource'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPhotoImportSource_Interface
      ; asyncInfo : Windows.Media.Import.IAsyncOperation_IPhotoImportSource
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPhotoImportFindItemsResult_add_SelectionChanged : aliased constant Windows.IID := (3866262014, 26927, 22018, (130, 11, 134, 80, 152, 217, 180, 62 ));
   
   type TypedEventHandler_IPhotoImportFindItemsResult_add_SelectionChanged_Interface(Callback : access procedure (sender : Windows.Media.Import.IPhotoImportFindItemsResult ; args : Windows.Media.Import.IPhotoImportSelectionChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPhotoImportFindItemsResult_add_SelectionChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPhotoImportFindItemsResult_add_SelectionChanged_Interface
      ; sender : Windows.Media.Import.IPhotoImportFindItemsResult
      ; args : Windows.Media.Import.IPhotoImportSelectionChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPhotoImportFindItemsResult_add_ItemImported : aliased constant Windows.IID := (2748115277, 62062, 22745, (129, 56, 89, 154, 214, 60, 112, 105 ));
   
   type TypedEventHandler_IPhotoImportFindItemsResult_add_ItemImported_Interface(Callback : access procedure (sender : Windows.Media.Import.IPhotoImportFindItemsResult ; args : Windows.Media.Import.IPhotoImportItemImportedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPhotoImportFindItemsResult_add_ItemImported'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPhotoImportFindItemsResult_add_ItemImported_Interface
      ; sender : Windows.Media.Import.IPhotoImportFindItemsResult
      ; args : Windows.Media.Import.IPhotoImportItemImportedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PhotoImportSource is Windows.Media.Import.IPhotoImportSource;
   subtype PhotoImportOperation is Windows.Media.Import.IPhotoImportOperation;
   subtype PhotoImportSession is Windows.Media.Import.IPhotoImportSession;
   subtype PhotoImportFindItemsResult is Windows.Media.Import.IPhotoImportFindItemsResult;
   subtype PhotoImportImportItemsResult is Windows.Media.Import.IPhotoImportImportItemsResult;
   subtype PhotoImportDeleteImportedItemsFromSourceResult is Windows.Media.Import.IPhotoImportDeleteImportedItemsFromSourceResult;
   subtype PhotoImportStorageMedium is Windows.Media.Import.IPhotoImportStorageMedium;
   subtype PhotoImportSidecar is Windows.Media.Import.IPhotoImportSidecar;
   subtype PhotoImportVideoSegment is Windows.Media.Import.IPhotoImportVideoSegment;
   subtype PhotoImportItem is Windows.Media.Import.IPhotoImportItem;
   subtype PhotoImportSelectionChangedEventArgs is Windows.Media.Import.IPhotoImportSelectionChangedEventArgs;
   subtype PhotoImportItemImportedEventArgs is Windows.Media.Import.IPhotoImportItemImportedEventArgs;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function FromIdAsync
   (
      sourceId : Windows.String
   )
   return Windows.Media.Import.IAsyncOperation_IPhotoImportSource;
   
   function FromFolderAsync
   (
      sourceRootFolder : Windows.Storage.IStorageFolder
   )
   return Windows.Media.Import.IAsyncOperation_IPhotoImportSource;
   
   function IsSupportedAsync
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function FindAllSourcesAsync
   return Windows.Address;
   
   function GetPendingOperations
   return Windows.Media.Import.IVectorView_IPhotoImportOperation;
   
end;
