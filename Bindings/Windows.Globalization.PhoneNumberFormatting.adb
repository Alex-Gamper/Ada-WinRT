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
-- along with this program.If not, see < http://www.gnu.org/licenses/>.       --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Foundation;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Globalization.PhoneNumberFormatting is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create
   (
      number : Windows.String
   )
   return Windows.Globalization.PhoneNumberFormatting.IPhoneNumberInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.PhoneNumberFormatting.PhoneNumberInfo");
      m_Factory     : Windows.Globalization.PhoneNumberFormatting.IPhoneNumberInfoFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.PhoneNumberFormatting.IPhoneNumberInfo := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPhoneNumberInfoFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(number, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create return Windows.Globalization.PhoneNumberFormatting.IPhoneNumberFormatter is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.PhoneNumberFormatting.PhoneNumberFormatter");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Globalization.PhoneNumberFormatting.IPhoneNumberFormatter) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Globalization.PhoneNumberFormatting.IID_IPhoneNumberFormatter'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function TryParse
   (
      input : Windows.String
      ; phoneNumber : access Windows.Globalization.PhoneNumberFormatting.IPhoneNumberInfo
   )
   return Windows.Globalization.PhoneNumberFormatting.PhoneNumberParseResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.PhoneNumberFormatting.PhoneNumberInfo");
      m_Factory     : IPhoneNumberInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.PhoneNumberFormatting.PhoneNumberParseResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPhoneNumberInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParse(input, phoneNumber, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParseWithRegion
   (
      input : Windows.String
      ; regionCode : Windows.String
      ; phoneNumber : access Windows.Globalization.PhoneNumberFormatting.IPhoneNumberInfo
   )
   return Windows.Globalization.PhoneNumberFormatting.PhoneNumberParseResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.PhoneNumberFormatting.PhoneNumberInfo");
      m_Factory     : IPhoneNumberInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.PhoneNumberFormatting.PhoneNumberParseResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPhoneNumberInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParseWithRegion(input, regionCode, phoneNumber, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure TryCreate
   (
      regionCode : Windows.String
      ; phoneNumber : access Windows.Globalization.PhoneNumberFormatting.IPhoneNumberFormatter
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.PhoneNumberFormatting.PhoneNumberFormatter");
      m_Factory     : IPhoneNumberFormatterStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPhoneNumberFormatterStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryCreate(regionCode, phoneNumber);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetCountryCodeForRegion
   (
      regionCode : Windows.String
   )
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.PhoneNumberFormatting.PhoneNumberFormatter");
      m_Factory     : IPhoneNumberFormatterStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPhoneNumberFormatterStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetCountryCodeForRegion(regionCode, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetNationalDirectDialingPrefixForRegion
   (
      regionCode : Windows.String
      ; stripNonDigit : Windows.Boolean
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.PhoneNumberFormatting.PhoneNumberFormatter");
      m_Factory     : IPhoneNumberFormatterStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPhoneNumberFormatterStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetNationalDirectDialingPrefixForRegion(regionCode, stripNonDigit, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function WrapWithLeftToRightMarkers
   (
      number : Windows.String
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.PhoneNumberFormatting.PhoneNumberFormatter");
      m_Factory     : IPhoneNumberFormatterStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPhoneNumberFormatterStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.WrapWithLeftToRightMarkers(number, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
