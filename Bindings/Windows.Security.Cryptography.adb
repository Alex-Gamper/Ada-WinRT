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
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Security.Cryptography is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function Compare
   (
      object1 : Windows.Storage.Streams.IBuffer
      ; object2 : Windows.Storage.Streams.IBuffer
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.CryptographicBuffer");
      m_Factory     : ICryptographicBufferStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICryptographicBufferStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Compare(object1, object2, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GenerateRandom
   (
      length : Windows.UInt32
   )
   return Windows.Storage.Streams.IBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.CryptographicBuffer");
      m_Factory     : ICryptographicBufferStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IBuffer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICryptographicBufferStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GenerateRandom(length, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GenerateRandomNumber
   return Windows.UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.CryptographicBuffer");
      m_Factory     : ICryptographicBufferStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICryptographicBufferStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GenerateRandomNumber(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromByteArray
   (
      value : Windows.UInt8_Ptr
   )
   return Windows.Storage.Streams.IBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.CryptographicBuffer");
      m_Factory     : ICryptographicBufferStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IBuffer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICryptographicBufferStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromByteArray(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure CopyToByteArray
   (
      buffer : Windows.Storage.Streams.IBuffer
      ; value : access Windows.UInt8_Ptr
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.CryptographicBuffer");
      m_Factory     : ICryptographicBufferStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICryptographicBufferStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CopyToByteArray(buffer, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function DecodeFromHexString
   (
      value : Windows.String
   )
   return Windows.Storage.Streams.IBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.CryptographicBuffer");
      m_Factory     : ICryptographicBufferStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IBuffer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICryptographicBufferStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.DecodeFromHexString(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function EncodeToHexString
   (
      buffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.CryptographicBuffer");
      m_Factory     : ICryptographicBufferStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICryptographicBufferStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.EncodeToHexString(buffer, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function DecodeFromBase64String
   (
      value : Windows.String
   )
   return Windows.Storage.Streams.IBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.CryptographicBuffer");
      m_Factory     : ICryptographicBufferStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IBuffer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICryptographicBufferStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.DecodeFromBase64String(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function EncodeToBase64String
   (
      buffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.CryptographicBuffer");
      m_Factory     : ICryptographicBufferStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICryptographicBufferStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.EncodeToBase64String(buffer, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ConvertStringToBinary
   (
      value : Windows.String
      ; encoding : Windows.Security.Cryptography.BinaryStringEncoding
   )
   return Windows.Storage.Streams.IBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.CryptographicBuffer");
      m_Factory     : ICryptographicBufferStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IBuffer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICryptographicBufferStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ConvertStringToBinary(value, encoding, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ConvertBinaryToString
   (
      encoding : Windows.Security.Cryptography.BinaryStringEncoding
      ; buffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.CryptographicBuffer");
      m_Factory     : ICryptographicBufferStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICryptographicBufferStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ConvertBinaryToString(encoding, buffer, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
