--------------------------------------------------------------------------------
package body AwaitPackage is

    function GenericAwait(p_IAsyncOperation : access T'Class) return boolean is
    
        Hr              : Windows.HRESULT := S_OK;
        RetVal          : boolean := false;
        m_IAsyncInfo    : aliased IAsyncInfo;
        m_AsyncStatus   : aliased AsyncStatus;

        pragma suppress(all_checks);    -- QueryInterface raises access check without this !!!

    begin
        Hr := p_IAsyncOperation.QueryInterface(IID_IAsyncInfo'Access, m_IAsyncInfo'Address);
        if Hr = 0 then      
            Hr := m_IAsyncInfo.get_Status(m_AsyncStatus'access);
            while Hr = 0 loop
                delay 0.015;
                exit when m_AsyncStatus = Completed or m_AsyncStatus = Error;
                Hr := m_IAsyncInfo.get_Status(m_AsyncStatus'access);
            end loop;

            if m_AsyncStatus = Completed then
                RetVal := true;
            end if;
        end if;
        return RetVal;
    end;


end AwaitPackage;
