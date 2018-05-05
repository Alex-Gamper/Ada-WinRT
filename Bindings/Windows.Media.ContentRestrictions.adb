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
package body Windows.Media.ContentRestrictions is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IContentRestrictionsBrowsePolicy_Interface
      ; asyncInfo : Windows.Media.ContentRestrictions.IAsyncOperation_IContentRestrictionsBrowsePolicy
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ContentAccessRestrictionLevel_Interface
      ; asyncInfo : Windows.Media.ContentRestrictions.IAsyncOperation_ContentAccessRestrictionLevel
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
   
   function Create
   (
      id : Windows.String
      ; title : Windows.String
      ; category : Windows.Media.ContentRestrictions.RatedContentCategory
   )
   return Windows.Media.ContentRestrictions.IRatedContentDescription is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.ContentRestrictions.RatedContentDescription");
      m_Factory     : Windows.Media.ContentRestrictions.IRatedContentDescriptionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.ContentRestrictions.IRatedContentDescription := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRatedContentDescriptionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(id, title, category, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateRatedContentRestrictions return Windows.Media.ContentRestrictions.IRatedContentRestrictions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.ContentRestrictions.RatedContentRestrictions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.ContentRestrictions.IRatedContentRestrictions) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.ContentRestrictions.IID_IRatedContentRestrictions'Access, RetVal'access);
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
   
end;
