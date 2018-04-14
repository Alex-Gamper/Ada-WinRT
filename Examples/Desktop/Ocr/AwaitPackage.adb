--------------------------------------------------------------------------------
--                                                                            --
-- Copyright (c) 2018 Alexander Gamper, All Rights Reserved.                  --
--                                                                            --
-- This program is free software: you can redistribute it and/or modify       --
-- it under the terms of the GNU Lesser General Public License as published by--
-- the Free Software Foundation, either version 3 of the License, or          --
-- (at your option) any later version.                                        --
--                                                                            --
-- This program is distributed in the hope that it will be useful,            --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of             --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              --
-- GNU Lesser General Public License for more details.                        --
--                                                                            --
-- You should have received a copy of the GNU Lesser General Public License   --
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.      --
--                                                                            --
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
