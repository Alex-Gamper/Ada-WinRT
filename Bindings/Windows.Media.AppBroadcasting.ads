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
limited with Windows.System;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.Media.AppBroadcasting is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type AppBroadcastingContract is null record;
   pragma Convention (C_Pass_By_Copy , AppBroadcastingContract);
   
   type AppBroadcastingContract_Ptr is access AppBroadcastingContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IAppBroadcastingMonitor_add_IsCurrentAppBroadcastingChanged_Interface;
   type TypedEventHandler_IAppBroadcastingMonitor_add_IsCurrentAppBroadcastingChanged is access all TypedEventHandler_IAppBroadcastingMonitor_add_IsCurrentAppBroadcastingChanged_Interface'Class;
   type TypedEventHandler_IAppBroadcastingMonitor_add_IsCurrentAppBroadcastingChanged_Ptr is access all TypedEventHandler_IAppBroadcastingMonitor_add_IsCurrentAppBroadcastingChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IAppBroadcastingUI_Interface;
   type IAppBroadcastingUI is access all IAppBroadcastingUI_Interface'Class;
   type IAppBroadcastingUI_Ptr is access all IAppBroadcastingUI;
   type IAppBroadcastingUIStatics_Interface;
   type IAppBroadcastingUIStatics is access all IAppBroadcastingUIStatics_Interface'Class;
   type IAppBroadcastingUIStatics_Ptr is access all IAppBroadcastingUIStatics;
   type IAppBroadcastingMonitor_Interface;
   type IAppBroadcastingMonitor is access all IAppBroadcastingMonitor_Interface'Class;
   type IAppBroadcastingMonitor_Ptr is access all IAppBroadcastingMonitor;
   type IAppBroadcastingStatus_Interface;
   type IAppBroadcastingStatus is access all IAppBroadcastingStatus_Interface'Class;
   type IAppBroadcastingStatus_Ptr is access all IAppBroadcastingStatus;
   type IAppBroadcastingStatusDetails_Interface;
   type IAppBroadcastingStatusDetails is access all IAppBroadcastingStatusDetails_Interface'Class;
   type IAppBroadcastingStatusDetails_Ptr is access all IAppBroadcastingStatusDetails;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastingUI : aliased constant Windows.IID := (3849297807, 61081, 19914, (163, 195, 112, 175, 61, 180, 79, 95 ));
   
   type IAppBroadcastingUI_Interface is interface and Windows.IInspectable_Interface;
   
   function GetStatus
   (
      This       : access IAppBroadcastingUI_Interface
      ; RetVal : access Windows.Media.AppBroadcasting.IAppBroadcastingStatus
   )
   return Windows.HRESULT is abstract;
   
   function ShowBroadcastUI
   (
      This       : access IAppBroadcastingUI_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastingUIStatics : aliased constant Windows.IID := (1437116317, 9163, 17785, (156, 52, 136, 111, 224, 44, 4, 90 ));
   
   type IAppBroadcastingUIStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IAppBroadcastingUIStatics_Interface
      ; RetVal : access Windows.Media.AppBroadcasting.IAppBroadcastingUI
   )
   return Windows.HRESULT is abstract;
   
   function GetForUser
   (
      This       : access IAppBroadcastingUIStatics_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.Media.AppBroadcasting.IAppBroadcastingUI
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastingMonitor : aliased constant Windows.IID := (16341608, 35079, 18592, (184, 239, 36, 210, 8, 19, 117, 66 ));
   
   type IAppBroadcastingMonitor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsCurrentAppBroadcasting
   (
      This       : access IAppBroadcastingMonitor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_IsCurrentAppBroadcastingChanged
   (
      This       : access IAppBroadcastingMonitor_Interface
      ; handler : TypedEventHandler_IAppBroadcastingMonitor_add_IsCurrentAppBroadcastingChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_IsCurrentAppBroadcastingChanged
   (
      This       : access IAppBroadcastingMonitor_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastingStatus : aliased constant Windows.IID := (304473311, 929, 17144, (139, 128, 201, 34, 140, 217, 207, 46 ));
   
   type IAppBroadcastingStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanStartBroadcast
   (
      This       : access IAppBroadcastingStatus_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Details
   (
      This       : access IAppBroadcastingStatus_Interface
      ; RetVal : access Windows.Media.AppBroadcasting.IAppBroadcastingStatusDetails
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastingStatusDetails : aliased constant Windows.IID := (110996900, 46451, 20028, (142, 25, 27, 175, 172, 208, 151, 19 ));
   
   type IAppBroadcastingStatusDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsAnyAppBroadcasting
   (
      This       : access IAppBroadcastingStatusDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCaptureResourceUnavailable
   (
      This       : access IAppBroadcastingStatusDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsGameStreamInProgress
   (
      This       : access IAppBroadcastingStatusDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsGpuConstrained
   (
      This       : access IAppBroadcastingStatusDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAppInactive
   (
      This       : access IAppBroadcastingStatusDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsBlockedForApp
   (
      This       : access IAppBroadcastingStatusDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDisabledByUser
   (
      This       : access IAppBroadcastingStatusDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDisabledBySystem
   (
      This       : access IAppBroadcastingStatusDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppBroadcastingMonitor_add_IsCurrentAppBroadcastingChanged : aliased constant Windows.IID := (3697545611, 1273, 20833, (167, 192, 230, 169, 96, 112, 168, 209 ));
   
   type TypedEventHandler_IAppBroadcastingMonitor_add_IsCurrentAppBroadcastingChanged_Interface(Callback : access procedure (sender : Windows.Media.AppBroadcasting.IAppBroadcastingMonitor ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppBroadcastingMonitor_add_IsCurrentAppBroadcastingChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastingMonitor_add_IsCurrentAppBroadcastingChanged_Interface
      ; sender : Windows.Media.AppBroadcasting.IAppBroadcastingMonitor
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype AppBroadcastingStatus is Windows.Media.AppBroadcasting.IAppBroadcastingStatus;
   subtype AppBroadcastingUI is Windows.Media.AppBroadcasting.IAppBroadcastingUI;
   subtype AppBroadcastingMonitor is Windows.Media.AppBroadcasting.IAppBroadcastingMonitor;
   function Create return Windows.Media.AppBroadcasting.IAppBroadcastingMonitor;
   
   subtype AppBroadcastingStatusDetails is Windows.Media.AppBroadcasting.IAppBroadcastingStatusDetails;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetDefault
   return Windows.Media.AppBroadcasting.IAppBroadcastingUI;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.Media.AppBroadcasting.IAppBroadcastingUI;
   
end;
