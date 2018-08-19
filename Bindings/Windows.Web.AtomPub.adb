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
with Windows.Web.Syndication;
with Windows.Data.Xml.Dom;
with Windows.Storage.Streams;
with Windows.Security.Credentials;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Web.AtomPub is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create return Windows.Web.AtomPub.IAtomPubClient is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.AtomPub.AtomPubClient");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Web.AtomPub.IAtomPubClient) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Web.AtomPub.IID_IAtomPubClient'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateAtomPubClientWithCredentials
   (
      serverCredential : Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.Web.AtomPub.IAtomPubClient is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.AtomPub.AtomPubClient");
      m_Factory     : Windows.Web.AtomPub.IAtomPubClientFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.AtomPub.IAtomPubClient := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAtomPubClientFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAtomPubClientWithCredentials(serverCredential, RetVal'Access);
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
   
end;
