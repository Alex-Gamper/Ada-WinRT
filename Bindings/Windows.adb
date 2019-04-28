--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 1.3.0.0                                                     --
--    Microsoft SDK Version : 10.0.18362.0                                    --
--    Microsoft Windows Release : 19H1                                        --
--                                                                            --
-- This program is free software: you can redistribute it and / or modify     --
-- it under the terms of the GNU Lesser General Public License as published by--
-- the Free Software Foundation, either version 3 of the License, or          --
-- (at your option) any later version.                                        --
--                                                                            --
-- This program is distributed in the hope that it will be useful,            --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of             --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the               --
-- GNU Lesser General Public License for more details.                        --
--                                                                            --
-- You should have received a copy of the GNU Lesser General Public License   --
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
with System;
with Interfaces.C;
--------------------------------------------------------------------------------
package body Windows is

   function GenericQI(Object : access ISource'Class) return IDestination is
      Hr        : Windows.HResult;
      RetVal    : aliased IUnknown;  
      function Convert is new Ada.Unchecked_Conversion(IUnknown, IDestination);
   begin
      Hr := Object.QueryInterface(IID_Destination, RetVal'access);
      return Convert(RetVal);
   end;
   
   --------------------------------------------------------------------------------
   
   function QueryInterface(This : access IMulticastDelegate_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown) return Windows.HResult is
      Hr : Windows.HResult := E_NOTIMPL;
      RefCount   : Windows.UInt32;
      m_IUnknown : aliased IUnknown;
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = This.m_IID.all or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef (This :  access IMulticastDelegate_Interface) return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release (This : access IMulticastDelegate_Interface) return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   --------------------------------------------------------------------------------
   
   function To_String(Value : Wide_String) return Windows.String is
      Hr       : Windows.HRESULT := 0;
      RetVal   : aliased Windows.String;
   begin
      Hr := WindowsCreateString (Value'Address , Value'Length , RetVal'Access);
      return RetVal;
   end;
   --------------------------------------------------------------------------------
   
   procedure OutputDebugStringA(OutputString : Interfaces.C.char_array);
   pragma import (stdcall,  OutputDebugStringA, "OutputDebugStringA");
   
   procedure OutputDebugString(OutputString : Standard.String) is
      CRLF : constant Standard.String := ASCII.CR & ASCII.LF;
   begin
      OutputDebugStringA(Interfaces.C.To_C(OutputString & CRLF));
   end;
end;
