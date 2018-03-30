--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Web is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetStatus
   (
      hresult : Windows.Int32
   )
   return Windows.Web.WebErrorStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.WebError");
      m_Factory     : IWebErrorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.WebErrorStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebErrorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetStatus(hresult, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
