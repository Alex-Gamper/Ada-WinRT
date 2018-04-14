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
with Windows.UI.Xaml.Controls.Primitives;
with Windows.UI.Xaml.Controls;
with Windows.UI.Xaml.Automation;
with Windows.UI.Xaml.Automation.Provider;
with Windows.UI.Xaml;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Xaml.Automation.Peers is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateInstance
   (
      type_x : Windows.UI.Xaml.Automation.AnnotationType
   )
   return Windows.UI.Xaml.Automation.Peers.IAutomationPeerAnnotation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.AutomationPeerAnnotation");
      m_Factory     : Windows.UI.Xaml.Automation.Peers.IAutomationPeerAnnotationFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IAutomationPeerAnnotation := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPeerAnnotationFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(type_x, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithPeerParameter
   (
      type_x : Windows.UI.Xaml.Automation.AnnotationType
      ; peer : Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.UI.Xaml.Automation.Peers.IAutomationPeerAnnotation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.AutomationPeerAnnotation");
      m_Factory     : Windows.UI.Xaml.Automation.Peers.IAutomationPeerAnnotationFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IAutomationPeerAnnotation := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPeerAnnotationFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithPeerParameter(type_x, peer, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IAutoSuggestBox
   )
   return Windows.UI.Xaml.Automation.Peers.IAutoSuggestBoxAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.AutoSuggestBoxAutomationPeer");
      m_Factory     : Windows.UI.Xaml.Automation.Peers.IAutoSuggestBoxAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IAutoSuggestBoxAutomationPeer := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutoSuggestBoxAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IPivotItem
   )
   return Windows.UI.Xaml.Automation.Peers.IPivotItemAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.PivotItemAutomationPeer");
      m_Factory     : Windows.UI.Xaml.Automation.Peers.IPivotItemAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IPivotItemAutomationPeer := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPivotItemAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithParentAndItem
   (
      item : Windows.Object
      ; parent : Windows.UI.Xaml.Automation.Peers.IPivotAutomationPeer
   )
   return Windows.UI.Xaml.Automation.Peers.IPivotItemDataAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.PivotItemDataAutomationPeer");
      m_Factory     : Windows.UI.Xaml.Automation.Peers.IPivotItemDataAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IPivotItemDataAutomationPeer := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPivotItemDataAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithParentAndItem(item, parent, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IPivot
   )
   return Windows.UI.Xaml.Automation.Peers.IPivotAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.PivotAutomationPeer");
      m_Factory     : Windows.UI.Xaml.Automation.Peers.IPivotAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IPivotAutomationPeer := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPivotAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IAutomationPeerOverrides_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IAutomationPeer , Windows.IUnknown); 
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IAutomationPeerOverrides or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            if riid.all = IID_IAutomationPeer then
               pvObject.all := Convert(This.m_IAutomationPeer);
               Hr := S_OK;
            else
               Hr := E_NOINTERFACE;
            end if;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IAutomationPeerOverrides_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IAutomationPeerOverrides_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.IAutomationPeerOverrides");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IAutomationPeerOverrides_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function GetPatternCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; patternInterface : Windows.UI.Xaml.Automation.Peers.PatternInterface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetAcceleratorKeyCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetAccessKeyCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetAutomationControlTypeCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.AutomationControlType
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetAutomationIdCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetBoundingRectangleCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetChildrenCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IVector_IAutomationPeer
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetClassNameCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetClickablePointCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetHelpTextCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetItemStatusCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetItemTypeCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetLabeledByCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetLocalizedControlTypeCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetNameCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetOrientationCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.AutomationOrientation
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function HasKeyboardFocusCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function IsContentElementCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function IsControlElementCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function IsEnabledCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function IsKeyboardFocusableCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function IsOffscreenCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function IsPasswordCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function IsRequiredForFormCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function SetFocusCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetPeerFromPointCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; point : Windows.Foundation.Point
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetLiveSettingCore
   (
      This       : access IAutomationPeerOverrides_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.AutomationLiveSetting
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IAutomationPeerOverrides2_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IAutomationPeer , Windows.IUnknown); 
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IAutomationPeerOverrides2 or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            if riid.all = IID_IAutomationPeer then
               pvObject.all := Convert(This.m_IAutomationPeer);
               Hr := S_OK;
            else
               Hr := E_NOINTERFACE;
            end if;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IAutomationPeerOverrides2_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IAutomationPeerOverrides2_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IAutomationPeerOverrides2_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IAutomationPeerOverrides2_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.IAutomationPeerOverrides2");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IAutomationPeerOverrides2_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function ShowContextMenuCore
   (
      This       : access IAutomationPeerOverrides2_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetControlledPeersCore
   (
      This       : access IAutomationPeerOverrides2_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IVectorView_IAutomationPeer
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IAutomationPeer , Windows.IUnknown); 
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IAutomationPeerOverrides3 or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            if riid.all = IID_IAutomationPeer then
               pvObject.all := Convert(This.m_IAutomationPeer);
               Hr := S_OK;
            else
               Hr := E_NOINTERFACE;
            end if;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.IAutomationPeerOverrides3");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function NavigateCore
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl
      ; direction : Windows.UI.Xaml.Automation.Peers.AutomationNavigationDirection
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetElementFromPointCore
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl
      ; pointInWindowCoordinates : Windows.Foundation.Point
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetFocusedElementCore
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetAnnotationsCore
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IVector_IAutomationPeerAnnotation
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetPositionInSetCore
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetSizeOfSetCore
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetLevelCore
   (
      This       : access IAutomationPeerOverrides3_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IAutomationPeer_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IAutomationPeer or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IAutomationPeer_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IAutomationPeer_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IAutomationPeer_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IAutomationPeer_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.IAutomationPeer");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IAutomationPeer_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_EventsSource
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_EventsSource
   (
      This       : access IAutomationPeer_Interface_Impl
      ; value : Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetPattern
   (
      This       : access IAutomationPeer_Interface_Impl
      ; patternInterface : Windows.UI.Xaml.Automation.Peers.PatternInterface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function RaiseAutomationEvent
   (
      This       : access IAutomationPeer_Interface_Impl
      ; eventId : Windows.UI.Xaml.Automation.Peers.AutomationEvents
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function RaisePropertyChangedEvent
   (
      This       : access IAutomationPeer_Interface_Impl
      ; automationProperty : Windows.UI.Xaml.Automation.IAutomationProperty
      ; oldValue : Windows.Object
      ; newValue : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetAcceleratorKey
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetAccessKey
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetAutomationControlType
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.AutomationControlType
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetAutomationId
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetBoundingRectangle
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetChildren
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IVector_IAutomationPeer
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetClassName
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetClickablePoint
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetHelpText
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetItemStatus
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetItemType
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetLabeledBy
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetLocalizedControlType
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetName
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetOrientation
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.AutomationOrientation
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function HasKeyboardFocus
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function IsContentElement
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function IsControlElement
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function IsEnabled
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function IsKeyboardFocusable
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function IsOffscreen
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function IsPassword
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function IsRequiredForForm
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function SetFocus
   (
      This       : access IAutomationPeer_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetParent
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function InvalidatePeer
   (
      This       : access IAutomationPeer_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetPeerFromPoint
   (
      This       : access IAutomationPeer_Interface_Impl
      ; point : Windows.Foundation.Point
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetLiveSetting
   (
      This       : access IAutomationPeer_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.AutomationLiveSetting
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function ListenerExists
   (
      eventId : Windows.UI.Xaml.Automation.Peers.AutomationEvents
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.AutomationPeer");
      m_Factory     : IAutomationPeerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPeerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ListenerExists(eventId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.AutomationPeer");
      m_Factory     : IAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GenerateRawElementProviderRuntimeId
   return Windows.UI.Xaml.Automation.Peers.RawElementProviderRuntimeId is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.AutomationPeer");
      m_Factory     : IAutomationPeerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.RawElementProviderRuntimeId;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPeerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GenerateRawElementProviderRuntimeId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TypeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.AutomationPeerAnnotation");
      m_Factory     : IAutomationPeerAnnotationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPeerAnnotationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TypeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PeerProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.AutomationPeerAnnotation");
      m_Factory     : IAutomationPeerAnnotationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPeerAnnotationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PeerProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.IFrameworkElement
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IFrameworkElementAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.FrameworkElementAutomationPeer");
      m_Factory     : IFrameworkElementAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IFrameworkElementAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromElement
   (
      element : Windows.UI.Xaml.IUIElement
   )
   return Windows.UI.Xaml.Automation.Peers.IAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.FrameworkElementAutomationPeer");
      m_Factory     : IFrameworkElementAutomationPeerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementAutomationPeerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromElement(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePeerForElement
   (
      element : Windows.UI.Xaml.IUIElement
   )
   return Windows.UI.Xaml.Automation.Peers.IAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.FrameworkElementAutomationPeer");
      m_Factory     : IFrameworkElementAutomationPeerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementAutomationPeerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreatePeerForElement(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.Primitives.IColorSpectrum
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IColorSpectrumAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ColorSpectrumAutomationPeer");
      m_Factory     : IColorSpectrumAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IColorSpectrumAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorSpectrumAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IPersonPicture
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IPersonPictureAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.PersonPictureAutomationPeer");
      m_Factory     : IPersonPictureAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IPersonPictureAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPersonPictureAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IRatingControl
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IRatingControlAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.RatingControlAutomationPeer");
      m_Factory     : IRatingControlAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IRatingControlAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRatingControlAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.Primitives.IButtonBase
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IButtonBaseAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ButtonBaseAutomationPeer");
      m_Factory     : IButtonBaseAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IButtonBaseAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IButtonBaseAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.ICaptureElement
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.ICaptureElementAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.CaptureElementAutomationPeer");
      m_Factory     : ICaptureElementAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.ICaptureElementAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICaptureElementAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IComboBoxItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IComboBoxItemAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ComboBoxItemAutomationPeer");
      m_Factory     : IComboBoxItemAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IComboBoxItemAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IComboBoxItemAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IFlipViewItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IFlipViewItemAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.FlipViewItemAutomationPeer");
      m_Factory     : IFlipViewItemAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IFlipViewItemAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFlipViewItemAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IGroupItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IGroupItemAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.GroupItemAutomationPeer");
      m_Factory     : IGroupItemAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IGroupItemAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGroupItemAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IImage
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IImageAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ImageAutomationPeer");
      m_Factory     : IImageAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IImageAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IImageAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IListBoxItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IListBoxItemAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ListBoxItemAutomationPeer");
      m_Factory     : IListBoxItemAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IListBoxItemAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IListBoxItemAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IMediaTransportControls
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IMediaTransportControlsAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.MediaTransportControlsAutomationPeer");
      m_Factory     : IMediaTransportControlsAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IMediaTransportControlsAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaTransportControlsAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IPasswordBox
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IPasswordBoxAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.PasswordBoxAutomationPeer");
      m_Factory     : IPasswordBoxAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IPasswordBoxAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPasswordBoxAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IProgressRing
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IProgressRingAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ProgressRingAutomationPeer");
      m_Factory     : IProgressRingAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IProgressRingAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProgressRingAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IRichTextBlock
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IRichTextBlockAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.RichTextBlockAutomationPeer");
      m_Factory     : IRichTextBlockAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IRichTextBlockAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRichTextBlockAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IRichTextBlockOverflow
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IRichTextBlockOverflowAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.RichTextBlockOverflowAutomationPeer");
      m_Factory     : IRichTextBlockOverflowAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IRichTextBlockOverflowAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRichTextBlockOverflowAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.ISettingsFlyout
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.ISettingsFlyoutAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.SettingsFlyoutAutomationPeer");
      m_Factory     : ISettingsFlyoutAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.ISettingsFlyoutAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISettingsFlyoutAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.ITextBlock
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.ITextBlockAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.TextBlockAutomationPeer");
      m_Factory     : ITextBlockAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.ITextBlockAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITextBlockAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.ITextBox
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.ITextBoxAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.TextBoxAutomationPeer");
      m_Factory     : ITextBoxAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.ITextBoxAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITextBoxAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.Primitives.IThumb
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IThumbAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ThumbAutomationPeer");
      m_Factory     : IThumbAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IThumbAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IThumbAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IDatePicker
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IDatePickerAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.DatePickerAutomationPeer");
      m_Factory     : IDatePickerAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IDatePickerAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDatePickerAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IFlyoutPresenter
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IFlyoutPresenterAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.FlyoutPresenterAutomationPeer");
      m_Factory     : IFlyoutPresenterAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IFlyoutPresenterAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFlyoutPresenterAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IGridViewItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IGridViewItemAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.GridViewItemAutomationPeer");
      m_Factory     : IGridViewItemAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IGridViewItemAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGridViewItemAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IHub
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IHubAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.HubAutomationPeer");
      m_Factory     : IHubAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IHubAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHubAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IListViewBaseHeaderItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IListViewBaseHeaderItemAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ListViewBaseHeaderItemAutomationPeer");
      m_Factory     : IListViewBaseHeaderItemAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IListViewBaseHeaderItemAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IListViewBaseHeaderItemAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IListViewItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IListViewItemAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ListViewItemAutomationPeer");
      m_Factory     : IListViewItemAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IListViewItemAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IListViewItemAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.INavigationViewItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.INavigationViewItemAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.NavigationViewItemAutomationPeer");
      m_Factory     : INavigationViewItemAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.INavigationViewItemAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INavigationViewItemAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IMediaElement
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IMediaElementAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.MediaElementAutomationPeer");
      m_Factory     : IMediaElementAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IMediaElementAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaElementAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IMediaPlayerElement
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IMediaPlayerElementAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.MediaPlayerElementAutomationPeer");
      m_Factory     : IMediaPlayerElementAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IMediaPlayerElementAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaPlayerElementAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IRichEditBox
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IRichEditBoxAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.RichEditBoxAutomationPeer");
      m_Factory     : IRichEditBoxAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IRichEditBoxAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRichEditBoxAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.ISearchBox
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.ISearchBoxAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.SearchBoxAutomationPeer");
      m_Factory     : ISearchBoxAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.ISearchBoxAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISearchBoxAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.ITimePicker
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.ITimePickerAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.TimePickerAutomationPeer");
      m_Factory     : ITimePickerAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.ITimePickerAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITimePickerAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IGridViewHeaderItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IGridViewHeaderItemAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.GridViewHeaderItemAutomationPeer");
      m_Factory     : IGridViewHeaderItemAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IGridViewHeaderItemAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGridViewHeaderItemAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IListViewHeaderItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IListViewHeaderItemAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ListViewHeaderItemAutomationPeer");
      m_Factory     : IListViewHeaderItemAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IListViewHeaderItemAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IListViewHeaderItemAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IButton
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IButtonAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ButtonAutomationPeer");
      m_Factory     : IButtonAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IButtonAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IButtonAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IHyperlinkButton
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IHyperlinkButtonAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.HyperlinkButtonAutomationPeer");
      m_Factory     : IHyperlinkButtonAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IHyperlinkButtonAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHyperlinkButtonAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.Primitives.IRepeatButton
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IRepeatButtonAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.RepeatButtonAutomationPeer");
      m_Factory     : IRepeatButtonAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IRepeatButtonAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRepeatButtonAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IMenuFlyoutItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IMenuFlyoutItemAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.MenuFlyoutItemAutomationPeer");
      m_Factory     : IMenuFlyoutItemAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IMenuFlyoutItemAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMenuFlyoutItemAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IAppBarButton
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IAppBarButtonAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.AppBarButtonAutomationPeer");
      m_Factory     : IAppBarButtonAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IAppBarButtonAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppBarButtonAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IItemsControl
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IItemsControlAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ItemsControlAutomationPeer");
      m_Factory     : IItemsControlAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IItemsControlAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IItemsControlAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IMenuFlyoutPresenter
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IMenuFlyoutPresenterAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.MenuFlyoutPresenterAutomationPeer");
      m_Factory     : IMenuFlyoutPresenterAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IMenuFlyoutPresenterAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMenuFlyoutPresenterAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.Primitives.IRangeBase
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IRangeBaseAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.RangeBaseAutomationPeer");
      m_Factory     : IRangeBaseAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IRangeBaseAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRangeBaseAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IProgressBar
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IProgressBarAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ProgressBarAutomationPeer");
      m_Factory     : IProgressBarAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IProgressBarAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProgressBarAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.Primitives.IScrollBar
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IScrollBarAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ScrollBarAutomationPeer");
      m_Factory     : IScrollBarAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IScrollBarAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IScrollBarAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.ISlider
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.ISliderAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.SliderAutomationPeer");
      m_Factory     : ISliderAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.ISliderAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISliderAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.Primitives.IColorPickerSlider
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IColorPickerSliderAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ColorPickerSliderAutomationPeer");
      m_Factory     : IColorPickerSliderAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IColorPickerSliderAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorPickerSliderAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IHubSection
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IHubSectionAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.HubSectionAutomationPeer");
      m_Factory     : IHubSectionAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IHubSectionAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHubSectionAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IScrollViewer
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IScrollViewerAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ScrollViewerAutomationPeer");
      m_Factory     : IScrollViewerAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IScrollViewerAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IScrollViewerAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.Primitives.ISelector
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.ISelectorAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.SelectorAutomationPeer");
      m_Factory     : ISelectorAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.ISelectorAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISelectorAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IFlipView
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IFlipViewAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.FlipViewAutomationPeer");
      m_Factory     : IFlipViewAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IFlipViewAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFlipViewAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IListBox
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IListBoxAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ListBoxAutomationPeer");
      m_Factory     : IListBoxAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IListBoxAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IListBoxAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IListViewBase
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IListViewBaseAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ListViewBaseAutomationPeer");
      m_Factory     : IListViewBaseAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IListViewBaseAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IListViewBaseAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IGridView
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IGridViewAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.GridViewAutomationPeer");
      m_Factory     : IGridViewAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IGridViewAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGridViewAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IListView
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IListViewAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ListViewAutomationPeer");
      m_Factory     : IListViewAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IListViewAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IListViewAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.ISemanticZoom
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.ISemanticZoomAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.SemanticZoomAutomationPeer");
      m_Factory     : ISemanticZoomAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.ISemanticZoomAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISemanticZoomAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IToggleSwitch
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IToggleSwitchAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ToggleSwitchAutomationPeer");
      m_Factory     : IToggleSwitchAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IToggleSwitchAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IToggleSwitchAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.Primitives.IToggleButton
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IToggleButtonAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ToggleButtonAutomationPeer");
      m_Factory     : IToggleButtonAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IToggleButtonAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IToggleButtonAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.ICheckBox
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.ICheckBoxAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.CheckBoxAutomationPeer");
      m_Factory     : ICheckBoxAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.ICheckBoxAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICheckBoxAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IRadioButton
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IRadioButtonAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.RadioButtonAutomationPeer");
      m_Factory     : IRadioButtonAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IRadioButtonAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRadioButtonAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IToggleMenuFlyoutItem
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IToggleMenuFlyoutItemAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ToggleMenuFlyoutItemAutomationPeer");
      m_Factory     : IToggleMenuFlyoutItemAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IToggleMenuFlyoutItemAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IToggleMenuFlyoutItemAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IAppBarToggleButton
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IAppBarToggleButtonAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.AppBarToggleButtonAutomationPeer");
      m_Factory     : IAppBarToggleButtonAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IAppBarToggleButtonAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppBarToggleButtonAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithParentAndItem
   (
      item : Windows.Object
      ; parent : Windows.UI.Xaml.Automation.Peers.IItemsControlAutomationPeer
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IItemAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ItemAutomationPeer");
      m_Factory     : IItemAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IItemAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IItemAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithParentAndItem(item, parent, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithParentAndItem
   (
      item : Windows.Object
      ; parent : Windows.UI.Xaml.Automation.Peers.ISelectorAutomationPeer
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.ISelectorItemAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.SelectorItemAutomationPeer");
      m_Factory     : ISelectorItemAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.ISelectorItemAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISelectorItemAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithParentAndItem(item, parent, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithParentAndItem
   (
      item : Windows.Object
      ; parent : Windows.UI.Xaml.Automation.Peers.IComboBoxAutomationPeer
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IComboBoxItemDataAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ComboBoxItemDataAutomationPeer");
      m_Factory     : IComboBoxItemDataAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IComboBoxItemDataAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IComboBoxItemDataAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithParentAndItem(item, parent, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithParentAndItem
   (
      item : Windows.Object
      ; parent : Windows.UI.Xaml.Automation.Peers.IFlipViewAutomationPeer
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IFlipViewItemDataAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.FlipViewItemDataAutomationPeer");
      m_Factory     : IFlipViewItemDataAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IFlipViewItemDataAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFlipViewItemDataAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithParentAndItem(item, parent, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithParentAndItem
   (
      item : Windows.Object
      ; parent : Windows.UI.Xaml.Automation.Peers.IListBoxAutomationPeer
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IListBoxItemDataAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ListBoxItemDataAutomationPeer");
      m_Factory     : IListBoxItemDataAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IListBoxItemDataAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IListBoxItemDataAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithParentAndItem(item, parent, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithParentAndItem
   (
      item : Windows.Object
      ; parent : Windows.UI.Xaml.Automation.Peers.IGridViewAutomationPeer
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IGridViewItemDataAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.GridViewItemDataAutomationPeer");
      m_Factory     : IGridViewItemDataAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IGridViewItemDataAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGridViewItemDataAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithParentAndItem(item, parent, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithParentAndItem
   (
      item : Windows.Object
      ; parent : Windows.UI.Xaml.Automation.Peers.IListViewBaseAutomationPeer
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IListViewItemDataAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ListViewItemDataAutomationPeer");
      m_Factory     : IListViewItemDataAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IListViewItemDataAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IListViewItemDataAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithParentAndItem(item, parent, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IComboBox
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IComboBoxAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.ComboBoxAutomationPeer");
      m_Factory     : IComboBoxAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IComboBoxAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IComboBoxAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithOwner
   (
      owner : Windows.UI.Xaml.Controls.IAppBar
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Automation.Peers.IAppBarAutomationPeer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.Peers.AppBarAutomationPeer");
      m_Factory     : IAppBarAutomationPeerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.IAppBarAutomationPeer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppBarAutomationPeerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithOwner(owner, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
