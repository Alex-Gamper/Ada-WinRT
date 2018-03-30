--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Data.Xml.Dom;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Data.Xml.Xsl is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateInstance
   (
      document : Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.Data.Xml.Xsl.IXsltProcessor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Xml.Xsl.XsltProcessor");
      m_Factory     : Windows.Data.Xml.Xsl.IXsltProcessorFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Xml.Xsl.IXsltProcessor := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXsltProcessorFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(document, RetVal'Access);
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
