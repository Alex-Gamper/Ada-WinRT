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
with Windows.UI.Composition;
with Windows.UI.Input;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Composition.Interactions is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function Create
   (
      compositor : Windows.UI.Composition.ICompositor
   )
   return Windows.UI.Composition.Interactions.ICompositionConditionalValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Composition.Interactions.CompositionConditionalValue");
      m_Factory     : ICompositionConditionalValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Composition.Interactions.ICompositionConditionalValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICompositionConditionalValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(compositor, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      compositor : Windows.UI.Composition.ICompositor
   )
   return Windows.UI.Composition.Interactions.IInteractionTracker is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Composition.Interactions.InteractionTracker");
      m_Factory     : IInteractionTrackerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Composition.Interactions.IInteractionTracker;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInteractionTrackerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(compositor, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithOwner
   (
      compositor : Windows.UI.Composition.ICompositor
      ; owner : Windows.UI.Composition.Interactions.IInteractionTrackerOwner
   )
   return Windows.UI.Composition.Interactions.IInteractionTracker is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Composition.Interactions.InteractionTracker");
      m_Factory     : IInteractionTrackerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Composition.Interactions.IInteractionTracker;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInteractionTrackerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithOwner(compositor, owner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      compositor : Windows.UI.Composition.ICompositor
   )
   return Windows.UI.Composition.Interactions.IInteractionTrackerInertiaNaturalMotion is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Composition.Interactions.InteractionTrackerInertiaNaturalMotion");
      m_Factory     : IInteractionTrackerInertiaNaturalMotionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Composition.Interactions.IInteractionTrackerInertiaNaturalMotion;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInteractionTrackerInertiaNaturalMotionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(compositor, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      compositor : Windows.UI.Composition.ICompositor
   )
   return Windows.UI.Composition.Interactions.IInteractionTrackerInertiaRestingValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Composition.Interactions.InteractionTrackerInertiaRestingValue");
      m_Factory     : IInteractionTrackerInertiaRestingValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Composition.Interactions.IInteractionTrackerInertiaRestingValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInteractionTrackerInertiaRestingValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(compositor, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      compositor : Windows.UI.Composition.ICompositor
   )
   return Windows.UI.Composition.Interactions.IInteractionTrackerInertiaMotion is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Composition.Interactions.InteractionTrackerInertiaMotion");
      m_Factory     : IInteractionTrackerInertiaMotionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Composition.Interactions.IInteractionTrackerInertiaMotion;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInteractionTrackerInertiaMotionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(compositor, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      source : Windows.UI.Composition.IVisual
   )
   return Windows.UI.Composition.Interactions.IVisualInteractionSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Composition.Interactions.VisualInteractionSource");
      m_Factory     : IVisualInteractionSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Composition.Interactions.IVisualInteractionSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVisualInteractionSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(source, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      compositor : Windows.UI.Composition.ICompositor
   )
   return Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaNaturalMotion is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Composition.Interactions.InteractionTrackerVector2InertiaNaturalMotion");
      m_Factory     : IInteractionTrackerVector2InertiaNaturalMotionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaNaturalMotion;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInteractionTrackerVector2InertiaNaturalMotionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(compositor, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   

end;
