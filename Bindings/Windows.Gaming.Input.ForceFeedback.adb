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
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Gaming.Input.ForceFeedback is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ForceFeedbackLoadEffectResult_Interface
      ; asyncInfo : Windows.Gaming.Input.ForceFeedback.IAsyncOperation_ForceFeedbackLoadEffectResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateInstance
   (
      effectKind : Windows.Gaming.Input.ForceFeedback.ConditionForceEffectKind
   )
   return Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.ForceFeedback.ConditionForceEffect");
      m_Factory     : Windows.Gaming.Input.ForceFeedback.IConditionForceEffectFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IConditionForceEffectFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(effectKind, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      effectKind : Windows.Gaming.Input.ForceFeedback.PeriodicForceEffectKind
   )
   return Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.ForceFeedback.PeriodicForceEffect");
      m_Factory     : Windows.Gaming.Input.ForceFeedback.IPeriodicForceEffectFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeriodicForceEffectFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(effectKind, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create return Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.ForceFeedback.ConstantForceEffect");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Gaming.Input.ForceFeedback.IID_IForceFeedbackEffect'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create1 return Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.ForceFeedback.RampForceEffect");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Gaming.Input.ForceFeedback.IID_IForceFeedbackEffect'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
end;
