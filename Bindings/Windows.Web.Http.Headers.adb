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
with Windows.Storage.Streams;
with Windows.Networking;
with Windows.Globalization;
with Windows.Web.Http;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Web.Http.Headers is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateHttpContentHeaderCollection return Windows.Web.Http.Headers.IHttpContentHeaderCollection is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpContentHeaderCollection");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Web.Http.Headers.IHttpContentHeaderCollection) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Web.Http.Headers.IID_IHttpContentHeaderCollection'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      dispositionType : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpContentDispositionHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpContentDispositionHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpContentDispositionHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpContentDispositionHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpContentDispositionHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(dispositionType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromLength
   (
      length : Windows.UInt64
   )
   return Windows.Web.Http.Headers.IHttpContentRangeHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpContentRangeHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpContentRangeHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpContentRangeHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpContentRangeHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromLength(length, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromRange
   (
      from : Windows.UInt64
      ; to : Windows.UInt64
   )
   return Windows.Web.Http.Headers.IHttpContentRangeHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpContentRangeHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpContentRangeHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpContentRangeHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpContentRangeHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromRange(from, to, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromRangeWithLength
   (
      from : Windows.UInt64
      ; to : Windows.UInt64
      ; length : Windows.UInt64
   )
   return Windows.Web.Http.Headers.IHttpContentRangeHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpContentRangeHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpContentRangeHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpContentRangeHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpContentRangeHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromRangeWithLength(from, to, length, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      mediaType : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpMediaTypeHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpMediaTypeHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpMediaTypeHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpMediaTypeHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpMediaTypeHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(mediaType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromScheme
   (
      scheme : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpCredentialsHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpCredentialsHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpCredentialsHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpCredentialsHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpCredentialsHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromScheme(scheme, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromSchemeWithToken
   (
      scheme : Windows.String
      ; token : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpCredentialsHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpCredentialsHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpCredentialsHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpCredentialsHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpCredentialsHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromSchemeWithToken(scheme, token, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromName
   (
      name : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpNameValueHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpNameValueHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpNameValueHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpNameValueHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpNameValueHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromName(name, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromNameWithValue
   (
      name : Windows.String
      ; value : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpNameValueHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpNameValueHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpNameValueHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpNameValueHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpNameValueHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromNameWithValue(name, value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromScheme
   (
      scheme : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpChallengeHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpChallengeHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpChallengeHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpChallengeHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpChallengeHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromScheme(scheme, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromSchemeWithToken
   (
      scheme : Windows.String
      ; token : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpChallengeHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpChallengeHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpChallengeHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpChallengeHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpChallengeHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromSchemeWithToken(scheme, token, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      token : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpConnectionOptionHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpConnectionOptionHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(token, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      contentCoding : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpContentCodingHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpContentCodingHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpContentCodingHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpContentCodingHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpContentCodingHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(contentCoding, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromName
   (
      name : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpCookiePairHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpCookiePairHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpCookiePairHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpCookiePairHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpCookiePairHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromName(name, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromNameWithValue
   (
      name : Windows.String
      ; value : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpCookiePairHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpCookiePairHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpCookiePairHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpCookiePairHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpCookiePairHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromNameWithValue(name, value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromName
   (
      name : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpExpectationHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpExpectationHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpExpectationHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpExpectationHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpExpectationHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromName(name, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromNameWithValue
   (
      name : Windows.String
      ; value : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpExpectationHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpExpectationHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpExpectationHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpExpectationHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpExpectationHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromNameWithValue(name, value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromLanguageRange
   (
      languageRange : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpLanguageRangeWithQualityHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpLanguageRangeWithQualityHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromLanguageRange(languageRange, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromLanguageRangeWithQuality
   (
      languageRange : Windows.String
      ; quality : Windows.Double
   )
   return Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpLanguageRangeWithQualityHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpLanguageRangeWithQualityHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromLanguageRangeWithQuality(languageRange, quality, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromMediaType
   (
      mediaType : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpMediaTypeWithQualityHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpMediaTypeWithQualityHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromMediaType(mediaType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromMediaTypeWithQuality
   (
      mediaType : Windows.String
      ; quality : Windows.Double
   )
   return Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpMediaTypeWithQualityHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpMediaTypeWithQualityHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromMediaTypeWithQuality(mediaType, quality, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromName
   (
      productName : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpProductHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpProductHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpProductHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpProductHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpProductHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromName(productName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromNameWithVersion
   (
      productName : Windows.String
      ; productVersion : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpProductHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpProductHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpProductHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpProductHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpProductHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromNameWithVersion(productName, productVersion, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromComment
   (
      productComment : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpProductInfoHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpProductInfoHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpProductInfoHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpProductInfoHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpProductInfoHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromComment(productComment, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromNameWithVersion
   (
      productName : Windows.String
      ; productVersion : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpProductInfoHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpProductInfoHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpProductInfoHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpProductInfoHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpProductInfoHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromNameWithVersion(productName, productVersion, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromValue
   (
      contentCoding : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpContentCodingWithQualityHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpContentCodingWithQualityHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromValue(contentCoding, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromValueWithQuality
   (
      contentCoding : Windows.String
      ; quality : Windows.Double
   )
   return Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpContentCodingWithQualityHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpContentCodingWithQualityHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromValueWithQuality(contentCoding, quality, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpTransferCodingHeaderValue");
      m_Factory     : Windows.Web.Http.Headers.IHttpTransferCodingHeaderValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpTransferCodingHeaderValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(input, RetVal'Access);
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
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpContentDispositionHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpContentDispositionHeaderValue");
      m_Factory     : IHttpContentDispositionHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpContentDispositionHeaderValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpContentDispositionHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Parse(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParse
   (
      input : Windows.String
      ; contentDispositionHeaderValue : access Windows.Web.Http.Headers.IHttpContentDispositionHeaderValue
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpContentDispositionHeaderValue");
      m_Factory     : IHttpContentDispositionHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpContentDispositionHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParse(input, contentDispositionHeaderValue, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpContentRangeHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpContentRangeHeaderValue");
      m_Factory     : IHttpContentRangeHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpContentRangeHeaderValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpContentRangeHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Parse(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParse
   (
      input : Windows.String
      ; contentRangeHeaderValue : access Windows.Web.Http.Headers.IHttpContentRangeHeaderValue
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpContentRangeHeaderValue");
      m_Factory     : IHttpContentRangeHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpContentRangeHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParse(input, contentRangeHeaderValue, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpMediaTypeHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpMediaTypeHeaderValue");
      m_Factory     : IHttpMediaTypeHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpMediaTypeHeaderValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpMediaTypeHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Parse(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParse
   (
      input : Windows.String
      ; mediaTypeHeaderValue : access Windows.Web.Http.Headers.IHttpMediaTypeHeaderValue
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpMediaTypeHeaderValue");
      m_Factory     : IHttpMediaTypeHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpMediaTypeHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParse(input, mediaTypeHeaderValue, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpCredentialsHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpCredentialsHeaderValue");
      m_Factory     : IHttpCredentialsHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpCredentialsHeaderValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpCredentialsHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Parse(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParse
   (
      input : Windows.String
      ; credentialsHeaderValue : access Windows.Web.Http.Headers.IHttpCredentialsHeaderValue
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpCredentialsHeaderValue");
      m_Factory     : IHttpCredentialsHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpCredentialsHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParse(input, credentialsHeaderValue, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpDateOrDeltaHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpDateOrDeltaHeaderValue");
      m_Factory     : IHttpDateOrDeltaHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpDateOrDeltaHeaderValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpDateOrDeltaHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Parse(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParse
   (
      input : Windows.String
      ; dateOrDeltaHeaderValue : access Windows.Web.Http.Headers.IHttpDateOrDeltaHeaderValue
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpDateOrDeltaHeaderValue");
      m_Factory     : IHttpDateOrDeltaHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpDateOrDeltaHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParse(input, dateOrDeltaHeaderValue, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpNameValueHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpNameValueHeaderValue");
      m_Factory     : IHttpNameValueHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpNameValueHeaderValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpNameValueHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Parse(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParse
   (
      input : Windows.String
      ; nameValueHeaderValue : access Windows.Web.Http.Headers.IHttpNameValueHeaderValue
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpNameValueHeaderValue");
      m_Factory     : IHttpNameValueHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpNameValueHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParse(input, nameValueHeaderValue, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpChallengeHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpChallengeHeaderValue");
      m_Factory     : IHttpChallengeHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpChallengeHeaderValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpChallengeHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Parse(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParse
   (
      input : Windows.String
      ; challengeHeaderValue : access Windows.Web.Http.Headers.IHttpChallengeHeaderValue
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpChallengeHeaderValue");
      m_Factory     : IHttpChallengeHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpChallengeHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParse(input, challengeHeaderValue, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpConnectionOptionHeaderValue");
      m_Factory     : IHttpConnectionOptionHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpConnectionOptionHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Parse(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParse
   (
      input : Windows.String
      ; connectionOptionHeaderValue : access Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpConnectionOptionHeaderValue");
      m_Factory     : IHttpConnectionOptionHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpConnectionOptionHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParse(input, connectionOptionHeaderValue, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpContentCodingHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpContentCodingHeaderValue");
      m_Factory     : IHttpContentCodingHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpContentCodingHeaderValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpContentCodingHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Parse(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParse
   (
      input : Windows.String
      ; contentCodingHeaderValue : access Windows.Web.Http.Headers.IHttpContentCodingHeaderValue
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpContentCodingHeaderValue");
      m_Factory     : IHttpContentCodingHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpContentCodingHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParse(input, contentCodingHeaderValue, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpCookiePairHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpCookiePairHeaderValue");
      m_Factory     : IHttpCookiePairHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpCookiePairHeaderValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpCookiePairHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Parse(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParse
   (
      input : Windows.String
      ; cookiePairHeaderValue : access Windows.Web.Http.Headers.IHttpCookiePairHeaderValue
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpCookiePairHeaderValue");
      m_Factory     : IHttpCookiePairHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpCookiePairHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParse(input, cookiePairHeaderValue, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpExpectationHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpExpectationHeaderValue");
      m_Factory     : IHttpExpectationHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpExpectationHeaderValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpExpectationHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Parse(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParse
   (
      input : Windows.String
      ; expectationHeaderValue : access Windows.Web.Http.Headers.IHttpExpectationHeaderValue
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpExpectationHeaderValue");
      m_Factory     : IHttpExpectationHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpExpectationHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParse(input, expectationHeaderValue, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpLanguageRangeWithQualityHeaderValue");
      m_Factory     : IHttpLanguageRangeWithQualityHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpLanguageRangeWithQualityHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Parse(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParse
   (
      input : Windows.String
      ; languageRangeWithQualityHeaderValue : access Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpLanguageRangeWithQualityHeaderValue");
      m_Factory     : IHttpLanguageRangeWithQualityHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpLanguageRangeWithQualityHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParse(input, languageRangeWithQualityHeaderValue, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpMediaTypeWithQualityHeaderValue");
      m_Factory     : IHttpMediaTypeWithQualityHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpMediaTypeWithQualityHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Parse(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParse
   (
      input : Windows.String
      ; mediaTypeWithQualityHeaderValue : access Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpMediaTypeWithQualityHeaderValue");
      m_Factory     : IHttpMediaTypeWithQualityHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpMediaTypeWithQualityHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParse(input, mediaTypeWithQualityHeaderValue, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpProductHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpProductHeaderValue");
      m_Factory     : IHttpProductHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpProductHeaderValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpProductHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Parse(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParse
   (
      input : Windows.String
      ; productHeaderValue : access Windows.Web.Http.Headers.IHttpProductHeaderValue
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpProductHeaderValue");
      m_Factory     : IHttpProductHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpProductHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParse(input, productHeaderValue, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpProductInfoHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpProductInfoHeaderValue");
      m_Factory     : IHttpProductInfoHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpProductInfoHeaderValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpProductInfoHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Parse(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParse
   (
      input : Windows.String
      ; productInfoHeaderValue : access Windows.Web.Http.Headers.IHttpProductInfoHeaderValue
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpProductInfoHeaderValue");
      m_Factory     : IHttpProductInfoHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpProductInfoHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParse(input, productInfoHeaderValue, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpContentCodingWithQualityHeaderValue");
      m_Factory     : IHttpContentCodingWithQualityHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpContentCodingWithQualityHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Parse(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParse
   (
      input : Windows.String
      ; contentCodingWithQualityHeaderValue : access Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpContentCodingWithQualityHeaderValue");
      m_Factory     : IHttpContentCodingWithQualityHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpContentCodingWithQualityHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParse(input, contentCodingWithQualityHeaderValue, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpTransferCodingHeaderValue");
      m_Factory     : IHttpTransferCodingHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpTransferCodingHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Parse(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParse
   (
      input : Windows.String
      ; transferCodingHeaderValue : access Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Headers.HttpTransferCodingHeaderValue");
      m_Factory     : IHttpTransferCodingHeaderValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpTransferCodingHeaderValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParse(input, transferCodingHeaderValue, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
