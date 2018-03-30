--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Core.AnimationMetrics is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateInstance
   (
      effect : Windows.UI.Core.AnimationMetrics.AnimationEffect
      ; target : Windows.UI.Core.AnimationMetrics.AnimationEffectTarget
   )
   return Windows.UI.Core.AnimationMetrics.IAnimationDescription is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Core.AnimationMetrics.AnimationDescription");
      m_Factory     : Windows.UI.Core.AnimationMetrics.IAnimationDescriptionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Core.AnimationMetrics.IAnimationDescription := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAnimationDescriptionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(effect, target, RetVal'Access);
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
   

end;
