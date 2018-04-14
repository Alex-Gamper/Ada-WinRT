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
with Windows.Foundation.Collections;
with Windows.Foundation;
package Windows.Storage.Pickers is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PickerViewMode is (
      List,
      Thumbnail
   );
   for PickerViewMode use (
      List => 0,
      Thumbnail => 1
   );
   for PickerViewMode'Size use 32;
   
   type PickerViewMode_Ptr is access PickerViewMode;
   
   type PickerLocationId is (
      DocumentsLibrary,
      ComputerFolder,
      Desktop,
      Downloads,
      HomeGroup,
      MusicLibrary,
      PicturesLibrary,
      VideosLibrary,
      Objects3D,
      Unspecified
   );
   for PickerLocationId use (
      DocumentsLibrary => 0,
      ComputerFolder => 1,
      Desktop => 2,
      Downloads => 3,
      HomeGroup => 4,
      MusicLibrary => 5,
      PicturesLibrary => 6,
      VideosLibrary => 7,
      Objects3D => 8,
      Unspecified => 9
   );
   for PickerLocationId'Size use 32;
   
   type PickerLocationId_Ptr is access PickerLocationId;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IVectorView_StorageFile_Interface;
   type IVectorView_StorageFile is access all IVectorView_StorageFile_Interface'Class;
   type IVectorView_StorageFile_Ptr is access all IVectorView_StorageFile;
   type IIterable_StorageFile_Interface;
   type IIterable_StorageFile is access all IIterable_StorageFile_Interface'Class;
   type IIterable_StorageFile_Ptr is access all IIterable_StorageFile;
   type IMap_String_IVector_Interface;
   type IMap_String_IVector is access all IMap_String_IVector_Interface'Class;
   type IMap_String_IVector_Ptr is access all IMap_String_IVector;
   type IIterable_IVector_Interface;
   type IIterable_IVector is access all IIterable_IVector_Interface'Class;
   type IIterable_IVector_Ptr is access all IIterable_IVector;
   type IVector_String_Interface;
   type IVector_String is access all IVector_String_Interface'Class;
   type IVector_String_Ptr is access all IVector_String;
   type IIterable_String_Interface;
   type IIterable_String is access all IIterable_String_Interface'Class;
   type IIterable_String_Ptr is access all IIterable_String;
   type IFileOpenPicker_Interface;
   type IFileOpenPicker is access all IFileOpenPicker_Interface'Class;
   type IFileOpenPicker_Ptr is access all IFileOpenPicker;
   type IFileOpenPicker2_Interface;
   type IFileOpenPicker2 is access all IFileOpenPicker2_Interface'Class;
   type IFileOpenPicker2_Ptr is access all IFileOpenPicker2;
   type IFileOpenPickerWithOperationId_Interface;
   type IFileOpenPickerWithOperationId is access all IFileOpenPickerWithOperationId_Interface'Class;
   type IFileOpenPickerWithOperationId_Ptr is access all IFileOpenPickerWithOperationId;
   type IFileOpenPickerStatics_Interface;
   type IFileOpenPickerStatics is access all IFileOpenPickerStatics_Interface'Class;
   type IFileOpenPickerStatics_Ptr is access all IFileOpenPickerStatics;
   type IFileSavePicker_Interface;
   type IFileSavePicker is access all IFileSavePicker_Interface'Class;
   type IFileSavePicker_Ptr is access all IFileSavePicker;
   type IFileSavePicker2_Interface;
   type IFileSavePicker2 is access all IFileSavePicker2_Interface'Class;
   type IFileSavePicker2_Ptr is access all IFileSavePicker2;
   type IFileSavePicker3_Interface;
   type IFileSavePicker3 is access all IFileSavePicker3_Interface'Class;
   type IFileSavePicker3_Ptr is access all IFileSavePicker3;
   type IFolderPicker_Interface;
   type IFolderPicker is access all IFolderPicker_Interface'Class;
   type IFolderPicker_Ptr is access all IFolderPicker;
   type IFolderPicker2_Interface;
   type IFolderPicker2 is access all IFolderPicker2_Interface'Class;
   type IFolderPicker2_Ptr is access all IFolderPicker2;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_StorageFile : aliased constant Windows.IID := (2154063129, 24106, 22877, (168, 205, 42, 36, 180, 6, 127, 27 ));
   
   type IVectorView_StorageFile_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_StorageFile_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_StorageFile_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_StorageFile_Interface
      ; value : Windows.Storage.IStorageFile
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_StorageFile_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Storage.IStorageFile_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_StorageFile : aliased constant Windows.IID := (2596274948, 33770, 22152, (135, 182, 174, 56, 170, 182, 93, 11 ));
   
   type IIterable_StorageFile_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_StorageFile_Interface
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMap_String_IVector : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IMap_String_IVector_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMap_String_IVector_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMap_String_IVector_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMap_String_IVector_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IMap_String_IVector_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Insert
   (
      This       : access IMap_String_IVector_Interface
      ; key : Windows.String
      ; value : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Remove
   (
      This       : access IMap_String_IVector_Interface
      ; key : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IMap_String_IVector_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IVector : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_IVector_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IVector_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_String : aliased constant Windows.IID := (2562305217, 19286, 21294, (172, 115, 3, 213, 41, 28, 202, 144 ));
   
   type IVector_String_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_String_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_String_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_String_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_String_Interface
      ; value : Windows.String
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_String_Interface
      ; index : Windows.UInt32
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_String_Interface
      ; index : Windows.UInt32
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_String_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_String_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_String_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_String_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_String_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.String_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_String_Interface
      ; items : Windows.String_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_String : aliased constant Windows.IID := (3808217025, 15356, 23051, (178, 176, 114, 231, 105, 209, 203, 126 ));
   
   type IIterable_String_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_String_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFileOpenPicker : aliased constant Windows.IID := (749217674, 4805, 19551, (137, 119, 148, 84, 119, 147, 194, 65 ));
   
   type IFileOpenPicker_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ViewMode
   (
      This       : access IFileOpenPicker_Interface
      ; RetVal : access Windows.Storage.Pickers.PickerViewMode
   )
   return Windows.HRESULT is abstract;
   
   function put_ViewMode
   (
      This       : access IFileOpenPicker_Interface
      ; value : Windows.Storage.Pickers.PickerViewMode
   )
   return Windows.HRESULT is abstract;
   
   function get_SettingsIdentifier
   (
      This       : access IFileOpenPicker_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_SettingsIdentifier
   (
      This       : access IFileOpenPicker_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SuggestedStartLocation
   (
      This       : access IFileOpenPicker_Interface
      ; RetVal : access Windows.Storage.Pickers.PickerLocationId
   )
   return Windows.HRESULT is abstract;
   
   function put_SuggestedStartLocation
   (
      This       : access IFileOpenPicker_Interface
      ; value : Windows.Storage.Pickers.PickerLocationId
   )
   return Windows.HRESULT is abstract;
   
   function get_CommitButtonText
   (
      This       : access IFileOpenPicker_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CommitButtonText
   (
      This       : access IFileOpenPicker_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FileTypeFilter
   (
      This       : access IFileOpenPicker_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PickSingleFileAsync
   (
      This       : access IFileOpenPicker_Interface
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PickMultipleFilesAsync
   (
      This       : access IFileOpenPicker_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFileOpenPicker2 : aliased constant Windows.IID := (2364239058, 46150, 18167, (178, 101, 144, 248, 229, 90, 214, 80 ));
   
   type IFileOpenPicker2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContinuationData
   (
      This       : access IFileOpenPicker2_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function PickSingleFileAndContinue
   (
      This       : access IFileOpenPicker2_Interface
   )
   return Windows.HRESULT is abstract;
   
   function PickMultipleFilesAndContinue
   (
      This       : access IFileOpenPicker2_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFileOpenPickerWithOperationId : aliased constant Windows.IID := (1062712681, 9506, 19621, (170, 115, 161, 85, 9, 241, 252, 191 ));
   
   type IFileOpenPickerWithOperationId_Interface is interface and Windows.IInspectable_Interface;
   
   function PickSingleFileAsync
   (
      This       : access IFileOpenPickerWithOperationId_Interface
      ; pickerOperationId : Windows.String
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFileOpenPickerStatics : aliased constant Windows.IID := (1747015483, 12034, 18483, (150, 212, 171, 191, 173, 114, 182, 123 ));
   
   type IFileOpenPickerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function ResumePickSingleFileAsync
   (
      This       : access IFileOpenPickerStatics_Interface
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFileSavePicker : aliased constant Windows.IID := (847708107, 24959, 19653, (175, 106, 179, 253, 242, 154, 209, 69 ));
   
   type IFileSavePicker_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SettingsIdentifier
   (
      This       : access IFileSavePicker_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_SettingsIdentifier
   (
      This       : access IFileSavePicker_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SuggestedStartLocation
   (
      This       : access IFileSavePicker_Interface
      ; RetVal : access Windows.Storage.Pickers.PickerLocationId
   )
   return Windows.HRESULT is abstract;
   
   function put_SuggestedStartLocation
   (
      This       : access IFileSavePicker_Interface
      ; value : Windows.Storage.Pickers.PickerLocationId
   )
   return Windows.HRESULT is abstract;
   
   function get_CommitButtonText
   (
      This       : access IFileSavePicker_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CommitButtonText
   (
      This       : access IFileSavePicker_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FileTypeChoices
   (
      This       : access IFileSavePicker_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultFileExtension
   (
      This       : access IFileSavePicker_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DefaultFileExtension
   (
      This       : access IFileSavePicker_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SuggestedSaveFile
   (
      This       : access IFileSavePicker_Interface
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function put_SuggestedSaveFile
   (
      This       : access IFileSavePicker_Interface
      ; value : Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function get_SuggestedFileName
   (
      This       : access IFileSavePicker_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_SuggestedFileName
   (
      This       : access IFileSavePicker_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function PickSaveFileAsync
   (
      This       : access IFileSavePicker_Interface
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFileSavePicker2 : aliased constant Windows.IID := (247665570, 53835, 17562, (129, 151, 232, 145, 4, 253, 66, 204 ));
   
   type IFileSavePicker2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContinuationData
   (
      This       : access IFileSavePicker2_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function PickSaveFileAndContinue
   (
      This       : access IFileSavePicker2_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFileSavePicker3 : aliased constant Windows.IID := (1770712169, 47676, 20049, (189, 144, 74, 188, 187, 244, 207, 175 ));
   
   type IFileSavePicker3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EnterpriseId
   (
      This       : access IFileSavePicker3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_EnterpriseId
   (
      This       : access IFileSavePicker3_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFolderPicker : aliased constant Windows.IID := (139425689, 62459, 16394, (153, 177, 123, 74, 119, 47, 214, 13 ));
   
   type IFolderPicker_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ViewMode
   (
      This       : access IFolderPicker_Interface
      ; RetVal : access Windows.Storage.Pickers.PickerViewMode
   )
   return Windows.HRESULT is abstract;
   
   function put_ViewMode
   (
      This       : access IFolderPicker_Interface
      ; value : Windows.Storage.Pickers.PickerViewMode
   )
   return Windows.HRESULT is abstract;
   
   function get_SettingsIdentifier
   (
      This       : access IFolderPicker_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_SettingsIdentifier
   (
      This       : access IFolderPicker_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SuggestedStartLocation
   (
      This       : access IFolderPicker_Interface
      ; RetVal : access Windows.Storage.Pickers.PickerLocationId
   )
   return Windows.HRESULT is abstract;
   
   function put_SuggestedStartLocation
   (
      This       : access IFolderPicker_Interface
      ; value : Windows.Storage.Pickers.PickerLocationId
   )
   return Windows.HRESULT is abstract;
   
   function get_CommitButtonText
   (
      This       : access IFolderPicker_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CommitButtonText
   (
      This       : access IFolderPicker_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FileTypeFilter
   (
      This       : access IFolderPicker_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PickSingleFolderAsync
   (
      This       : access IFolderPicker_Interface
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFolder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFolderPicker2 : aliased constant Windows.IID := (2394143383, 56453, 17942, (190, 148, 150, 96, 136, 31, 47, 93 ));
   
   type IFolderPicker2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContinuationData
   (
      This       : access IFolderPicker2_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function PickFolderAndContinue
   (
      This       : access IFolderPicker2_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype FilePickerSelectedFilesArray is Windows.Storage.Pickers.IVectorView_StorageFile;
   subtype FilePickerFileTypesOrderedMap is Windows.Storage.Pickers.IMap_String_IVector;
   subtype FileExtensionVector is Windows.Storage.Pickers.IVector_String;
   subtype FileOpenPicker is Windows.Storage.Pickers.IFileOpenPicker;
   function CreateFileOpenPicker return Windows.Storage.Pickers.IFileOpenPicker;
   
   subtype FileSavePicker is Windows.Storage.Pickers.IFileSavePicker;
   function CreateFileSavePicker return Windows.Storage.Pickers.IFileSavePicker;
   
   subtype FolderPicker is Windows.Storage.Pickers.IFolderPicker;
   function CreateFolderPicker return Windows.Storage.Pickers.IFolderPicker;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function ResumePickSingleFileAsync
   return Windows.Storage.IAsyncOperation_IStorageFile;
   
end;
