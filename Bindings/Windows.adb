--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.0                                                     --
--                                                                            --
--    This program is free software: you can redistribute it and / or modify  --
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
--    along with this program.If not, see < http://www.gnu.org/licenses/>.    --
--                                                                            --
--------------------------------------------------------------------------------
with System;
with Interfaces.C;
--------------------------------------------------------------------------------
package body Windows is

   function GenericQI(Object : access I1'Class) return I2 is
      Hr        : Windows.HResult;
      riid      : Windows.GUID_Ptr := I3;
      RetVal    : aliased I2;  
   begin
      Hr := Object.QueryInterface(riid, RetVal'Address);
      return RetVal;
   end;
   
   --------------------------------------------------------------------------------
   
   function QueryInterface(This : access IMulticastDelegate_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HResult is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      if riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      end if;
      return Hr;
   end;
   
   function AddRef (This :  access IMulticastDelegate_Interface) return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      RetVal := InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release (This : access IMulticastDelegate_Interface) return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      RetVal := InterlockedDecrement(This.m_RefCount'access)
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
