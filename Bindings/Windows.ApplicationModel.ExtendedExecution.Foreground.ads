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
--------------------------------------------------------------------------------
package Windows.ApplicationModel.ExtendedExecution.Foreground is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type ExtendedExecutionForegroundResult is (
      Allowed,
      Denied
   );
   for ExtendedExecutionForegroundResult use (
      Allowed => 0,
      Denied => 1
   );
   for ExtendedExecutionForegroundResult'Size use 32;
   
   type ExtendedExecutionForegroundResult_Ptr is access ExtendedExecutionForegroundResult;
   
   type ExtendedExecutionForegroundRevokedReason is (
      Resumed,
      SystemPolicy
   );
   for ExtendedExecutionForegroundRevokedReason use (
      Resumed => 0,
      SystemPolicy => 1
   );
   for ExtendedExecutionForegroundRevokedReason'Size use 32;
   
   type ExtendedExecutionForegroundRevokedReason_Ptr is access ExtendedExecutionForegroundRevokedReason;
   
   type ExtendedExecutionForegroundReason is (
      Unspecified,
      SavingData,
      BackgroundAudio,
      Unconstrained
   );
   for ExtendedExecutionForegroundReason use (
      Unspecified => 0,
      SavingData => 1,
      BackgroundAudio => 2,
      Unconstrained => 3
   );
   for ExtendedExecutionForegroundReason'Size use 32;
   
   type ExtendedExecutionForegroundReason_Ptr is access ExtendedExecutionForegroundReason;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IExtendedExecutionForegroundSession_add_Revoked_Interface;
   type TypedEventHandler_IExtendedExecutionForegroundSession_add_Revoked is access all TypedEventHandler_IExtendedExecutionForegroundSession_add_Revoked_Interface'Class;
   type TypedEventHandler_IExtendedExecutionForegroundSession_add_Revoked_Ptr is access all TypedEventHandler_IExtendedExecutionForegroundSession_add_Revoked;
   type AsyncOperationCompletedHandler_ExtendedExecutionForegroundResult_Interface;
   type AsyncOperationCompletedHandler_ExtendedExecutionForegroundResult is access all AsyncOperationCompletedHandler_ExtendedExecutionForegroundResult_Interface'Class;
   type AsyncOperationCompletedHandler_ExtendedExecutionForegroundResult_Ptr is access all AsyncOperationCompletedHandler_ExtendedExecutionForegroundResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IExtendedExecutionForegroundRevokedEventArgs_Interface;
   type IExtendedExecutionForegroundRevokedEventArgs is access all IExtendedExecutionForegroundRevokedEventArgs_Interface'Class;
   type IExtendedExecutionForegroundRevokedEventArgs_Ptr is access all IExtendedExecutionForegroundRevokedEventArgs;
   type IExtendedExecutionForegroundSession_Interface;
   type IExtendedExecutionForegroundSession is access all IExtendedExecutionForegroundSession_Interface'Class;
   type IExtendedExecutionForegroundSession_Ptr is access all IExtendedExecutionForegroundSession;
   type IAsyncOperation_ExtendedExecutionForegroundResult_Interface;
   type IAsyncOperation_ExtendedExecutionForegroundResult is access all IAsyncOperation_ExtendedExecutionForegroundResult_Interface'Class;
   type IAsyncOperation_ExtendedExecutionForegroundResult_Ptr is access all IAsyncOperation_ExtendedExecutionForegroundResult;
   
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
   
   IID_IExtendedExecutionForegroundRevokedEventArgs : aliased constant Windows.IID := (2960972096, 38231, 44708, (44, 153, 189, 213, 109, 155, 228, 97 ));
   
   type IExtendedExecutionForegroundRevokedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reason
   (
      This       : access IExtendedExecutionForegroundRevokedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.ExtendedExecution.Foreground.ExtendedExecutionForegroundRevokedReason
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IExtendedExecutionForegroundSession : aliased constant Windows.IID := (4227088609, 40208, 16897, (176, 30, 200, 50, 117, 41, 111, 46 ));
   
   type IExtendedExecutionForegroundSession_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Description
   (
      This       : access IExtendedExecutionForegroundSession_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IExtendedExecutionForegroundSession_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function add_Revoked
   (
      This       : access IExtendedExecutionForegroundSession_Interface
      ; handler : TypedEventHandler_IExtendedExecutionForegroundSession_add_Revoked
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Revoked
   (
      This       : access IExtendedExecutionForegroundSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function RequestExtensionAsync
   (
      This       : access IExtendedExecutionForegroundSession_Interface
      ; RetVal : access Windows.ApplicationModel.ExtendedExecution.Foreground.IAsyncOperation_ExtendedExecutionForegroundResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Reason
   (
      This       : access IExtendedExecutionForegroundSession_Interface
      ; RetVal : access Windows.ApplicationModel.ExtendedExecution.Foreground.ExtendedExecutionForegroundReason
   )
   return Windows.HRESULT is abstract;
   
   function put_Reason
   (
      This       : access IExtendedExecutionForegroundSession_Interface
      ; value : Windows.ApplicationModel.ExtendedExecution.Foreground.ExtendedExecutionForegroundReason
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ExtendedExecutionForegroundResult : aliased constant Windows.IID := (2978914319, 35872, 23234, (146, 70, 62, 244, 5, 39, 31, 26 ));
   
   type IAsyncOperation_ExtendedExecutionForegroundResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ExtendedExecutionForegroundResult_Interface
      ; handler : Windows.ApplicationModel.ExtendedExecution.Foreground.AsyncOperationCompletedHandler_ExtendedExecutionForegroundResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ExtendedExecutionForegroundResult_Interface
      ; RetVal : access Windows.ApplicationModel.ExtendedExecution.Foreground.AsyncOperationCompletedHandler_ExtendedExecutionForegroundResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ExtendedExecutionForegroundResult_Interface
      ; RetVal : access Windows.ApplicationModel.ExtendedExecution.Foreground.ExtendedExecutionForegroundResult
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IExtendedExecutionForegroundSession_add_Revoked : aliased constant Windows.IID := (4168358266, 48921, 21634, (154, 177, 52, 146, 61, 230, 115, 141 ));
   
   type TypedEventHandler_IExtendedExecutionForegroundSession_add_Revoked_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.ApplicationModel.ExtendedExecution.Foreground.IExtendedExecutionForegroundRevokedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IExtendedExecutionForegroundSession_add_Revoked'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IExtendedExecutionForegroundSession_add_Revoked_Interface
      ; sender : Windows.Object
      ; args : Windows.ApplicationModel.ExtendedExecution.Foreground.IExtendedExecutionForegroundRevokedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ExtendedExecutionForegroundResult : aliased constant Windows.IID := (132242433, 6330, 22890, (183, 69, 121, 249, 205, 228, 76, 204 ));
   
   type AsyncOperationCompletedHandler_ExtendedExecutionForegroundResult_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.ExtendedExecution.Foreground.IAsyncOperation_ExtendedExecutionForegroundResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ExtendedExecutionForegroundResult'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ExtendedExecutionForegroundResult_Interface
      ; asyncInfo : Windows.ApplicationModel.ExtendedExecution.Foreground.IAsyncOperation_ExtendedExecutionForegroundResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype ExtendedExecutionForegroundRevokedEventArgs is Windows.ApplicationModel.ExtendedExecution.Foreground.IExtendedExecutionForegroundRevokedEventArgs;
   subtype ExtendedExecutionForegroundSession is Windows.ApplicationModel.ExtendedExecution.Foreground.IExtendedExecutionForegroundSession;
   
   function CreateExtendedExecutionForegroundSession return Windows.ApplicationModel.ExtendedExecution.Foreground.IExtendedExecutionForegroundSession;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   

end;
