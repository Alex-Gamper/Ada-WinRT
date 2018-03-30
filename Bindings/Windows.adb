--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with System;
with Interfaces.C;
--------------------------------------------------------------------------------
package body Windows is

   function GenericQI(Object : access I1'Class) return I2 is
      Hr        : Windows.HResult;
      riid      : Windows.GUID_Ptr := I3;
      RetVal    : aliased I2;  
      pragma suppress(all_checks);
   begin
      Hr := Object.QueryInterface(riid, RetVal'Address);
      return RetVal;
   end;
   
   --------------------------------------------------------------------------------
   
   function QueryInterface(This : access IMulticastDelegate_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HResult is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      if riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      end if;
      return Hr;
   end;
   
   function AddRef (This :  access IMulticastDelegate_Interface) return Windows.UInt32 is
   begin
      This.m_RefCount := This.m_RefCount + 1;
      return Windows.UInt32(This.m_RefCount);
   end;
   
   function Release (This : access IMulticastDelegate_Interface) return Windows.UInt32 is
   begin
      This.m_RefCount := This.m_RefCount - 1;
      return Windows.UInt32(This.m_RefCount);
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
