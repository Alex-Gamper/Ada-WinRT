--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.2.0.1                                                     --
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
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Globalization.DateTimeFormatting is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateDateTimeFormatter
   (
      formatTemplate : Windows.String
   )
   return Windows.Globalization.DateTimeFormatting.IDateTimeFormatter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.DateTimeFormatting.DateTimeFormatter");
      m_Factory     : Windows.Globalization.DateTimeFormatting.IDateTimeFormatterFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.DateTimeFormatting.IDateTimeFormatter := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDateTimeFormatterFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateDateTimeFormatter(formatTemplate, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDateTimeFormatterLanguages
   (
      formatTemplate : Windows.String
      ; languages : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Globalization.DateTimeFormatting.IDateTimeFormatter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.DateTimeFormatting.DateTimeFormatter");
      m_Factory     : Windows.Globalization.DateTimeFormatting.IDateTimeFormatterFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.DateTimeFormatting.IDateTimeFormatter := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDateTimeFormatterFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateDateTimeFormatterLanguages(formatTemplate, languages, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDateTimeFormatterContext
   (
      formatTemplate : Windows.String
      ; languages : Windows.Foundation.Collections.IIterable_String
      ; geographicRegion : Windows.String
      ; calendar : Windows.String
      ; clock : Windows.String
   )
   return Windows.Globalization.DateTimeFormatting.IDateTimeFormatter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.DateTimeFormatting.DateTimeFormatter");
      m_Factory     : Windows.Globalization.DateTimeFormatting.IDateTimeFormatterFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.DateTimeFormatting.IDateTimeFormatter := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDateTimeFormatterFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateDateTimeFormatterContext(formatTemplate, languages, geographicRegion, calendar, clock, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDateTimeFormatterDate
   (
      yearFormat : Windows.Globalization.DateTimeFormatting.YearFormat
      ; monthFormat : Windows.Globalization.DateTimeFormatting.MonthFormat
      ; dayFormat : Windows.Globalization.DateTimeFormatting.DayFormat
      ; dayOfWeekFormat : Windows.Globalization.DateTimeFormatting.DayOfWeekFormat
   )
   return Windows.Globalization.DateTimeFormatting.IDateTimeFormatter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.DateTimeFormatting.DateTimeFormatter");
      m_Factory     : Windows.Globalization.DateTimeFormatting.IDateTimeFormatterFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.DateTimeFormatting.IDateTimeFormatter := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDateTimeFormatterFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateDateTimeFormatterDate(yearFormat, monthFormat, dayFormat, dayOfWeekFormat, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDateTimeFormatterTime
   (
      hourFormat : Windows.Globalization.DateTimeFormatting.HourFormat
      ; minuteFormat : Windows.Globalization.DateTimeFormatting.MinuteFormat
      ; secondFormat : Windows.Globalization.DateTimeFormatting.SecondFormat
   )
   return Windows.Globalization.DateTimeFormatting.IDateTimeFormatter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.DateTimeFormatting.DateTimeFormatter");
      m_Factory     : Windows.Globalization.DateTimeFormatting.IDateTimeFormatterFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.DateTimeFormatting.IDateTimeFormatter := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDateTimeFormatterFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateDateTimeFormatterTime(hourFormat, minuteFormat, secondFormat, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDateTimeFormatterDateTimeLanguages
   (
      yearFormat : Windows.Globalization.DateTimeFormatting.YearFormat
      ; monthFormat : Windows.Globalization.DateTimeFormatting.MonthFormat
      ; dayFormat : Windows.Globalization.DateTimeFormatting.DayFormat
      ; dayOfWeekFormat : Windows.Globalization.DateTimeFormatting.DayOfWeekFormat
      ; hourFormat : Windows.Globalization.DateTimeFormatting.HourFormat
      ; minuteFormat : Windows.Globalization.DateTimeFormatting.MinuteFormat
      ; secondFormat : Windows.Globalization.DateTimeFormatting.SecondFormat
      ; languages : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Globalization.DateTimeFormatting.IDateTimeFormatter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.DateTimeFormatting.DateTimeFormatter");
      m_Factory     : Windows.Globalization.DateTimeFormatting.IDateTimeFormatterFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.DateTimeFormatting.IDateTimeFormatter := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDateTimeFormatterFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateDateTimeFormatterDateTimeLanguages(yearFormat, monthFormat, dayFormat, dayOfWeekFormat, hourFormat, minuteFormat, secondFormat, languages, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDateTimeFormatterDateTimeContext
   (
      yearFormat : Windows.Globalization.DateTimeFormatting.YearFormat
      ; monthFormat : Windows.Globalization.DateTimeFormatting.MonthFormat
      ; dayFormat : Windows.Globalization.DateTimeFormatting.DayFormat
      ; dayOfWeekFormat : Windows.Globalization.DateTimeFormatting.DayOfWeekFormat
      ; hourFormat : Windows.Globalization.DateTimeFormatting.HourFormat
      ; minuteFormat : Windows.Globalization.DateTimeFormatting.MinuteFormat
      ; secondFormat : Windows.Globalization.DateTimeFormatting.SecondFormat
      ; languages : Windows.Foundation.Collections.IIterable_String
      ; geographicRegion : Windows.String
      ; calendar : Windows.String
      ; clock : Windows.String
   )
   return Windows.Globalization.DateTimeFormatting.IDateTimeFormatter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.DateTimeFormatting.DateTimeFormatter");
      m_Factory     : Windows.Globalization.DateTimeFormatting.IDateTimeFormatterFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.DateTimeFormatting.IDateTimeFormatter := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDateTimeFormatterFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateDateTimeFormatterDateTimeContext(yearFormat, monthFormat, dayFormat, dayOfWeekFormat, hourFormat, minuteFormat, secondFormat, languages, geographicRegion, calendar, clock, RetVal'Access);
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
   
   function get_LongDate
   return Windows.Globalization.DateTimeFormatting.IDateTimeFormatter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.DateTimeFormatting.DateTimeFormatter");
      m_Factory     : IDateTimeFormatterStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.DateTimeFormatting.IDateTimeFormatter;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDateTimeFormatterStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LongDate(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LongTime
   return Windows.Globalization.DateTimeFormatting.IDateTimeFormatter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.DateTimeFormatting.DateTimeFormatter");
      m_Factory     : IDateTimeFormatterStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.DateTimeFormatting.IDateTimeFormatter;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDateTimeFormatterStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LongTime(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ShortDate
   return Windows.Globalization.DateTimeFormatting.IDateTimeFormatter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.DateTimeFormatting.DateTimeFormatter");
      m_Factory     : IDateTimeFormatterStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.DateTimeFormatting.IDateTimeFormatter;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDateTimeFormatterStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ShortDate(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ShortTime
   return Windows.Globalization.DateTimeFormatting.IDateTimeFormatter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.DateTimeFormatting.DateTimeFormatter");
      m_Factory     : IDateTimeFormatterStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.DateTimeFormatting.IDateTimeFormatter;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDateTimeFormatterStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ShortTime(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
