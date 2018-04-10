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
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function ToDisplayName
   (
      color : Windows.UI.Color
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ColorHelper");
      m_Factory     : IColorHelperStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorHelperStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ToDisplayName(color, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromArgb
   (
      a : Windows.UInt8
      ; r : Windows.UInt8
      ; g : Windows.UInt8
      ; b : Windows.UInt8
   )
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ColorHelper");
      m_Factory     : IColorHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromArgb(a, r, g, b, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AliceBlue
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AliceBlue(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AntiqueWhite
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AntiqueWhite(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Aqua
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Aqua(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Aquamarine
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Aquamarine(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Azure
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Azure(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Beige
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Beige(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Bisque
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Bisque(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Black
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Black(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BlanchedAlmond
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BlanchedAlmond(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Blue
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Blue(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BlueViolet
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BlueViolet(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Brown
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Brown(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BurlyWood
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BurlyWood(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CadetBlue
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CadetBlue(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Chartreuse
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Chartreuse(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Chocolate
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Chocolate(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Coral
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Coral(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CornflowerBlue
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CornflowerBlue(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Cornsilk
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Cornsilk(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Crimson
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Crimson(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Cyan
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Cyan(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DarkBlue
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DarkBlue(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DarkCyan
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DarkCyan(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DarkGoldenrod
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DarkGoldenrod(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DarkGray
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DarkGray(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DarkGreen
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DarkGreen(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DarkKhaki
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DarkKhaki(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DarkMagenta
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DarkMagenta(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DarkOliveGreen
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DarkOliveGreen(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DarkOrange
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DarkOrange(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DarkOrchid
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DarkOrchid(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DarkRed
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DarkRed(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DarkSalmon
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DarkSalmon(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DarkSeaGreen
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DarkSeaGreen(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DarkSlateBlue
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DarkSlateBlue(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DarkSlateGray
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DarkSlateGray(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DarkTurquoise
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DarkTurquoise(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DarkViolet
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DarkViolet(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DeepPink
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DeepPink(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DeepSkyBlue
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DeepSkyBlue(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DimGray
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DimGray(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DodgerBlue
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DodgerBlue(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Firebrick
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Firebrick(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FloralWhite
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FloralWhite(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ForestGreen
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ForestGreen(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Fuchsia
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Fuchsia(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Gainsboro
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Gainsboro(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GhostWhite
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GhostWhite(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Gold
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Gold(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Goldenrod
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Goldenrod(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Gray
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Gray(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Green
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Green(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GreenYellow
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GreenYellow(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Honeydew
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Honeydew(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HotPink
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HotPink(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IndianRed
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IndianRed(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Indigo
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Indigo(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Ivory
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Ivory(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Khaki
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Khaki(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Lavender
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Lavender(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LavenderBlush
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LavenderBlush(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LawnGreen
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LawnGreen(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LemonChiffon
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LemonChiffon(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LightBlue
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LightBlue(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LightCoral
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LightCoral(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LightCyan
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LightCyan(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LightGoldenrodYellow
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LightGoldenrodYellow(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LightGreen
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LightGreen(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LightGray
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LightGray(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LightPink
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LightPink(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LightSalmon
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LightSalmon(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LightSeaGreen
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LightSeaGreen(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LightSkyBlue
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LightSkyBlue(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LightSlateGray
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LightSlateGray(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LightSteelBlue
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LightSteelBlue(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LightYellow
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LightYellow(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Lime
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Lime(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LimeGreen
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LimeGreen(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Linen
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Linen(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Magenta
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Magenta(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Maroon
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Maroon(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MediumAquamarine
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MediumAquamarine(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MediumBlue
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MediumBlue(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MediumOrchid
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MediumOrchid(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MediumPurple
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MediumPurple(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MediumSeaGreen
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MediumSeaGreen(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MediumSlateBlue
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MediumSlateBlue(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MediumSpringGreen
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MediumSpringGreen(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MediumTurquoise
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MediumTurquoise(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MediumVioletRed
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MediumVioletRed(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MidnightBlue
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MidnightBlue(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MintCream
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MintCream(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MistyRose
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MistyRose(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Moccasin
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Moccasin(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NavajoWhite
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NavajoWhite(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Navy
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Navy(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_OldLace
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_OldLace(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Olive
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Olive(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_OliveDrab
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_OliveDrab(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Orange
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Orange(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_OrangeRed
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_OrangeRed(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Orchid
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Orchid(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PaleGoldenrod
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PaleGoldenrod(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PaleGreen
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PaleGreen(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PaleTurquoise
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PaleTurquoise(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PaleVioletRed
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PaleVioletRed(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PapayaWhip
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PapayaWhip(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PeachPuff
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PeachPuff(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Peru
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Peru(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Pink
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Pink(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Plum
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Plum(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PowderBlue
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PowderBlue(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Purple
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Purple(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Red
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Red(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RosyBrown
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RosyBrown(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RoyalBlue
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RoyalBlue(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SaddleBrown
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SaddleBrown(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Salmon
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Salmon(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SandyBrown
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SandyBrown(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SeaGreen
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SeaGreen(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SeaShell
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SeaShell(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Sienna
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Sienna(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Silver
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Silver(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SkyBlue
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SkyBlue(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SlateBlue
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SlateBlue(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SlateGray
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SlateGray(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Snow
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Snow(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SpringGreen
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SpringGreen(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SteelBlue
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SteelBlue(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Tan
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Tan(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Teal
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Teal(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Thistle
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Thistle(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Tomato
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Tomato(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Transparent
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Transparent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Turquoise
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Turquoise(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Violet
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Violet(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Wheat
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Wheat(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_White
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_White(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_WhiteSmoke
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_WhiteSmoke(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Yellow
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Yellow(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_YellowGreen
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Colors");
      m_Factory     : IColorsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_YellowGreen(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   

end;
