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
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Devices.Perception;
with Windows.Graphics.Imaging;
with Windows.Media;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Perception.Provider is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access PerceptionStartFaceAuthenticationHandler_Interface
      ; sender : Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup(sender));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access PerceptionStopFaceAuthenticationHandler_Interface
      ; sender : Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup(sender));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create return Windows.Devices.Perception.Provider.IPerceptionFrameProviderInfo is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.PerceptionFrameProviderInfo");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.Perception.Provider.IPerceptionFrameProviderInfo) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Perception.Provider.IID_IPerceptionFrameProviderInfo'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      ids : Windows.Foundation.Collections.IIterable_String
      ; startHandler : Windows.Devices.Perception.Provider.PerceptionStartFaceAuthenticationHandler
      ; stopHandler : Windows.Devices.Perception.Provider.PerceptionStopFaceAuthenticationHandler
   )
   return Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.PerceptionFaceAuthenticationGroup");
      m_Factory     : Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroupFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionFaceAuthenticationGroupFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(ids, startHandler, stopHandler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      ids : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Devices.Perception.Provider.IPerceptionControlGroup is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.PerceptionControlGroup");
      m_Factory     : Windows.Devices.Perception.Provider.IPerceptionControlGroupFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Perception.Provider.IPerceptionControlGroup := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionControlGroupFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(ids, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      relativeLocations : Windows.Devices.Perception.Provider.IIterable_IPerceptionCorrelation
   )
   return Windows.Devices.Perception.Provider.IPerceptionCorrelationGroup is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.PerceptionCorrelationGroup");
      m_Factory     : Windows.Devices.Perception.Provider.IPerceptionCorrelationGroupFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Perception.Provider.IPerceptionCorrelationGroup := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionCorrelationGroupFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(relativeLocations, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      targetId : Windows.String
      ; position : Windows.Foundation.Numerics.Vector3
      ; orientation : Windows.Foundation.Numerics.Quaternion
   )
   return Windows.Devices.Perception.Provider.IPerceptionCorrelation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.PerceptionCorrelation");
      m_Factory     : Windows.Devices.Perception.Provider.IPerceptionCorrelationFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Perception.Provider.IPerceptionCorrelation := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionCorrelationFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(targetId, position, orientation, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      maxOutstandingFrameCountForWrite : Windows.UInt32
      ; format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; resolution : Windows.Foundation.Size
      ; alpha : Windows.Graphics.Imaging.BitmapAlphaMode
   )
   return Windows.Devices.Perception.Provider.IPerceptionVideoFrameAllocator is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.PerceptionVideoFrameAllocator");
      m_Factory     : Windows.Devices.Perception.Provider.IPerceptionVideoFrameAllocatorFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Perception.Provider.IPerceptionVideoFrameAllocator := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionVideoFrameAllocatorFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(maxOutstandingFrameCountForWrite, format, resolution, alpha, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   procedure RegisterFrameProviderInfo
   (
      manager : Windows.Devices.Perception.Provider.IPerceptionFrameProviderManager
      ; frameProviderInfo : Windows.Devices.Perception.Provider.IPerceptionFrameProviderInfo
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.PerceptionFrameProviderManagerService");
      m_Factory     : IPerceptionFrameProviderManagerServiceStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionFrameProviderManagerServiceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RegisterFrameProviderInfo(manager, frameProviderInfo);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure UnregisterFrameProviderInfo
   (
      manager : Windows.Devices.Perception.Provider.IPerceptionFrameProviderManager
      ; frameProviderInfo : Windows.Devices.Perception.Provider.IPerceptionFrameProviderInfo
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.PerceptionFrameProviderManagerService");
      m_Factory     : IPerceptionFrameProviderManagerServiceStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionFrameProviderManagerServiceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.UnregisterFrameProviderInfo(manager, frameProviderInfo);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure RegisterFaceAuthenticationGroup
   (
      manager : Windows.Devices.Perception.Provider.IPerceptionFrameProviderManager
      ; faceAuthenticationGroup : Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.PerceptionFrameProviderManagerService");
      m_Factory     : IPerceptionFrameProviderManagerServiceStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionFrameProviderManagerServiceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RegisterFaceAuthenticationGroup(manager, faceAuthenticationGroup);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure UnregisterFaceAuthenticationGroup
   (
      manager : Windows.Devices.Perception.Provider.IPerceptionFrameProviderManager
      ; faceAuthenticationGroup : Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.PerceptionFrameProviderManagerService");
      m_Factory     : IPerceptionFrameProviderManagerServiceStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionFrameProviderManagerServiceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.UnregisterFaceAuthenticationGroup(manager, faceAuthenticationGroup);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure RegisterControlGroup
   (
      manager : Windows.Devices.Perception.Provider.IPerceptionFrameProviderManager
      ; controlGroup : Windows.Devices.Perception.Provider.IPerceptionControlGroup
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.PerceptionFrameProviderManagerService");
      m_Factory     : IPerceptionFrameProviderManagerServiceStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionFrameProviderManagerServiceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RegisterControlGroup(manager, controlGroup);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure UnregisterControlGroup
   (
      manager : Windows.Devices.Perception.Provider.IPerceptionFrameProviderManager
      ; controlGroup : Windows.Devices.Perception.Provider.IPerceptionControlGroup
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.PerceptionFrameProviderManagerService");
      m_Factory     : IPerceptionFrameProviderManagerServiceStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionFrameProviderManagerServiceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.UnregisterControlGroup(manager, controlGroup);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure RegisterCorrelationGroup
   (
      manager : Windows.Devices.Perception.Provider.IPerceptionFrameProviderManager
      ; correlationGroup : Windows.Devices.Perception.Provider.IPerceptionCorrelationGroup
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.PerceptionFrameProviderManagerService");
      m_Factory     : IPerceptionFrameProviderManagerServiceStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionFrameProviderManagerServiceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RegisterCorrelationGroup(manager, correlationGroup);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure UnregisterCorrelationGroup
   (
      manager : Windows.Devices.Perception.Provider.IPerceptionFrameProviderManager
      ; correlationGroup : Windows.Devices.Perception.Provider.IPerceptionCorrelationGroup
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.PerceptionFrameProviderManagerService");
      m_Factory     : IPerceptionFrameProviderManagerServiceStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionFrameProviderManagerServiceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.UnregisterCorrelationGroup(manager, correlationGroup);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure UpdateAvailabilityForProvider
   (
      provider : Windows.Devices.Perception.Provider.IPerceptionFrameProvider
      ; available : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.PerceptionFrameProviderManagerService");
      m_Factory     : IPerceptionFrameProviderManagerServiceStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionFrameProviderManagerServiceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.UpdateAvailabilityForProvider(provider, available);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure PublishFrameForProvider
   (
      provider : Windows.Devices.Perception.Provider.IPerceptionFrameProvider
      ; frame : Windows.Devices.Perception.Provider.IPerceptionFrame
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.PerceptionFrameProviderManagerService");
      m_Factory     : IPerceptionFrameProviderManagerServiceStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionFrameProviderManagerServiceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.PublishFrameForProvider(provider, frame);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_Color
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.KnownPerceptionFrameKind");
      m_Factory     : IKnownPerceptionFrameKindStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionFrameKindStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Color(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Depth
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.KnownPerceptionFrameKind");
      m_Factory     : IKnownPerceptionFrameKindStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionFrameKindStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Depth(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Infrared
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.KnownPerceptionFrameKind");
      m_Factory     : IKnownPerceptionFrameKindStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionFrameKindStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Infrared(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
