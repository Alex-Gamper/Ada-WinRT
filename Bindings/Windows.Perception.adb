--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Perception is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function FromHistoricalTargetTime
   (
      targetTime : Windows.Foundation.DateTime
   )
   return Windows.Perception.IPerceptionTimestamp is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.PerceptionTimestampHelper");
      m_Factory     : IPerceptionTimestampHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Perception.IPerceptionTimestamp;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionTimestampHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromHistoricalTargetTime(targetTime, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
