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
with Windows.UI;
with Windows.UI.Core;
with Windows.System;
with Windows.Graphics.DirectX;
with Windows.Graphics;
with Windows.Graphics.Effects;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Composition is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_ICompositionCapabilities_add_Changed_Interface
      ; sender : Windows.UI.Composition.ICompositionCapabilities
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Composition.ICompositionCapabilities(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICompositionCommitBatch_add_Completed_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Composition.ICompositionBatchCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Composition.ICompositionBatchCompletedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICompositionGraphicsDevice_add_RenderingDeviceReplaced_Interface
      ; sender : Windows.UI.Composition.ICompositionGraphicsDevice
      ; args : Windows.UI.Composition.IRenderingDeviceReplacedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Composition.ICompositionGraphicsDevice(sender), Windows.UI.Composition.IRenderingDeviceReplacedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICompositionScopedBatch_add_Completed_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Composition.ICompositionBatchCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Composition.ICompositionBatchCompletedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create
   (
      name : Windows.String
   )
   return Windows.UI.Composition.ICompositionEffectSourceParameter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Composition.CompositionEffectSourceParameter");
      m_Factory     : Windows.UI.Composition.ICompositionEffectSourceParameterFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Composition.ICompositionEffectSourceParameter := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICompositionEffectSourceParameterFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(name, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCompositor return Windows.UI.Composition.ICompositor is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Composition.Compositor");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Composition.ICompositor) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Composition.IID_ICompositor'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      source : Windows.Graphics.IGeometrySource2D
   )
   return Windows.UI.Composition.ICompositionPath is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Composition.CompositionPath");
      m_Factory     : Windows.UI.Composition.ICompositionPathFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Composition.ICompositionPath := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICompositionPathFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(source, RetVal'Access);
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
   
   function GetForCurrentView
   return Windows.UI.Composition.ICompositionCapabilities is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Composition.CompositionCapabilities");
      m_Factory     : ICompositionCapabilitiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Composition.ICompositionCapabilities;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICompositionCapabilitiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MaxGlobalPlaybackRate
   return Windows.Single is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Composition.Compositor");
      m_Factory     : ICompositorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Single;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICompositorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MaxGlobalPlaybackRate(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MinGlobalPlaybackRate
   return Windows.Single is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Composition.Compositor");
      m_Factory     : ICompositorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Single;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICompositorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MinGlobalPlaybackRate(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MaxPlaybackRate
   return Windows.Single is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Composition.AnimationController");
      m_Factory     : IAnimationControllerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Single;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAnimationControllerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MaxPlaybackRate(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MinPlaybackRate
   return Windows.Single is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Composition.AnimationController");
      m_Factory     : IAnimationControllerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Single;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAnimationControllerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MinPlaybackRate(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
