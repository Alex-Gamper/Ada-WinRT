--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Web.Syndication;
with Windows.Data.Xml.Dom;
with Windows.Storage.Streams;
with Windows.Security.Credentials;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Web.AtomPub is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateAtomPubClientWithCredentials
   (
      serverCredential : Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.Web.AtomPub.IAtomPubClient is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.AtomPub.AtomPubClient");
      m_Factory     : Windows.Web.AtomPub.IAtomPubClientFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.AtomPub.IAtomPubClient := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAtomPubClientFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAtomPubClientWithCredentials(serverCredential, RetVal'Access);
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
