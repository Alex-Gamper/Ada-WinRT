--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.ApplicationModel.Core;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Shell is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function CreateAdaptiveCardFromJson
   (
      value : Windows.String
   )
   return Windows.UI.Shell.IAdaptiveCard is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Shell.AdaptiveCardBuilder");
      m_Factory     : IAdaptiveCardBuilderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Shell.IAdaptiveCard;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAdaptiveCardBuilderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAdaptiveCardFromJson(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.UI.Shell.ITaskbarManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Shell.TaskbarManager");
      m_Factory     : ITaskbarManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Shell.ITaskbarManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITaskbarManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
