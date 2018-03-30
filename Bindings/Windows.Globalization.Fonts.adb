--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.UI.Text;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Globalization.Fonts is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateLanguageFontGroup
   (
      languageTag : Windows.String
   )
   return Windows.Globalization.Fonts.ILanguageFontGroup is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.Fonts.LanguageFontGroup");
      m_Factory     : Windows.Globalization.Fonts.ILanguageFontGroupFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.Fonts.ILanguageFontGroup := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILanguageFontGroupFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateLanguageFontGroup(languageTag, RetVal'Access);
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
