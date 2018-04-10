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
package Windows.UI.ViewManagement.Core is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type CoreInputViewOcclusionKind is (
      Docked,
      Floating,
      Overlay
   );
   for CoreInputViewOcclusionKind use (
      Docked => 0,
      Floating => 1,
      Overlay => 2
   );
   for CoreInputViewOcclusionKind'Size use 32;
   
   type CoreInputViewOcclusionKind_Ptr is access CoreInputViewOcclusionKind;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_ICoreInputView_add_OcclusionsChanged_Interface;
   type TypedEventHandler_ICoreInputView_add_OcclusionsChanged is access all TypedEventHandler_ICoreInputView_add_OcclusionsChanged_Interface'Class;
   type TypedEventHandler_ICoreInputView_add_OcclusionsChanged_Ptr is access all TypedEventHandler_ICoreInputView_add_OcclusionsChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ICoreInputViewOcclusion_Interface;
   type ICoreInputViewOcclusion is access all ICoreInputViewOcclusion_Interface'Class;
   type ICoreInputViewOcclusion_Ptr is access all ICoreInputViewOcclusion;
   type ICoreInputView_Interface;
   type ICoreInputView is access all ICoreInputView_Interface'Class;
   type ICoreInputView_Ptr is access all ICoreInputView;
   type ICoreInputViewStatics_Interface;
   type ICoreInputViewStatics is access all ICoreInputViewStatics_Interface'Class;
   type ICoreInputViewStatics_Ptr is access all ICoreInputViewStatics;
   type ICoreInputViewOcclusionsChangedEventArgs_Interface;
   type ICoreInputViewOcclusionsChangedEventArgs is access all ICoreInputViewOcclusionsChangedEventArgs_Interface'Class;
   type ICoreInputViewOcclusionsChangedEventArgs_Ptr is access all ICoreInputViewOcclusionsChangedEventArgs;
   type IIterator_ICoreInputViewOcclusion_Interface;
   type IIterator_ICoreInputViewOcclusion is access all IIterator_ICoreInputViewOcclusion_Interface'Class;
   type IIterator_ICoreInputViewOcclusion_Ptr is access all IIterator_ICoreInputViewOcclusion;
   type IIterable_ICoreInputViewOcclusion_Interface;
   type IIterable_ICoreInputViewOcclusion is access all IIterable_ICoreInputViewOcclusion_Interface'Class;
   type IIterable_ICoreInputViewOcclusion_Ptr is access all IIterable_ICoreInputViewOcclusion;
   type IVectorView_ICoreInputViewOcclusion_Interface;
   type IVectorView_ICoreInputViewOcclusion is access all IVectorView_ICoreInputViewOcclusion_Interface'Class;
   type IVectorView_ICoreInputViewOcclusion_Ptr is access all IVectorView_ICoreInputViewOcclusion;
   
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
   
   IID_ICoreInputViewOcclusion : aliased constant Windows.IID := (3426143750, 14437, 16759, (181, 245, 139, 101, 224, 185, 206, 132 ));
   
   type ICoreInputViewOcclusion_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OccludingRect
   (
      This       : access ICoreInputViewOcclusion_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_OcclusionKind
   (
      This       : access ICoreInputViewOcclusion_Interface
      ; RetVal : access Windows.UI.ViewManagement.Core.CoreInputViewOcclusionKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreInputView : aliased constant Windows.IID := (3346058618, 28673, 19506, (191, 148, 37, 193, 245, 84, 203, 241 ));
   
   type ICoreInputView_Interface is interface and Windows.IInspectable_Interface;
   
   function add_OcclusionsChanged
   (
      This       : access ICoreInputView_Interface
      ; handler : TypedEventHandler_ICoreInputView_add_OcclusionsChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_OcclusionsChanged
   (
      This       : access ICoreInputView_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function GetCoreInputViewOcclusions
   (
      This       : access ICoreInputView_Interface
      ; RetVal : access Windows.UI.ViewManagement.Core.IVectorView_ICoreInputViewOcclusion -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryShowPrimaryView
   (
      This       : access ICoreInputView_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryHidePrimaryView
   (
      This       : access ICoreInputView_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreInputViewStatics : aliased constant Windows.IID := (2107348941, 60862, 18895, (165, 79, 51, 125, 224, 82, 144, 127 ));
   
   type ICoreInputViewStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access ICoreInputViewStatics_Interface
      ; RetVal : access Windows.UI.ViewManagement.Core.ICoreInputView
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreInputViewOcclusionsChangedEventArgs : aliased constant Windows.IID := (3188729832, 46062, 19959, (149, 84, 137, 205, 198, 96, 130, 194 ));
   
   type ICoreInputViewOcclusionsChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Occlusions
   (
      This       : access ICoreInputViewOcclusionsChangedEventArgs_Interface
      ; RetVal : access Windows.UI.ViewManagement.Core.IVectorView_ICoreInputViewOcclusion -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Handled
   (
      This       : access ICoreInputViewOcclusionsChangedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access ICoreInputViewOcclusionsChangedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ICoreInputViewOcclusion : aliased constant Windows.IID := (1538618196, 20288, 24307, (165, 209, 106, 96, 73, 249, 5, 161 ));
   
   type IIterator_ICoreInputViewOcclusion_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ICoreInputViewOcclusion_Interface
      ; RetVal : access Windows.UI.ViewManagement.Core.ICoreInputViewOcclusion
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ICoreInputViewOcclusion_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ICoreInputViewOcclusion_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ICoreInputViewOcclusion_Interface
      ; items : Windows.UI.ViewManagement.Core.ICoreInputViewOcclusion_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ICoreInputViewOcclusion : aliased constant Windows.IID := (168924555, 25562, 21862, (145, 58, 24, 5, 80, 218, 210, 106 ));
   
   type IIterable_ICoreInputViewOcclusion_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ICoreInputViewOcclusion_Interface
      ; RetVal : access Windows.UI.ViewManagement.Core.IIterator_ICoreInputViewOcclusion
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_ICoreInputViewOcclusion : aliased constant Windows.IID := (3767940472, 41542, 22144, (134, 209, 39, 81, 148, 35, 226, 18 ));
   
   type IVectorView_ICoreInputViewOcclusion_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ICoreInputViewOcclusion_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.ViewManagement.Core.ICoreInputViewOcclusion
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ICoreInputViewOcclusion_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ICoreInputViewOcclusion_Interface
      ; value : Windows.UI.ViewManagement.Core.ICoreInputViewOcclusion
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ICoreInputViewOcclusion_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.ViewManagement.Core.ICoreInputViewOcclusion_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreInputView_add_OcclusionsChanged : aliased constant Windows.IID := (1524551428, 60881, 20787, (171, 199, 88, 42, 2, 127, 9, 187 ));
   
   type TypedEventHandler_ICoreInputView_add_OcclusionsChanged_Interface(Callback : access procedure (sender : Windows.UI.ViewManagement.Core.ICoreInputView ; args : Windows.UI.ViewManagement.Core.ICoreInputViewOcclusionsChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreInputView_add_OcclusionsChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreInputView_add_OcclusionsChanged_Interface
      ; sender : Windows.UI.ViewManagement.Core.ICoreInputView
      ; args : Windows.UI.ViewManagement.Core.ICoreInputViewOcclusionsChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype CoreInputView is Windows.UI.ViewManagement.Core.ICoreInputView;
   subtype CoreInputViewOcclusionsChangedEventArgs is Windows.UI.ViewManagement.Core.ICoreInputViewOcclusionsChangedEventArgs;
   subtype CoreInputViewOcclusion is Windows.UI.ViewManagement.Core.ICoreInputViewOcclusion;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetForCurrentView
   return Windows.UI.ViewManagement.Core.ICoreInputView;
   

end;
