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
--------------------------------------------------------------------------------
package Windows.Services.Cortana is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type CortanaPermissionsChangeResult is (
      Success,
      Unavailable,
      DisabledByPolicy
   );
   for CortanaPermissionsChangeResult use (
      Success => 0,
      Unavailable => 1,
      DisabledByPolicy => 2
   );
   for CortanaPermissionsChangeResult'Size use 32;
   
   type CortanaPermissionsChangeResult_Ptr is access CortanaPermissionsChangeResult;
   
   type CortanaPermission is (
      BrowsingHistory,
      Calendar,
      CallHistory,
      Contacts,
      Email,
      InputPersonalization,
      Location,
      Messaging,
      Microphone,
      Personalization,
      PhoneCall
   );
   for CortanaPermission use (
      BrowsingHistory => 0,
      Calendar => 1,
      CallHistory => 2,
      Contacts => 3,
      Email => 4,
      InputPersonalization => 5,
      Location => 6,
      Messaging => 7,
      Microphone => 8,
      Personalization => 9,
      PhoneCall => 10
   );
   for CortanaPermission'Size use 32;
   
   type CortanaPermission_Ptr is access CortanaPermission;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_CortanaPermissionsChangeResult_Interface;
   type AsyncOperationCompletedHandler_CortanaPermissionsChangeResult is access all AsyncOperationCompletedHandler_CortanaPermissionsChangeResult_Interface'Class;
   type AsyncOperationCompletedHandler_CortanaPermissionsChangeResult_Ptr is access all AsyncOperationCompletedHandler_CortanaPermissionsChangeResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ICortanaPermissionsManager_Interface;
   type ICortanaPermissionsManager is access all ICortanaPermissionsManager_Interface'Class;
   type ICortanaPermissionsManager_Ptr is access all ICortanaPermissionsManager;
   type ICortanaPermissionsManagerStatics_Interface;
   type ICortanaPermissionsManagerStatics is access all ICortanaPermissionsManagerStatics_Interface'Class;
   type ICortanaPermissionsManagerStatics_Ptr is access all ICortanaPermissionsManagerStatics;
   type ICortanaSettings_Interface;
   type ICortanaSettings is access all ICortanaSettings_Interface'Class;
   type ICortanaSettings_Ptr is access all ICortanaSettings;
   type ICortanaSettingsStatics_Interface;
   type ICortanaSettingsStatics is access all ICortanaSettingsStatics_Interface'Class;
   type ICortanaSettingsStatics_Ptr is access all ICortanaSettingsStatics;
   type IIterator_CortanaPermission_Interface;
   type IIterator_CortanaPermission is access all IIterator_CortanaPermission_Interface'Class;
   type IIterator_CortanaPermission_Ptr is access all IIterator_CortanaPermission;
   type IIterable_CortanaPermission_Interface;
   type IIterable_CortanaPermission is access all IIterable_CortanaPermission_Interface'Class;
   type IIterable_CortanaPermission_Ptr is access all IIterable_CortanaPermission;
   type IAsyncOperation_CortanaPermissionsChangeResult_Interface;
   type IAsyncOperation_CortanaPermissionsChangeResult is access all IAsyncOperation_CortanaPermissionsChangeResult_Interface'Class;
   type IAsyncOperation_CortanaPermissionsChangeResult_Ptr is access all IAsyncOperation_CortanaPermissionsChangeResult;
   
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
   
   IID_ICortanaPermissionsManager : aliased constant Windows.IID := (420688096, 34453, 17290, (149, 69, 61, 164, 232, 34, 221, 180 ));
   
   type ICortanaPermissionsManager_Interface is interface and Windows.IInspectable_Interface;
   
   function IsSupported
   (
      This       : access ICortanaPermissionsManager_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ArePermissionsGrantedAsync
   (
      This       : access ICortanaPermissionsManager_Interface
      ; permissions : Windows.Services.Cortana.IIterable_CortanaPermission
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GrantPermissionsAsync
   (
      This       : access ICortanaPermissionsManager_Interface
      ; permissions : Windows.Services.Cortana.IIterable_CortanaPermission
      ; RetVal : access Windows.Services.Cortana.IAsyncOperation_CortanaPermissionsChangeResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RevokePermissionsAsync
   (
      This       : access ICortanaPermissionsManager_Interface
      ; permissions : Windows.Services.Cortana.IIterable_CortanaPermission
      ; RetVal : access Windows.Services.Cortana.IAsyncOperation_CortanaPermissionsChangeResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICortanaPermissionsManagerStatics : aliased constant Windows.IID := (1991370362, 45125, 17428, (157, 109, 42, 211, 165, 254, 58, 126 ));
   
   type ICortanaPermissionsManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access ICortanaPermissionsManagerStatics_Interface
      ; RetVal : access Windows.Services.Cortana.ICortanaPermissionsManager
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICortanaSettings : aliased constant Windows.IID := (1423274407, 32866, 16628, (171, 231, 222, 223, 214, 151, 176, 25 ));
   
   type ICortanaSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HasUserConsentToVoiceActivation
   (
      This       : access ICortanaSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsVoiceActivationEnabled
   (
      This       : access ICortanaSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsVoiceActivationEnabled
   (
      This       : access ICortanaSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICortanaSettingsStatics : aliased constant Windows.IID := (2334969214, 11968, 17517, (146, 133, 51, 240, 124, 232, 172, 4 ));
   
   type ICortanaSettingsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function IsSupported
   (
      This       : access ICortanaSettingsStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetDefault
   (
      This       : access ICortanaSettingsStatics_Interface
      ; RetVal : access Windows.Services.Cortana.ICortanaSettings
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_CortanaPermission : aliased constant Windows.IID := (253412156, 20762, 21224, (175, 9, 216, 159, 112, 4, 232, 197 ));
   
   type IIterator_CortanaPermission_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_CortanaPermission_Interface
      ; RetVal : access Windows.Services.Cortana.CortanaPermission
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_CortanaPermission_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_CortanaPermission_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_CortanaPermission_Interface
      ; items : Windows.Services.Cortana.CortanaPermission_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_CortanaPermission : aliased constant Windows.IID := (916532910, 11812, 24071, (191, 208, 52, 74, 146, 153, 9, 22 ));
   
   type IIterable_CortanaPermission_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_CortanaPermission_Interface
      ; RetVal : access Windows.Services.Cortana.IIterator_CortanaPermission
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_CortanaPermissionsChangeResult : aliased constant Windows.IID := (2206875088, 61603, 20623, (132, 106, 211, 193, 158, 79, 231, 160 ));
   
   type IAsyncOperation_CortanaPermissionsChangeResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_CortanaPermissionsChangeResult_Interface
      ; handler : Windows.Services.Cortana.AsyncOperationCompletedHandler_CortanaPermissionsChangeResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_CortanaPermissionsChangeResult_Interface
      ; RetVal : access Windows.Services.Cortana.AsyncOperationCompletedHandler_CortanaPermissionsChangeResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_CortanaPermissionsChangeResult_Interface
      ; RetVal : access Windows.Services.Cortana.CortanaPermissionsChangeResult
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_CortanaPermissionsChangeResult : aliased constant Windows.IID := (3961283974, 24077, 23488, (184, 79, 32, 5, 44, 90, 199, 169 ));
   
   type AsyncOperationCompletedHandler_CortanaPermissionsChangeResult_Interface(Callback : access procedure (asyncInfo : Windows.Services.Cortana.IAsyncOperation_CortanaPermissionsChangeResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_CortanaPermissionsChangeResult'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_CortanaPermissionsChangeResult_Interface
      ; asyncInfo : Windows.Services.Cortana.IAsyncOperation_CortanaPermissionsChangeResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype CortanaPermissionsManager is Windows.Services.Cortana.ICortanaPermissionsManager;
   subtype CortanaSettings is Windows.Services.Cortana.ICortanaSettings;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetDefault
   return Windows.Services.Cortana.ICortanaPermissionsManager;
   
   function IsSupported
   return Windows.Boolean;
   
   function GetDefault
   return Windows.Services.Cortana.ICortanaSettings;

end;
