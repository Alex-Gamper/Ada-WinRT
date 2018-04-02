--------------------------------------------------------------------------------
--                                                                            --
--    Copyright (c) 2018 Alexander Gamper, All Rights Reserved.               --
--                                                                            --
--    This program is free software: you can redistribute it and/or modify    --
--    it under the terms of the GNU General Public License as published by    --
--    the Free Software Foundation, either version 3 of the License, or       --
--    (at your option) any later version.                                     --
--                                                                            --
--    This program is distributed in the hope that it will be useful,         --
--    but WITHOUT ANY WARRANTY; without even the implied warranty of          --
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           --
--    GNU General Public License for more details.                            --
--                                                                            --
--    You should have received a copy of the GNU General Public License       --
--    along with this program.  If not, see <http://www.gnu.org/licenses/>.   --
--                                                                            --
--------------------------------------------------------------------------------
with Windows;                               use Windows;
with Windows.Foundation;                    use Windows.Foundation;
with Windows.Networking;                    use Windows.Networking;
with Windows.Networking.Sockets;            use Windows.Networking.Sockets;
with Ada.Text_IO;                           use Ada.Text_IO;
--------------------------------------------------------------------------------
procedure Network is

    Hr                      : Windows.HRESULT := 0;

    procedure Start is
    
        m_CallbackCompleted : Boolean := false;

        procedure ConnectAsync_Callback (asyncInfo : Windows.Foundation.IAsyncAction ; asyncStatus : Windows.Foundation.AsyncStatus) is
            Hr          : Windows.HRESULT := 0;
        begin
            if asyncStatus = Completed then
                Hr := asyncInfo.GetResults;
                if Hr = 0 then
                    Put_Line("Callback Invoked - connected to www.microsoft.com");
                    m_CallbackCompleted := true;
                end if;
            end if;
        end;

        m_IHostName             : IHostName := CreateHostName(To_String("www.microsoft.com"));
        m_StreamSocket          : IStreamSocket := CreateStreamSocket;
        m_IAsyncAction          : aliased IAsyncAction := null;
        m_AsyncActionCompleted  : AsyncActionCompletedHandler := new AsyncActionCompletedHandler_Interface(ConnectAsync_Callback'access);

        function QI is new GenericQI(IStreamSocket_Interface, IClosable, IID_IClosable'Access);

    begin
        Hr := m_StreamSocket.ConnectAsync(m_IHostName, To_String("http"), m_IAsyncAction'access);
        if m_IAsyncAction /= null then
            Hr := m_IAsyncAction.put_Completed(m_AsyncActionCompleted);
            while m_CallbackCompleted = false loop
                delay 0.015;
            end loop;
            Hr := QI(m_StreamSocket).Close;
        end if;
    end;

begin
    Hr := RoInitialize(1);
    if (Hr = 0) then
        Start;
        RoUninitialize;
    end if;
end;