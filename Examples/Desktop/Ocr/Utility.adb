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
with System;                                    use System;
with System.Storage_Elements;                   use System.Storage_Elements;
with Ada.Characters.Handling;                   use Ada.Characters.Handling;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Utility is

    function To_Ada(str : Windows.String) return String is

        function WindowsGetStringRawBuffer(string : Windows.String ; length : access Integer) return System.Address; --PCWSTR
        pragma Import (StdCall, WindowsGetStringRawBuffer, "WindowsGetStringRawBuffer");

        type wchars_ptr is access all Wide_character;

        function To_wchars_ptr is new Ada.Unchecked_Conversion (System.Address, wchars_ptr);
        function To_Address is new Ada.Unchecked_Conversion (wchars_ptr, System.Address);

        function "+" (Left : wchars_ptr; Right : Integer) return wchars_ptr is
        begin
            return To_wchars_ptr (To_Address (Left) + (Storage_Offset (Right) * 2));  -- 2 bytes / wide_character
        end "+";
        pragma inline("+");

        function Peek (From : wchars_ptr) return character is
        begin
            return To_Character (From.all);
        end Peek;
        pragma inline(Peek);

        Count   : aliased Integer;
        Item    : wchars_ptr := To_wchars_ptr(WindowsGetStringRawBuffer(str, Count'access));

    begin
        declare
            R : String (1 .. Count);
        begin
            for J in R'Range loop
                R (J) := Peek(Item + (J - 1));
            end loop;
            return R;
        end;
    end;

end Utility;