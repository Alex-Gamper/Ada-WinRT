--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.ApplicationModel.Core;
with Windows.UI.Input;
with Windows.UI.Core;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Input.Core is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function CreateForView
   (
      view : Windows.ApplicationModel.Core.ICoreApplicationView
   )
   return Windows.UI.Input.Core.IRadialControllerIndependentInputSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Core.RadialControllerIndependentInputSource");
      m_Factory     : IRadialControllerIndependentInputSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.Core.IRadialControllerIndependentInputSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRadialControllerIndependentInputSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateForView(view, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
