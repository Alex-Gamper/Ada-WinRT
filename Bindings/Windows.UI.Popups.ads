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
with Windows.Foundation.Collections;
with Windows.Foundation;
package Windows.UI.Popups is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type MessageDialogOptions is (
      None,
      AcceptUserInputAfterDelay
   );
   for MessageDialogOptions use (
      None => 0,
      AcceptUserInputAfterDelay => 1
   );
   for MessageDialogOptions'Size use 32;
   
   type MessageDialogOptions_Ptr is access MessageDialogOptions;
   
   type Placement is (
      Default,
      Above,
      Below,
      Left,
      Right
   );
   for Placement use (
      Default => 0,
      Above => 1,
      Below => 2,
      Left => 3,
      Right => 4
   );
   for Placement'Size use 32;
   
   type Placement_Ptr is access Placement;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type UICommandInvokedHandler_Interface;
   type UICommandInvokedHandler is access all UICommandInvokedHandler_Interface'Class;
   type UICommandInvokedHandler_Ptr is access all UICommandInvokedHandler;
   type AsyncOperationCompletedHandler_IUICommand_Interface;
   type AsyncOperationCompletedHandler_IUICommand is access all AsyncOperationCompletedHandler_IUICommand_Interface'Class;
   type AsyncOperationCompletedHandler_IUICommand_Ptr is access all AsyncOperationCompletedHandler_IUICommand;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IMessageDialog_Interface;
   type IMessageDialog is access all IMessageDialog_Interface'Class;
   type IMessageDialog_Ptr is access all IMessageDialog;
   type IMessageDialogFactory_Interface;
   type IMessageDialogFactory is access all IMessageDialogFactory_Interface'Class;
   type IMessageDialogFactory_Ptr is access all IMessageDialogFactory;
   type IUICommand_Interface;
   type IUICommand is access all IUICommand_Interface'Class;
   type IUICommand_Ptr is access all IUICommand;
   type IUICommandFactory_Interface;
   type IUICommandFactory is access all IUICommandFactory_Interface'Class;
   type IUICommandFactory_Ptr is access all IUICommandFactory;
   type IPopupMenu_Interface;
   type IPopupMenu is access all IPopupMenu_Interface'Class;
   type IPopupMenu_Ptr is access all IPopupMenu;
   type IIterator_IUICommand_Interface;
   type IIterator_IUICommand is access all IIterator_IUICommand_Interface'Class;
   type IIterator_IUICommand_Ptr is access all IIterator_IUICommand;
   type IIterable_IUICommand_Interface;
   type IIterable_IUICommand is access all IIterable_IUICommand_Interface'Class;
   type IIterable_IUICommand_Ptr is access all IIterable_IUICommand;
   type IVectorView_IUICommand_Interface;
   type IVectorView_IUICommand is access all IVectorView_IUICommand_Interface'Class;
   type IVectorView_IUICommand_Ptr is access all IVectorView_IUICommand;
   type IVector_IUICommand_Interface;
   type IVector_IUICommand is access all IVector_IUICommand_Interface'Class;
   type IVector_IUICommand_Ptr is access all IVector_IUICommand;
   type IAsyncOperation_IUICommand_Interface;
   type IAsyncOperation_IUICommand is access all IAsyncOperation_IUICommand_Interface'Class;
   type IAsyncOperation_IUICommand_Ptr is access all IAsyncOperation_IUICommand;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IMessageDialog : aliased constant Windows.IID := (871734017, 21285, 17323, (154, 179, 189, 174, 68, 14, 65, 33 ));
   
   type IMessageDialog_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Title
   (
      This       : access IMessageDialog_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access IMessageDialog_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Commands
   (
      This       : access IMessageDialog_Interface
      ; RetVal : access Windows.UI.Popups.IVector_IUICommand -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultCommandIndex
   (
      This       : access IMessageDialog_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_DefaultCommandIndex
   (
      This       : access IMessageDialog_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_CancelCommandIndex
   (
      This       : access IMessageDialog_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_CancelCommandIndex
   (
      This       : access IMessageDialog_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Content
   (
      This       : access IMessageDialog_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Content
   (
      This       : access IMessageDialog_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ShowAsync
   (
      This       : access IMessageDialog_Interface
      ; RetVal : access Windows.UI.Popups.IAsyncOperation_IUICommand -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Options
   (
      This       : access IMessageDialog_Interface
      ; RetVal : access Windows.UI.Popups.MessageDialogOptions
   )
   return Windows.HRESULT is abstract;
   
   function put_Options
   (
      This       : access IMessageDialog_Interface
      ; value : Windows.UI.Popups.MessageDialogOptions
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMessageDialogFactory : aliased constant Windows.IID := (756422519, 42607, 20133, (187, 135, 121, 63, 250, 73, 65, 242 ));
   
   type IMessageDialogFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IMessageDialogFactory_Interface
      ; content : Windows.String
      ; RetVal : access Windows.UI.Popups.IMessageDialog
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithTitle
   (
      This       : access IMessageDialogFactory_Interface
      ; content : Windows.String
      ; title : Windows.String
      ; RetVal : access Windows.UI.Popups.IMessageDialog
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUICommand : aliased constant Windows.IID := (1341733493, 16709, 18431, (172, 127, 223, 241, 193, 250, 91, 15 ));
   
   type IUICommand_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Label
   (
      This       : access IUICommand_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Label
   (
      This       : access IUICommand_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Invoked
   (
      This       : access IUICommand_Interface
      ; RetVal : access Windows.UI.Popups.UICommandInvokedHandler
   )
   return Windows.HRESULT is abstract;
   
   function put_Invoked
   (
      This       : access IUICommand_Interface
      ; value : Windows.UI.Popups.UICommandInvokedHandler
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IUICommand_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_Id
   (
      This       : access IUICommand_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUICommandFactory : aliased constant Windows.IID := (2719646089, 9904, 18038, (174, 148, 84, 4, 27, 193, 37, 232 ));
   
   type IUICommandFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IUICommandFactory_Interface
      ; label : Windows.String
      ; RetVal : access Windows.UI.Popups.IUICommand
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithHandler
   (
      This       : access IUICommandFactory_Interface
      ; label : Windows.String
      ; action : Windows.UI.Popups.UICommandInvokedHandler
      ; RetVal : access Windows.UI.Popups.IUICommand
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithHandlerAndId
   (
      This       : access IUICommandFactory_Interface
      ; label : Windows.String
      ; action : Windows.UI.Popups.UICommandInvokedHandler
      ; commandId : Windows.Object
      ; RetVal : access Windows.UI.Popups.IUICommand
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPopupMenu : aliased constant Windows.IID := (1318831836, 34829, 18428, (160, 161, 114, 182, 57, 230, 37, 89 ));
   
   type IPopupMenu_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Commands
   (
      This       : access IPopupMenu_Interface
      ; RetVal : access Windows.UI.Popups.IVector_IUICommand -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowAsync
   (
      This       : access IPopupMenu_Interface
      ; invocationPoint : Windows.Foundation.Point
      ; RetVal : access Windows.UI.Popups.IAsyncOperation_IUICommand -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowAsyncWithRect
   (
      This       : access IPopupMenu_Interface
      ; selection : Windows.Foundation.Rect
      ; RetVal : access Windows.UI.Popups.IAsyncOperation_IUICommand -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowAsyncWithRectAndPlacement
   (
      This       : access IPopupMenu_Interface
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; RetVal : access Windows.UI.Popups.IAsyncOperation_IUICommand -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IUICommand : aliased constant Windows.IID := (4099781587, 29337, 22478, (167, 62, 41, 124, 240, 175, 48, 131 ));
   
   type IIterator_IUICommand_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IUICommand_Interface
      ; RetVal : access Windows.UI.Popups.IUICommand
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IUICommand_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IUICommand_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IUICommand_Interface
      ; items : Windows.UI.Popups.IUICommand_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IUICommand : aliased constant Windows.IID := (3862815787, 21443, 24071, (144, 211, 152, 23, 45, 84, 84, 18 ));
   
   type IIterable_IUICommand_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IUICommand_Interface
      ; RetVal : access Windows.UI.Popups.IIterator_IUICommand
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IUICommand : aliased constant Windows.IID := (3977340390, 62327, 23296, (129, 114, 147, 193, 189, 4, 222, 180 ));
   
   type IVectorView_IUICommand_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IUICommand_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Popups.IUICommand
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IUICommand_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IUICommand_Interface
      ; value : Windows.UI.Popups.IUICommand
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IUICommand_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Popups.IUICommand_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IUICommand : aliased constant Windows.IID := (280861917, 14183, 24214, (144, 34, 240, 15, 156, 189, 98, 65 ));
   
   type IVector_IUICommand_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IUICommand_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Popups.IUICommand
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IUICommand_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IUICommand_Interface
      ; RetVal : access Windows.UI.Popups.IVectorView_IUICommand
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IUICommand_Interface
      ; value : Windows.UI.Popups.IUICommand
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IUICommand_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Popups.IUICommand
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IUICommand_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Popups.IUICommand
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IUICommand_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IUICommand_Interface
      ; value : Windows.UI.Popups.IUICommand
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IUICommand_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IUICommand_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IUICommand_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Popups.IUICommand_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IUICommand_Interface
      ; items : Windows.UI.Popups.IUICommand_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IUICommand : aliased constant Windows.IID := (3094807861, 27211, 21169, (181, 120, 243, 205, 197, 0, 122, 31 ));
   
   type IAsyncOperation_IUICommand_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IUICommand_Interface
      ; handler : Windows.UI.Popups.AsyncOperationCompletedHandler_IUICommand
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IUICommand_Interface
      ; RetVal : access Windows.UI.Popups.AsyncOperationCompletedHandler_IUICommand
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IUICommand_Interface
      ; RetVal : access Windows.UI.Popups.IUICommand
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_UICommandInvokedHandler : aliased constant Windows.IID := (3673651791, 49786, 17048, (154, 198, 41, 34, 196, 94, 125, 166 ));
   
   type UICommandInvokedHandler_Interface(Callback : access procedure (command : Windows.UI.Popups.IUICommand)) is new Windows.IMulticastDelegate_Interface(IID_UICommandInvokedHandler'access) with null record;
   function Invoke
   (
      This       : access UICommandInvokedHandler_Interface
      ; command : Windows.UI.Popups.IUICommand
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IUICommand : aliased constant Windows.IID := (3711171931, 41549, 23108, (145, 254, 221, 100, 65, 119, 1, 3 ));
   
   type AsyncOperationCompletedHandler_IUICommand_Interface(Callback : access procedure (asyncInfo : Windows.UI.Popups.IAsyncOperation_IUICommand ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IUICommand'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IUICommand_Interface
      ; asyncInfo : Windows.UI.Popups.IAsyncOperation_IUICommand
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype MessageDialog is Windows.UI.Popups.IMessageDialog;
   function Create
   (
      content : Windows.String
   )
   return Windows.UI.Popups.IMessageDialog;
   
   function CreateWithTitle
   (
      content : Windows.String
      ; title : Windows.String
   )
   return Windows.UI.Popups.IMessageDialog;
   
   subtype UICommand is Windows.UI.Popups.IUICommand;
   function CreateUICommand return Windows.UI.Popups.IUICommand;
   
   subtype UICommandSeparator is Windows.UI.Popups.IUICommand;
   function CreateUICommandSeparator return Windows.UI.Popups.IUICommand;
   
   subtype PopupMenu is Windows.UI.Popups.IPopupMenu;
   function CreatePopupMenu return Windows.UI.Popups.IPopupMenu;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
