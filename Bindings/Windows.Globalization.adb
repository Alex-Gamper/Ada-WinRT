--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.1                                                     --
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
-- along with this program.If not, see < http://www.gnu.org/licenses/>.       --
--                                                                            --
--------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Globalization is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateGeographicRegion return Windows.Globalization.IGeographicRegion is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.GeographicRegion");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Globalization.IGeographicRegion) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Globalization.IID_IGeographicRegion'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateLanguage
   (
      languageTag : Windows.String
   )
   return Windows.Globalization.ILanguage is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.Language");
      m_Factory     : Windows.Globalization.ILanguageFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.ILanguage := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILanguageFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateLanguage(languageTag, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCalendarWithTimeZone
   (
      languages : Windows.Foundation.Collections.IIterable_String
      ; calendar : Windows.String
      ; clock : Windows.String
      ; timeZoneId : Windows.String
   )
   return Windows.Globalization.ICalendar is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.Calendar");
      m_Factory     : Windows.Globalization.ICalendarFactory2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.ICalendar := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICalendarFactory2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateCalendarWithTimeZone(languages, calendar, clock, timeZoneId, RetVal'Access);
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
   
   function get_Gregorian
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CalendarIdentifiers");
      m_Factory     : ICalendarIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICalendarIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Gregorian(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Hebrew
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CalendarIdentifiers");
      m_Factory     : ICalendarIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICalendarIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Hebrew(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Hijri
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CalendarIdentifiers");
      m_Factory     : ICalendarIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICalendarIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Hijri(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Japanese
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CalendarIdentifiers");
      m_Factory     : ICalendarIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICalendarIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Japanese(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Julian
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CalendarIdentifiers");
      m_Factory     : ICalendarIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICalendarIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Julian(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Korean
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CalendarIdentifiers");
      m_Factory     : ICalendarIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICalendarIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Korean(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Taiwan
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CalendarIdentifiers");
      m_Factory     : ICalendarIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICalendarIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Taiwan(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Thai
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CalendarIdentifiers");
      m_Factory     : ICalendarIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICalendarIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Thai(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UmAlQura
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CalendarIdentifiers");
      m_Factory     : ICalendarIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICalendarIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UmAlQura(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ChineseLunar
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CalendarIdentifiers");
      m_Factory     : ICalendarIdentifiersStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICalendarIdentifiersStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ChineseLunar(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_JapaneseLunar
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CalendarIdentifiers");
      m_Factory     : ICalendarIdentifiersStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICalendarIdentifiersStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_JapaneseLunar(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KoreanLunar
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CalendarIdentifiers");
      m_Factory     : ICalendarIdentifiersStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICalendarIdentifiersStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KoreanLunar(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TaiwanLunar
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CalendarIdentifiers");
      m_Factory     : ICalendarIdentifiersStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICalendarIdentifiersStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TaiwanLunar(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VietnameseLunar
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CalendarIdentifiers");
      m_Factory     : ICalendarIdentifiersStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICalendarIdentifiersStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VietnameseLunar(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Persian
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CalendarIdentifiers");
      m_Factory     : ICalendarIdentifiersStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICalendarIdentifiersStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Persian(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TwelveHour
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.ClockIdentifiers");
      m_Factory     : IClockIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IClockIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TwelveHour(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TwentyFourHour
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.ClockIdentifiers");
      m_Factory     : IClockIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IClockIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TwentyFourHour(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Arab
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Arab(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ArabExt
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ArabExt(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Bali
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Bali(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Beng
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Beng(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Cham
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Cham(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Deva
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Deva(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FullWide
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FullWide(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Gujr
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Gujr(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Guru
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Guru(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HaniDec
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HaniDec(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Java
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Java(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Kali
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Kali(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Khmr
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Khmr(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Knda
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Knda(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Lana
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Lana(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LanaTham
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LanaTham(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Laoo
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Laoo(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Latn
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Latn(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Lepc
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Lepc(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Limb
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Limb(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Mlym
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Mlym(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Mong
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Mong(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Mtei
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Mtei(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Mymr
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Mymr(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MymrShan
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MymrShan(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Nkoo
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Nkoo(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Olck
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Olck(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Orya
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Orya(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Saur
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Saur(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Sund
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Sund(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Talu
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Talu(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TamlDec
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TamlDec(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Telu
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Telu(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Thai_NumeralSystemIdentifiers
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Thai(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Tibt
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Tibt(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Vaii
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Vaii(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Brah
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Brah(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Osma
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Osma(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MathBold
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MathBold(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MathDbl
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MathDbl(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MathSans
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MathSans(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MathSanb
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MathSanb(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MathMono
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MathMono(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ZmthBold
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ZmthBold(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ZmthDbl
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ZmthDbl(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ZmthSans
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ZmthSans(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ZmthSanb
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ZmthSanb(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ZmthMono
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumeralSystemIdentifiers");
      m_Factory     : INumeralSystemIdentifiersStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INumeralSystemIdentifiersStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ZmthMono(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BYN
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BYN(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AED
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AED(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AFN
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AFN(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ALL
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ALL(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AMD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AMD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ANG
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ANG(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AOA
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AOA(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ARS
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ARS(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AUD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AUD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AWG
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AWG(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AZN
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AZN(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BAM
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BAM(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BBD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BBD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BDT
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BDT(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BGN
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BGN(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BHD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BHD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BIF
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BIF(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BMD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BMD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BND
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BND(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BOB
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BOB(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BRL
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BRL(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BSD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BSD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BTN
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BTN(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BWP
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BWP(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BYR
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BYR(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BZD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BZD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CAD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CAD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CDF
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CDF(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CHF
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CHF(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CLP
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CLP(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CNY
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CNY(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_COP
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_COP(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CRC
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CRC(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CUP
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CUP(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CVE
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CVE(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CZK
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CZK(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DJF
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DJF(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DKK
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DKK(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DOP
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DOP(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DZD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DZD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EGP
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EGP(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ERN
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ERN(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ETB
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ETB(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EUR
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EUR(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FJD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FJD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FKP
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FKP(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GBP
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GBP(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GEL
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GEL(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GHS
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GHS(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GIP
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GIP(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GMD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GMD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GNF
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GNF(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GTQ
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GTQ(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GYD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GYD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HKD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HKD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HNL
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HNL(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HRK
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HRK(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HTG
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HTG(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HUF
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HUF(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IDR
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IDR(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ILS
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ILS(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_INR
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_INR(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IQD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IQD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IRR
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IRR(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ISK
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ISK(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_JMD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_JMD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_JOD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_JOD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_JPY
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_JPY(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KES
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KES(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KGS
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KGS(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KHR
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KHR(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KMF
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KMF(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KPW
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KPW(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KRW
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KRW(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KWD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KWD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KYD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KYD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KZT
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KZT(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LAK
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LAK(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LBP
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LBP(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LKR
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LKR(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LRD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LRD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LSL
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LSL(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LTL
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LTL(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LVL
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LVL(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LYD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LYD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MAD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MAD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MDL
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MDL(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MGA
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MGA(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MKD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MKD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MMK
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MMK(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MNT
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MNT(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MOP
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MOP(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MRO
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MRO(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MUR
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MUR(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MVR
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MVR(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MWK
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MWK(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MXN
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MXN(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MYR
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MYR(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MZN
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MZN(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NAD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NAD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NGN
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NGN(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NIO
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NIO(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NOK
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NOK(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NPR
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NPR(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NZD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NZD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_OMR
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_OMR(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PAB
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PAB(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PEN
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PEN(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PGK
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PGK(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PHP
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PHP(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PKR
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PKR(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PLN
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PLN(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PYG
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PYG(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_QAR
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_QAR(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RON
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RON(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RSD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RSD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RUB
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RUB(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RWF
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RWF(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SAR
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SAR(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SBD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SBD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SCR
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SCR(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SDG
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SDG(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SEK
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SEK(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SGD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SGD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SHP
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SHP(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SLL
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SLL(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SOS
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SOS(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SRD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SRD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_STD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_STD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SYP
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SYP(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SZL
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SZL(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_THB
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_THB(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TJS
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TJS(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TMT
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TMT(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TND
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TND(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TOP
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TOP(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TRY
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TRY(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TTD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TTD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TWD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TWD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TZS
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TZS(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UAH
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UAH(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UGX
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UGX(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_USD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_USD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UYU
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UYU(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UZS
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UZS(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VEF
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VEF(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VND
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VND(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VUV
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VUV(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_WST
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_WST(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_XAF
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_XAF(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_XCD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_XCD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_XOF
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_XOF(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_XPF
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_XPF(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_XXX
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_XXX(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_YER
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_YER(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ZAR
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ZAR(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ZMW
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ZMW(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ZWL
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.CurrencyIdentifiers");
      m_Factory     : ICurrencyIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ZWL(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsSupported
   (
      geographicRegionCode : Windows.String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.GeographicRegion");
      m_Factory     : IGeographicRegionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeographicRegionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsSupported(geographicRegionCode, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsWellFormed
   (
      languageTag : Windows.String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.Language");
      m_Factory     : ILanguageStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILanguageStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsWellFormed(languageTag, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CurrentInputMethodLanguageTag
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.Language");
      m_Factory     : ILanguageStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILanguageStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CurrentInputMethodLanguageTag(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TrySetInputMethodLanguageTag
   (
      languageTag : Windows.String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.Language");
      m_Factory     : ILanguageStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILanguageStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TrySetInputMethodLanguageTag(languageTag, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PrimaryLanguageOverride
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.ApplicationLanguages");
      m_Factory     : IApplicationLanguagesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationLanguagesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PrimaryLanguageOverride(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_PrimaryLanguageOverride
   (
      value : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.ApplicationLanguages");
      m_Factory     : IApplicationLanguagesStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationLanguagesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_PrimaryLanguageOverride(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_Languages
   return Windows.Foundation.Collections.IVectorView_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.ApplicationLanguages");
      m_Factory     : IApplicationLanguagesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationLanguagesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Languages(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ManifestLanguages
   return Windows.Foundation.Collections.IVectorView_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.ApplicationLanguages");
      m_Factory     : IApplicationLanguagesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationLanguagesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ManifestLanguages(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetWords
   (
      input : Windows.String
   )
   return Windows.Globalization.IVectorView_IJapanesePhoneme is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.JapanesePhoneticAnalyzer");
      m_Factory     : IJapanesePhoneticAnalyzerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.IVectorView_IJapanesePhoneme;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IJapanesePhoneticAnalyzerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetWords(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetWordsWithMonoRubyOption
   (
      input : Windows.String
      ; monoRuby : Windows.Boolean
   )
   return Windows.Globalization.IVectorView_IJapanesePhoneme is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.JapanesePhoneticAnalyzer");
      m_Factory     : IJapanesePhoneticAnalyzerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.IVectorView_IJapanesePhoneme;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IJapanesePhoneticAnalyzerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetWordsWithMonoRubyOption(input, monoRuby, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
