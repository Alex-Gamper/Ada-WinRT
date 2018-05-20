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
with Windows.Storage;
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Data.Xml.Dom is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IXmlDocument_Interface
      ; asyncInfo : Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create return Windows.Data.Xml.Dom.IXmlDocument is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Xml.Dom.XmlDocument");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Data.Xml.Dom.IXmlDocument) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Data.Xml.Dom.IID_IXmlDocument'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create return Windows.Data.Xml.Dom.IXmlLoadSettings is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Xml.Dom.XmlLoadSettings");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Data.Xml.Dom.IXmlLoadSettings) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Data.Xml.Dom.IID_IXmlLoadSettings'Access, RetVal'access);
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
   
   function LoadFromUriAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Xml.Dom.XmlDocument");
      m_Factory     : IXmlDocumentStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXmlDocumentStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadFromUriAsync(uri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadFromUriWithSettingsAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; loadSettings : Windows.Data.Xml.Dom.IXmlLoadSettings
   )
   return Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Xml.Dom.XmlDocument");
      m_Factory     : IXmlDocumentStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXmlDocumentStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadFromUriWithSettingsAsync(uri, loadSettings, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadFromFileAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Xml.Dom.XmlDocument");
      m_Factory     : IXmlDocumentStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXmlDocumentStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadFromFileAsync(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadFromFileWithSettingsAsync
   (
      file : Windows.Storage.IStorageFile
      ; loadSettings : Windows.Data.Xml.Dom.IXmlLoadSettings
   )
   return Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Xml.Dom.XmlDocument");
      m_Factory     : IXmlDocumentStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXmlDocumentStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadFromFileWithSettingsAsync(file, loadSettings, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
