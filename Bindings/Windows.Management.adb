--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Management is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateMdmAlert return Windows.Management.IMdmAlert is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Management.MdmAlert");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Management.IMdmAlert := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Management.IID_IMdmAlert'Access, RetVal'Address);
         RefCount := Instance.Release;
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
   
   
   function get_SessionIds
   return Windows.Foundation.Collections.IVectorView_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Management.MdmSessionManager");
      m_Factory     : IMdmSessionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMdmSessionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SessionIds(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryCreateSession
   return Windows.Management.IMdmSession is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Management.MdmSessionManager");
      m_Factory     : IMdmSessionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Management.IMdmSession;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMdmSessionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryCreateSession(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure DeleteSessionById
   (
      sessionId : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Management.MdmSessionManager");
      m_Factory     : IMdmSessionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMdmSessionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.DeleteSessionById(sessionId);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetSessionById
   (
      sessionId : Windows.String
   )
   return Windows.Management.IMdmSession is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Management.MdmSessionManager");
      m_Factory     : IMdmSessionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Management.IMdmSession;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMdmSessionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetSessionById(sessionId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
