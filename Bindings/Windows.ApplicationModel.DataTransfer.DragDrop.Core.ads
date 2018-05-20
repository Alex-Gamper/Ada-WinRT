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
limited with Windows.Graphics.Imaging;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.DataTransfer.DragDrop.Core is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type CoreDragUIContentMode is (
      Auto,
      Deferred
   );
   for CoreDragUIContentMode use (
      Auto => 0,
      Deferred => 1
   );
   for CoreDragUIContentMode'Size use 32;
   
   type CoreDragUIContentMode_Ptr is access CoreDragUIContentMode;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_ICoreDragDropManager_add_TargetRequested_Interface;
   type TypedEventHandler_ICoreDragDropManager_add_TargetRequested is access all TypedEventHandler_ICoreDragDropManager_add_TargetRequested_Interface'Class;
   type TypedEventHandler_ICoreDragDropManager_add_TargetRequested_Ptr is access all TypedEventHandler_ICoreDragDropManager_add_TargetRequested;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ICoreDragInfo_Interface;
   type ICoreDragInfo is access all ICoreDragInfo_Interface'Class;
   type ICoreDragInfo_Ptr is access all ICoreDragInfo;
   type ICoreDragInfo2_Interface;
   type ICoreDragInfo2 is access all ICoreDragInfo2_Interface'Class;
   type ICoreDragInfo2_Ptr is access all ICoreDragInfo2;
   type ICoreDragUIOverride_Interface;
   type ICoreDragUIOverride is access all ICoreDragUIOverride_Interface'Class;
   type ICoreDragUIOverride_Ptr is access all ICoreDragUIOverride;
   type ICoreDropOperationTarget_Interface;
   type ICoreDropOperationTarget is access all ICoreDropOperationTarget_Interface'Class;
   type ICoreDropOperationTarget_Ptr is access all ICoreDropOperationTarget;
   type ICoreDragOperation_Interface;
   type ICoreDragOperation is access all ICoreDragOperation_Interface'Class;
   type ICoreDragOperation_Ptr is access all ICoreDragOperation;
   type ICoreDragOperation2_Interface;
   type ICoreDragOperation2 is access all ICoreDragOperation2_Interface'Class;
   type ICoreDragOperation2_Ptr is access all ICoreDragOperation2;
   type ICoreDragDropManagerStatics_Interface;
   type ICoreDragDropManagerStatics is access all ICoreDragDropManagerStatics_Interface'Class;
   type ICoreDragDropManagerStatics_Ptr is access all ICoreDragDropManagerStatics;
   type ICoreDragDropManager_Interface;
   type ICoreDragDropManager is access all ICoreDragDropManager_Interface'Class;
   type ICoreDragDropManager_Ptr is access all ICoreDragDropManager;
   type ICoreDropOperationTargetRequestedEventArgs_Interface;
   type ICoreDropOperationTargetRequestedEventArgs is access all ICoreDropOperationTargetRequestedEventArgs_Interface'Class;
   type ICoreDropOperationTargetRequestedEventArgs_Ptr is access all ICoreDropOperationTargetRequestedEventArgs;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ICoreDragInfo : aliased constant Windows.IID := (1211447947, 52048, 17998, (149, 117, 205, 78, 58, 122, 176, 40 ));
   
   type ICoreDragInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Data
   (
      This       : access ICoreDragInfo_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IDataPackageView
   )
   return Windows.HRESULT is abstract;
   
   function get_Modifiers
   (
      This       : access ICoreDragInfo_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.DragDrop.DragDropModifiers
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access ICoreDragInfo_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreDragInfo2 : aliased constant Windows.IID := (3309736421, 59131, 19828, (180, 177, 138, 60, 23, 242, 94, 158 ));
   
   type ICoreDragInfo2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllowedOperations
   (
      This       : access ICoreDragInfo2_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.DataPackageOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreDragUIOverride : aliased constant Windows.IID := (2309509220, 13193, 20303, (136, 151, 126, 138, 63, 251, 60, 147 ));
   
   type ICoreDragUIOverride_Interface is interface and Windows.IInspectable_Interface;
   
   function SetContentFromSoftwareBitmap
   (
      This       : access ICoreDragUIOverride_Interface
      ; softwareBitmap : Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   
   function SetContentFromSoftwareBitmapWithAnchorPoint
   (
      This       : access ICoreDragUIOverride_Interface
      ; softwareBitmap : Windows.Graphics.Imaging.ISoftwareBitmap
      ; anchorPoint : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_IsContentVisible
   (
      This       : access ICoreDragUIOverride_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsContentVisible
   (
      This       : access ICoreDragUIOverride_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Caption
   (
      This       : access ICoreDragUIOverride_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Caption
   (
      This       : access ICoreDragUIOverride_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCaptionVisible
   (
      This       : access ICoreDragUIOverride_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsCaptionVisible
   (
      This       : access ICoreDragUIOverride_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsGlyphVisible
   (
      This       : access ICoreDragUIOverride_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsGlyphVisible
   (
      This       : access ICoreDragUIOverride_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access ICoreDragUIOverride_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreDropOperationTarget : aliased constant Windows.IID := (3641860502, 19547, 16765, (187, 55, 118, 56, 29, 239, 141, 180 ));
   
   type ICoreDropOperationTarget_Interface is interface and Windows.IInspectable_Interface;
   
   function EnterAsync
   (
      This       : access ICoreDropOperationTarget_Interface
      ; dragInfo : Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragInfo
      ; dragUIOverride : Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragUIOverride
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IAsyncOperation_DataPackageOperation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function OverAsync
   (
      This       : access ICoreDropOperationTarget_Interface
      ; dragInfo : Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragInfo
      ; dragUIOverride : Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragUIOverride
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IAsyncOperation_DataPackageOperation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LeaveAsync
   (
      This       : access ICoreDropOperationTarget_Interface
      ; dragInfo : Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragInfo
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function DropAsync
   (
      This       : access ICoreDropOperationTarget_Interface
      ; dragInfo : Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragInfo
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IAsyncOperation_DataPackageOperation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreDragOperation : aliased constant Windows.IID := (3423002191, 28080, 20066, (171, 27, 167, 74, 2, 220, 109, 133 ));
   
   type ICoreDragOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Data
   (
      This       : access ICoreDragOperation_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IDataPackage
   )
   return Windows.HRESULT is abstract;
   
   function SetPointerId
   (
      This       : access ICoreDragOperation_Interface
      ; pointerId : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function SetDragUIContentFromSoftwareBitmap
   (
      This       : access ICoreDragOperation_Interface
      ; softwareBitmap : Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   
   function SetDragUIContentFromSoftwareBitmapWithAnchorPoint
   (
      This       : access ICoreDragOperation_Interface
      ; softwareBitmap : Windows.Graphics.Imaging.ISoftwareBitmap
      ; anchorPoint : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_DragUIContentMode
   (
      This       : access ICoreDragOperation_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.DragDrop.Core.CoreDragUIContentMode
   )
   return Windows.HRESULT is abstract;
   
   function put_DragUIContentMode
   (
      This       : access ICoreDragOperation_Interface
      ; value : Windows.ApplicationModel.DataTransfer.DragDrop.Core.CoreDragUIContentMode
   )
   return Windows.HRESULT is abstract;
   
   function StartAsync
   (
      This       : access ICoreDragOperation_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IAsyncOperation_DataPackageOperation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreDragOperation2 : aliased constant Windows.IID := (2185961004, 55706, 20419, (133, 7, 108, 24, 47, 51, 180, 106 ));
   
   type ICoreDragOperation2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllowedOperations
   (
      This       : access ICoreDragOperation2_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.DataPackageOperation
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowedOperations
   (
      This       : access ICoreDragOperation2_Interface
      ; value : Windows.ApplicationModel.DataTransfer.DataPackageOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreDragDropManagerStatics : aliased constant Windows.IID := (2504195530, 55826, 19484, (141, 6, 4, 29, 178, 151, 51, 195 ));
   
   type ICoreDragDropManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access ICoreDragDropManagerStatics_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragDropManager
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreDragDropManager : aliased constant Windows.IID := (2102842180, 33892, 20399, (170, 73, 55, 234, 110, 45, 123, 209 ));
   
   type ICoreDragDropManager_Interface is interface and Windows.IInspectable_Interface;
   
   function add_TargetRequested
   (
      This       : access ICoreDragDropManager_Interface
      ; value : TypedEventHandler_ICoreDragDropManager_add_TargetRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_TargetRequested
   (
      This       : access ICoreDragDropManager_Interface
      ; value : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_AreConcurrentOperationsEnabled
   (
      This       : access ICoreDragDropManager_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AreConcurrentOperationsEnabled
   (
      This       : access ICoreDragDropManager_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreDropOperationTargetRequestedEventArgs : aliased constant Windows.IID := (717918874, 24104, 20134, (130, 158, 41, 19, 78, 102, 93, 109 ));
   
   type ICoreDropOperationTargetRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function SetTarget
   (
      This       : access ICoreDropOperationTargetRequestedEventArgs_Interface
      ; target : Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDropOperationTarget
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreDragDropManager_add_TargetRequested : aliased constant Windows.IID := (2764288449, 47277, 22731, (172, 192, 142, 243, 126, 174, 78, 212 ));
   
   type TypedEventHandler_ICoreDragDropManager_add_TargetRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragDropManager ; args : Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDropOperationTargetRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreDragDropManager_add_TargetRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreDragDropManager_add_TargetRequested_Interface
      ; sender : Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragDropManager
      ; args : Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDropOperationTargetRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype CoreDragInfo is Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragInfo;
   subtype CoreDragUIOverride is Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragUIOverride;
   subtype CoreDragDropManager is Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragDropManager;
   subtype CoreDropOperationTargetRequestedEventArgs is Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDropOperationTargetRequestedEventArgs;
   subtype CoreDragOperation is Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragOperation;
   function Create return Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragOperation;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetForCurrentView
   return Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragDropManager;
   
end;
