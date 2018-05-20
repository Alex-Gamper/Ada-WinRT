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
with Windows.Foundation.Numerics;
with Windows.Foundation;
package Windows.Gaming.Input.ForceFeedback is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type ConditionForceEffectKind is (
      Spring,
      Damper,
      Inertia,
      Friction
   );
   for ConditionForceEffectKind use (
      Spring => 0,
      Damper => 1,
      Inertia => 2,
      Friction => 3
   );
   for ConditionForceEffectKind'Size use 32;
   
   type ConditionForceEffectKind_Ptr is access ConditionForceEffectKind;
   
   type ForceFeedbackEffectAxes is (
      None,
      X,
      Y,
      Z
   );
   for ForceFeedbackEffectAxes use (
      None => 0,
      X => 1,
      Y => 2,
      Z => 4
   );
   for ForceFeedbackEffectAxes'Size use 32;
   
   type ForceFeedbackEffectAxes_Ptr is access ForceFeedbackEffectAxes;
   
   type ForceFeedbackEffectState is (
      Stopped,
      Running,
      Paused,
      Faulted
   );
   for ForceFeedbackEffectState use (
      Stopped => 0,
      Running => 1,
      Paused => 2,
      Faulted => 3
   );
   for ForceFeedbackEffectState'Size use 32;
   
   type ForceFeedbackEffectState_Ptr is access ForceFeedbackEffectState;
   
   type ForceFeedbackLoadEffectResult is (
      Succeeded,
      EffectStorageFull,
      EffectNotSupported
   );
   for ForceFeedbackLoadEffectResult use (
      Succeeded => 0,
      EffectStorageFull => 1,
      EffectNotSupported => 2
   );
   for ForceFeedbackLoadEffectResult'Size use 32;
   
   type ForceFeedbackLoadEffectResult_Ptr is access ForceFeedbackLoadEffectResult;
   
   type PeriodicForceEffectKind is (
      SquareWave,
      SineWave,
      TriangleWave,
      SawtoothWaveUp,
      SawtoothWaveDown
   );
   for PeriodicForceEffectKind use (
      SquareWave => 0,
      SineWave => 1,
      TriangleWave => 2,
      SawtoothWaveUp => 3,
      SawtoothWaveDown => 4
   );
   for PeriodicForceEffectKind'Size use 32;
   
   type PeriodicForceEffectKind_Ptr is access PeriodicForceEffectKind;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_ForceFeedbackLoadEffectResult_Interface;
   type AsyncOperationCompletedHandler_ForceFeedbackLoadEffectResult is access all AsyncOperationCompletedHandler_ForceFeedbackLoadEffectResult_Interface'Class;
   type AsyncOperationCompletedHandler_ForceFeedbackLoadEffectResult_Ptr is access all AsyncOperationCompletedHandler_ForceFeedbackLoadEffectResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IForceFeedbackEffect_Interface;
   type IForceFeedbackEffect is access all IForceFeedbackEffect_Interface'Class;
   type IForceFeedbackEffect_Ptr is access all IForceFeedbackEffect;
   type IConditionForceEffect_Interface;
   type IConditionForceEffect is access all IConditionForceEffect_Interface'Class;
   type IConditionForceEffect_Ptr is access all IConditionForceEffect;
   type IConditionForceEffectFactory_Interface;
   type IConditionForceEffectFactory is access all IConditionForceEffectFactory_Interface'Class;
   type IConditionForceEffectFactory_Ptr is access all IConditionForceEffectFactory;
   type IConstantForceEffect_Interface;
   type IConstantForceEffect is access all IConstantForceEffect_Interface'Class;
   type IConstantForceEffect_Ptr is access all IConstantForceEffect;
   type IPeriodicForceEffect_Interface;
   type IPeriodicForceEffect is access all IPeriodicForceEffect_Interface'Class;
   type IPeriodicForceEffect_Ptr is access all IPeriodicForceEffect;
   type IPeriodicForceEffectFactory_Interface;
   type IPeriodicForceEffectFactory is access all IPeriodicForceEffectFactory_Interface'Class;
   type IPeriodicForceEffectFactory_Ptr is access all IPeriodicForceEffectFactory;
   type IRampForceEffect_Interface;
   type IRampForceEffect is access all IRampForceEffect_Interface'Class;
   type IRampForceEffect_Ptr is access all IRampForceEffect;
   type IForceFeedbackMotor_Interface;
   type IForceFeedbackMotor is access all IForceFeedbackMotor_Interface'Class;
   type IForceFeedbackMotor_Ptr is access all IForceFeedbackMotor;
   type IAsyncOperation_ForceFeedbackLoadEffectResult_Interface;
   type IAsyncOperation_ForceFeedbackLoadEffectResult is access all IAsyncOperation_ForceFeedbackLoadEffectResult_Interface'Class;
   type IAsyncOperation_ForceFeedbackLoadEffectResult_Ptr is access all IAsyncOperation_ForceFeedbackLoadEffectResult;
   type IIterator_IForceFeedbackMotor_Interface;
   type IIterator_IForceFeedbackMotor is access all IIterator_IForceFeedbackMotor_Interface'Class;
   type IIterator_IForceFeedbackMotor_Ptr is access all IIterator_IForceFeedbackMotor;
   type IIterable_IForceFeedbackMotor_Interface;
   type IIterable_IForceFeedbackMotor is access all IIterable_IForceFeedbackMotor_Interface'Class;
   type IIterable_IForceFeedbackMotor_Ptr is access all IIterable_IForceFeedbackMotor;
   type IVectorView_IForceFeedbackMotor_Interface;
   type IVectorView_IForceFeedbackMotor is access all IVectorView_IForceFeedbackMotor_Interface'Class;
   type IVectorView_IForceFeedbackMotor_Ptr is access all IVectorView_IForceFeedbackMotor;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IForceFeedbackEffect : aliased constant Windows.IID := (2709502476, 10980, 18626, (128, 99, 234, 189, 7, 119, 203, 137 ));
   
   type IForceFeedbackEffect_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Gain
   (
      This       : access IForceFeedbackEffect_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Gain
   (
      This       : access IForceFeedbackEffect_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_State
   (
      This       : access IForceFeedbackEffect_Interface
      ; RetVal : access Windows.Gaming.Input.ForceFeedback.ForceFeedbackEffectState
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IForceFeedbackEffect_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IForceFeedbackEffect_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IConditionForceEffect : aliased constant Windows.IID := (852617832, 13973, 20073, (133, 192, 205, 25, 68, 24, 145, 64 ));
   
   type IConditionForceEffect_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Kind
   (
      This       : access IConditionForceEffect_Interface
      ; RetVal : access Windows.Gaming.Input.ForceFeedback.ConditionForceEffectKind
   )
   return Windows.HRESULT is abstract;
   
   function SetParameters
   (
      This       : access IConditionForceEffect_Interface
      ; direction : Windows.Foundation.Numerics.Vector3
      ; positiveCoefficient : Windows.Single
      ; negativeCoefficient : Windows.Single
      ; maxPositiveMagnitude : Windows.Single
      ; maxNegativeMagnitude : Windows.Single
      ; deadZone : Windows.Single
      ; bias : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IConditionForceEffectFactory : aliased constant Windows.IID := (2443809380, 6160, 20150, (167, 115, 191, 211, 184, 205, 219, 171 ));
   
   type IConditionForceEffectFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IConditionForceEffectFactory_Interface
      ; effectKind : Windows.Gaming.Input.ForceFeedback.ConditionForceEffectKind
      ; RetVal : access Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IConstantForceEffect : aliased constant Windows.IID := (2616852800, 62407, 16732, (176, 104, 15, 6, 135, 52, 188, 224 ));
   
   type IConstantForceEffect_Interface is interface and Windows.IInspectable_Interface;
   
   function SetParameters
   (
      This       : access IConstantForceEffect_Interface
      ; vector : Windows.Foundation.Numerics.Vector3
      ; duration : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function SetParametersWithEnvelope
   (
      This       : access IConstantForceEffect_Interface
      ; vector : Windows.Foundation.Numerics.Vector3
      ; attackGain : Windows.Single
      ; sustainGain : Windows.Single
      ; releaseGain : Windows.Single
      ; startDelay : Windows.Foundation.TimeSpan
      ; attackDuration : Windows.Foundation.TimeSpan
      ; sustainDuration : Windows.Foundation.TimeSpan
      ; releaseDuration : Windows.Foundation.TimeSpan
      ; repeatCount : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPeriodicForceEffect : aliased constant Windows.IID := (1548826839, 64629, 19794, (154, 10, 239, 228, 202, 181, 254, 100 ));
   
   type IPeriodicForceEffect_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Kind
   (
      This       : access IPeriodicForceEffect_Interface
      ; RetVal : access Windows.Gaming.Input.ForceFeedback.PeriodicForceEffectKind
   )
   return Windows.HRESULT is abstract;
   
   function SetParameters
   (
      This       : access IPeriodicForceEffect_Interface
      ; vector : Windows.Foundation.Numerics.Vector3
      ; frequency : Windows.Single
      ; phase : Windows.Single
      ; bias : Windows.Single
      ; duration : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function SetParametersWithEnvelope
   (
      This       : access IPeriodicForceEffect_Interface
      ; vector : Windows.Foundation.Numerics.Vector3
      ; frequency : Windows.Single
      ; phase : Windows.Single
      ; bias : Windows.Single
      ; attackGain : Windows.Single
      ; sustainGain : Windows.Single
      ; releaseGain : Windows.Single
      ; startDelay : Windows.Foundation.TimeSpan
      ; attackDuration : Windows.Foundation.TimeSpan
      ; sustainDuration : Windows.Foundation.TimeSpan
      ; releaseDuration : Windows.Foundation.TimeSpan
      ; repeatCount : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPeriodicForceEffectFactory : aliased constant Windows.IID := (1868753690, 38993, 18299, (179, 24, 53, 236, 170, 21, 7, 15 ));
   
   type IPeriodicForceEffectFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IPeriodicForceEffectFactory_Interface
      ; effectKind : Windows.Gaming.Input.ForceFeedback.PeriodicForceEffectKind
      ; RetVal : access Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRampForceEffect : aliased constant Windows.IID := (4059566681, 7334, 16512, (181, 109, 180, 63, 51, 84, 208, 82 ));
   
   type IRampForceEffect_Interface is interface and Windows.IInspectable_Interface;
   
   function SetParameters
   (
      This       : access IRampForceEffect_Interface
      ; startVector : Windows.Foundation.Numerics.Vector3
      ; endVector : Windows.Foundation.Numerics.Vector3
      ; duration : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function SetParametersWithEnvelope
   (
      This       : access IRampForceEffect_Interface
      ; startVector : Windows.Foundation.Numerics.Vector3
      ; endVector : Windows.Foundation.Numerics.Vector3
      ; attackGain : Windows.Single
      ; sustainGain : Windows.Single
      ; releaseGain : Windows.Single
      ; startDelay : Windows.Foundation.TimeSpan
      ; attackDuration : Windows.Foundation.TimeSpan
      ; sustainDuration : Windows.Foundation.TimeSpan
      ; releaseDuration : Windows.Foundation.TimeSpan
      ; repeatCount : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IForceFeedbackMotor : aliased constant Windows.IID := (2369601916, 42474, 17686, (128, 38, 43, 0, 247, 78, 246, 229 ));
   
   type IForceFeedbackMotor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AreEffectsPaused
   (
      This       : access IForceFeedbackMotor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MasterGain
   (
      This       : access IForceFeedbackMotor_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_MasterGain
   (
      This       : access IForceFeedbackMotor_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_IsEnabled
   (
      This       : access IForceFeedbackMotor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedAxes
   (
      This       : access IForceFeedbackMotor_Interface
      ; RetVal : access Windows.Gaming.Input.ForceFeedback.ForceFeedbackEffectAxes
   )
   return Windows.HRESULT is abstract;
   
   function LoadEffectAsync
   (
      This       : access IForceFeedbackMotor_Interface
      ; effect : Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect
      ; RetVal : access Windows.Gaming.Input.ForceFeedback.IAsyncOperation_ForceFeedbackLoadEffectResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PauseAllEffects
   (
      This       : access IForceFeedbackMotor_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ResumeAllEffects
   (
      This       : access IForceFeedbackMotor_Interface
   )
   return Windows.HRESULT is abstract;
   
   function StopAllEffects
   (
      This       : access IForceFeedbackMotor_Interface
   )
   return Windows.HRESULT is abstract;
   
   function TryDisableAsync
   (
      This       : access IForceFeedbackMotor_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryEnableAsync
   (
      This       : access IForceFeedbackMotor_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryResetAsync
   (
      This       : access IForceFeedbackMotor_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryUnloadEffectAsync
   (
      This       : access IForceFeedbackMotor_Interface
      ; effect : Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ForceFeedbackLoadEffectResult : aliased constant Windows.IID := (569914620, 59461, 23225, (191, 133, 149, 52, 226, 57, 119, 152 ));
   
   type IAsyncOperation_ForceFeedbackLoadEffectResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ForceFeedbackLoadEffectResult_Interface
      ; handler : Windows.Gaming.Input.ForceFeedback.AsyncOperationCompletedHandler_ForceFeedbackLoadEffectResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ForceFeedbackLoadEffectResult_Interface
      ; RetVal : access Windows.Gaming.Input.ForceFeedback.AsyncOperationCompletedHandler_ForceFeedbackLoadEffectResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ForceFeedbackLoadEffectResult_Interface
      ; RetVal : access Windows.Gaming.Input.ForceFeedback.ForceFeedbackLoadEffectResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IForceFeedbackMotor : aliased constant Windows.IID := (1691314656, 21604, 23410, (189, 75, 130, 247, 195, 208, 56, 109 ));
   
   type IIterator_IForceFeedbackMotor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IForceFeedbackMotor_Interface
      ; RetVal : access Windows.Gaming.Input.ForceFeedback.IForceFeedbackMotor
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IForceFeedbackMotor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IForceFeedbackMotor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IForceFeedbackMotor_Interface
      ; items : Windows.Gaming.Input.ForceFeedback.IForceFeedbackMotor_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IForceFeedbackMotor : aliased constant Windows.IID := (3242475729, 65184, 20807, (174, 216, 155, 133, 35, 157, 168, 130 ));
   
   type IIterable_IForceFeedbackMotor_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IForceFeedbackMotor_Interface
      ; RetVal : access Windows.Gaming.Input.ForceFeedback.IIterator_IForceFeedbackMotor
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IForceFeedbackMotor : aliased constant Windows.IID := (1543262320, 4125, 24507, (141, 95, 206, 92, 35, 190, 205, 217 ));
   
   type IVectorView_IForceFeedbackMotor_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IForceFeedbackMotor_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Gaming.Input.ForceFeedback.IForceFeedbackMotor
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IForceFeedbackMotor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IForceFeedbackMotor_Interface
      ; value : Windows.Gaming.Input.ForceFeedback.IForceFeedbackMotor
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IForceFeedbackMotor_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Gaming.Input.ForceFeedback.IForceFeedbackMotor_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ForceFeedbackLoadEffectResult : aliased constant Windows.IID := (4162980417, 63288, 20968, (137, 186, 118, 187, 214, 97, 88, 203 ));
   
   type AsyncOperationCompletedHandler_ForceFeedbackLoadEffectResult_Interface(Callback : access procedure (asyncInfo : Windows.Gaming.Input.ForceFeedback.IAsyncOperation_ForceFeedbackLoadEffectResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ForceFeedbackLoadEffectResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ForceFeedbackLoadEffectResult_Interface
      ; asyncInfo : Windows.Gaming.Input.ForceFeedback.IAsyncOperation_ForceFeedbackLoadEffectResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype ConditionForceEffect is Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect;
   function CreateInstance
   (
      effectKind : Windows.Gaming.Input.ForceFeedback.ConditionForceEffectKind
   )
   return Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect;
   
   subtype PeriodicForceEffect is Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect;
   function CreateInstance
   (
      effectKind : Windows.Gaming.Input.ForceFeedback.PeriodicForceEffectKind
   )
   return Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect;
   
   subtype ConstantForceEffect is Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect;
   function Create return Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect;
   
   subtype RampForceEffect is Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect;
   function Create1 return Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect;
   
   subtype ForceFeedbackMotor is Windows.Gaming.Input.ForceFeedback.IForceFeedbackMotor;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
